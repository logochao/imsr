/**
 * 
 */
package com.radius.invoicing.sysmanage.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.radius.base.controller.BaseController;
import com.radius.base.helper.PropertyConfigHelper;
import com.radius.base.page.EasyuiSplitPager;
import com.radius.base.utils.JsonUtils;
import com.radius.invoicing.cache.impl.CategoryCacheImpl;
import com.radius.invoicing.cache.impl.SpecTypeCacheImpl;
import com.radius.invoicing.enums.SexEnums;
import com.radius.invoicing.enums.UseStatusEnums;
import com.radius.invoicing.enums.YesOrNoEnums;
import com.radius.invoicing.ibatis.model.CategoryCode;
import com.radius.invoicing.ibatis.model.SpecType;
import com.radius.invoicing.sysmanage.service.SpecTypeService;

/**
 * @author <a href="mailto:goodluck.sunlight@gmail.com">陈波宁</a>
 * @version 创建时间：2013-12-8 下午12:53:04<br/>
 * Copyright (c) 2013 by 陈波宁.<br/>
 * 类说明  系统公共调用方法 主要是一个字典函数
 */
@Controller
@Scope("request")
@SuppressWarnings("static-access")
public class CommonController extends BaseController{

	@Autowired(required=false)
	@Qualifier("categoryCacheImpl")
	private CategoryCacheImpl categoryCache;
	
	@Autowired(required=false)
	@Qualifier("specTypeCacheImpl")
	private SpecTypeCacheImpl specTypeCache;
	
	@Autowired(required=false)
	@Qualifier("propertyConfigHelper")
	private PropertyConfigHelper propertyConfigHelper;
	
	@Autowired(required=false)
	@Qualifier("specTypeServiceImpl")
	private SpecTypeService specTypeService;
	
	private final String prefix="/jsp/business/spectype/";
	
	private String spec_type_view=null;
	
	
	@PostConstruct
	public void init(){
		if(spec_type_view==null){
			spec_type_view=prefix+"spec_type_index.jsp";
		}
	}
	
	
	/**
	 * 获取分类代码列表
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/system/category_code_list.html")
	@ResponseBody
	public List<CategoryCode> getCategoryCodeList(HttpServletRequest request,HttpServletResponse response)throws Exception{
		Integer parentId = ServletRequestUtils.getIntParameter(request, "parentId", 0);//获取参数值
		return categoryCache.getCategoryCodeListByParentId(parentId);
	} 
	
	/**
	 *获取规格信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/system/spec_type.html")
	@ResponseBody
	public SpecType getSpecType(HttpServletRequest request,HttpServletResponse response)throws Exception{
		Integer specTypeId = ServletRequestUtils.getIntParameter(request, "specTypeId", 0);//获取参数值
		return specTypeCache.getSpecTypeBySpecTypeId(specTypeId);
	}
	/**
	 * 获取规格信息列表
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/system/spec_type_list.html")
	@ResponseBody
	public List<SpecType> getSpecTypeList(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String key =propertyConfigHelper.getPropertyValue("spec.type.cached.root").toString();
		return specTypeCache.getSpecTypeList(key);
	}
	
	/**
	 * 规格管理界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/system/manager/common/spec_type_view.html")
	public ModelAndView specType(HttpServletRequest request,HttpServletResponse response)throws Exception{
		return new ModelAndView(spec_type_view);
	}
	
	
	
	
	/**
	 * 上传文件
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/common/system/file_upload_list.html")
	public void fileUploader(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String repositoryPath = System.getProperty("java.io.tmpdir");
		String root = request.getSession().getServletContext().getRealPath("/")+"image/";//默认设置为stock下的image文件夹下
		Object path=propertyConfigHelper.getPropertyValue("contract.image.file.path");
		String uploadPath=path==null?root:path.toString();
		File up = new File(uploadPath);
		if(!up.exists()){
			up.mkdir();
		}
		
		response.setCharacterEncoding("UTF-8");
		Integer schunk = null;//分割块数
		Integer schunks = null;//总分割数
		String name = null;//文件名
		BufferedOutputStream outputStream=null; 
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(1024);
				factory.setRepository(new File(repositoryPath));//设置临时目录
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setHeaderEncoding("UTF-8");
				upload.setSizeMax(5 * 1024 * 1024);//设置附近大小
				List<FileItem> items = upload.parseRequest(request);
				//生成新文件名
				String newFileName = null;
				for (FileItem item : items) {
					if (!item.isFormField()) {// 如果是文件类型
						name = item.getName();// 获得文件名
						newFileName = UUID.randomUUID().toString().replace("-","").concat(".").concat(FilenameUtils.getExtension(name));
						if (name != null) {
							String nFname = newFileName;
							if (schunk != null) {
								nFname = schunk + "_" + name;
							}
							File savedFile = new File(uploadPath, nFname);
							item.write(savedFile);
						}
					} else {
						//判断是否带分割信息
						if (item.getFieldName().equals("chunk")) {
							schunk = Integer.parseInt(item.getString());
						}
						if (item.getFieldName().equals("chunks")) {
							schunks = Integer.parseInt(item.getString());
						}
					}
				}
				
				if (schunk != null && schunk + 1 == schunks) {
					outputStream = new BufferedOutputStream(new FileOutputStream(new File(uploadPath, newFileName)));
					//遍历文件合并
					for (int i = 0; i < schunks; i++) {
						File tempFile=new File(uploadPath,i+"_"+name);
						byte[] bytes=FileUtils.readFileToByteArray(tempFile);  
						outputStream.write(bytes);
						outputStream.flush();
						tempFile.delete();
					}
					outputStream.flush();
				}
				response.getWriter().write("{\"status\":true,\"newName\":\""+newFileName+"\"}");
			} catch (FileUploadException e) {
				e.printStackTrace();
				response.getWriter().write("{\"status\":false}");
			} catch (Exception e) {
				e.printStackTrace();
				response.getWriter().write("{\"status\":false}");
			}finally{  
	            try {  
	            	if(outputStream!=null)
	            		outputStream.close();  
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        }   
		}
	}
	
	@RequestMapping("/common/system/use_status_list.html")
	public void getUseStatusJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String json=UseStatusEnums.getUseStatusEnums2Json();
		super.ajaxMethod(response, json, "获取使用状态信息发生异常");
	}
	
	@RequestMapping("/common/system/yes_no_list.html")
	public void getYesOrNoJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String  json  =YesOrNoEnums.getYesOrNoEnums2Json();
		super.ajaxMethod(response, json, "获取是与否信息发生异常");
	}
	
	@RequestMapping("/common/system/sex_list.html")
	public void getSexJson(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String json=SexEnums.getSexEnums2Json();
		super.ajaxMethod(response, json, "获取性别信息发生异常");
	}
	
	
	
	
	/**
	 * 添加规格信息
	 * @param request
	 * @param response
	 * @param specType
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/system/manage/common/spec_type_info_add.html")
	@ResponseBody
	public JsonUtils addSpecTypeInfo(HttpServletRequest request,HttpServletResponse response,SpecType specType)throws Exception{
		String ledgerId ="0001";
		String creator ="0001";
		specType.setLedgerId(ledgerId);
		specType.setCreater(creator);
		return specTypeService.saveSpecTypeInfo(specType);
	}
	
	@RequestMapping("/system/manage/common/spec_type_info_list.html")
	@ResponseBody
	public EasyuiSplitPager<SpecType> getSpecTypeInfoList(HttpServletRequest request,HttpServletResponse response,SpecType specType)throws Exception{
		return specTypeService.getSpecTypeInfoList(specType);
	}
	
	
	
	
	
	
	@PreDestroy
	public void destroy(){
		if(spec_type_view!=null){
			spec_type_view=null;
		}
	}
}
