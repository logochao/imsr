package com.raduis.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


public class MainJDBC {

    private Connection  conn=null;
    
    private Map<String,String> dataTypeMap=new HashMap<String, String>();
    private DBHelper  dbHelper = null;
    public MainJDBC() {
        dbHelper =new DBHelper();
        dataTypeMap.put("char", "String");
        dataTypeMap.put("varchar", "String");
        dataTypeMap.put("text", "String");
        dataTypeMap.put("int", "Integer");
        dataTypeMap.put("date", "Date");
        dataTypeMap.put("datetime", "Date");
        conn = dbHelper.conn;
    }
    /**
     * 构建类属性字段
     * @param tableName
     * @return
     */
    public String buildClassFileds(String tableName){
       StringBuffer bf=null;
        try{
            String sql="SELECT COLUMN_NAME,DATA_TYPE FROM information_schema.columns WHERE table_name='"+tableName+"'";
            ResultSet  rs =conn.createStatement().executeQuery(sql);
            bf=new StringBuffer();
            while(rs.next()){
               String columName= rs.getString("COLUMN_NAME");
               String dataType= rs.getString("DATA_TYPE");
               if(dataTypeMap.containsKey(dataType.toLowerCase())){
                   dataType=dataTypeMap.get(dataType.toLowerCase());
                   bf.append("private   ").append(dataType).append("     ").append(rebuildString(columName.toLowerCase())).append(";\n");
               }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        }
        return   bf.toString();
    }
    /**
     * 构建sql语句中的字段
     * @param tableName
     * @return
     */
    public String buildSQLFileds(String tableName){
        StringBuffer bf=null;
        try{
            String sql="SELECT COLUMN_NAME,DATA_TYPE FROM information_schema.columns WHERE table_name='"+tableName+"'";
            ResultSet  rs =conn.createStatement().executeQuery(sql);
            bf=new StringBuffer();
            while(rs.next()){
               String columName= rs.getString("COLUMN_NAME");
               bf.append(columName).append(" ").append(rebuildString(columName.toLowerCase())).append(",");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        }
        return   bf.substring(0, bf.length()-1);
    }
    
    /**
     * 生成ibatis的insert语句
     * @param tableName
     * @return
     */
    public String insertSQL(String tableName){
        StringBuffer bf=null;
        Map<String,String> schema=new HashMap<String, String>();
        try{
            String sql="SELECT COLUMN_NAME,DATA_TYPE FROM information_schema.columns WHERE table_name='"+tableName+"'";
            ResultSet  rs =conn.createStatement().executeQuery(sql);
            bf=new StringBuffer();
            String columName="";
            String dataType="";
            while(rs.next()){
               columName= rs.getString("COLUMN_NAME");
               dataType= rs.getString("DATA_TYPE");
               schema.put(columName, dataType);
            }
            bf.append("INSERT INTO ").append(tableName.toUpperCase()).append(" ");
            buildInsertColums(bf, schema);
            bf.append(" VALUES ");
            buildInsertValueColums(bf, schema);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        }
        return   bf.toString();
    }
    /**
     * 生成查询条件
     * @param tableName
     * @return
     */
    public String buildWhereConditionSQL(String tableName){
        StringBuffer bf=null;
        try{
            String sql="SELECT COLUMN_NAME,DATA_TYPE FROM information_schema.columns WHERE table_name='"+tableName+"'";
            ResultSet  rs =conn.createStatement().executeQuery(sql);
            bf=new StringBuffer();
            bf.append("<sql id=\"whereLike\">\n     ").append("<dynamic prepend=\"WHERE\">\n 1=1 \n");
            String columName="";
            String dataType="";
            while(rs.next()){
               columName= rs.getString("COLUMN_NAME");
               dataType= rs.getString("DATA_TYPE");
               if(dataTypeMap.containsKey(dataType.toLowerCase())){
                   dataType=dataTypeMap.get(dataType.toLowerCase());
                   if(dataType.equalsIgnoreCase("String")){
                       bf.append("<isNotEmpty property=\""+rebuildString(columName.toLowerCase())+"\"> AND "+columName+"=#"+rebuildString(columName.toLowerCase())+"#"+"</isNotEmpty>\n");
                    }else {
                        bf.append("<isNotNull  property=\""+rebuildString(columName.toLowerCase())+"\">  AND "+columName+"=#"+rebuildString(columName.toLowerCase())+"#"+"</isNotNull>\n");
                    }
               }
            }
            bf.append("     </dynamic>\n</sql>");
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        }
        return   bf.toString();
    }
    
    /**
     * 生成ibatis update更新语句
     * @param tableName
     */
    public String updateSQL(String tableName){
        StringBuffer bf=null;
        try{
            String sql="SELECT COLUMN_NAME,DATA_TYPE FROM information_schema.columns WHERE table_name='"+tableName+"'";
            ResultSet  rs =conn.createStatement().executeQuery(sql);
            bf=new StringBuffer();
            bf.append("UPDATE ").append(tableName.toUpperCase()).append("\n").append("<dynamic prepend=\"SET\">\n");
            String columName="";
            String dataType="";
            while(rs.next()){
               columName= rs.getString("COLUMN_NAME");
               dataType= rs.getString("DATA_TYPE");
               if(dataTypeMap.containsKey(dataType.toLowerCase())){
                   dataType=dataTypeMap.get(dataType.toLowerCase());
                   if(dataType.equalsIgnoreCase("String")){
                       bf.append("<isNotEmpty  prepend=\",\"   property=\""+rebuildString(columName.toLowerCase())+"\">  "+columName+"=#"+rebuildString(columName.toLowerCase())+"#"+"</isNotEmpty>\n");
                    }else {
                        bf.append("<isNotNull  prepend=\",\"   property=\""+rebuildString(columName.toLowerCase())+"\">  "+columName+"=#"+rebuildString(columName.toLowerCase())+"#"+"</isNotNull>\n");
                    }
               }
            }
            bf.append("</dynamic>\n WHRER 待写更新条件");
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        }
        return   bf.substring(0, bf.length());
    }
    /**
     * 生成ibatis resultMap 结构
     * @param tableName
     * @return
     */
    public String buildResultMap(String tableName){
        StringBuffer bf=null;
        try{
            String sql="SELECT COLUMN_NAME,DATA_TYPE FROM information_schema.columns WHERE table_name='"+tableName+"'";
            ResultSet  rs =conn.createStatement().executeQuery(sql);
            bf=new StringBuffer();
            String columName="";
            String dataType="";
            while(rs.next()){
               columName= rs.getString("COLUMN_NAME");
               dataType= rs.getString("DATA_TYPE");
               if(dataTypeMap.containsKey(dataType.toLowerCase())){
                   if(dataTypeMap.get(dataType.toLowerCase()).equalsIgnoreCase("String")){
                       bf.append("<result column=\""+columName+"\" jdbcType=\""+dataType+"\" javaType=\"java.lang.String\" property=\""+rebuildString(columName.toLowerCase())+"\" />\n");
                    }else if(dataTypeMap.get(dataType.toLowerCase()).equalsIgnoreCase("int")){
                        bf.append("<result  column=\""+columName+"\" jdbcType=\""+dataType+"\" javaType=\"java.lang.Integer\" property=\""+rebuildString(columName.toLowerCase())+"\"/>\n");
                    }else if(dataTypeMap.get(dataType.toLowerCase()).equalsIgnoreCase("date")){
                        bf.append("<result  column=\""+columName+"\" jdbcType=\""+dataType+"\" javaType=\"java.util.Date\" property=\""+rebuildString(columName.toLowerCase())+"\"/>\n");
                    }
               }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        }
        return   bf.substring(0, bf.length()-1);
    }
    
    /**
     * 构建insert字段列
     * @param bf
     * @param schema
     */
    private void buildInsertColums(StringBuffer bf,Map<String,String> schema){
        String dataType="";
        String columName="";
        Iterator<String> iter = schema.keySet().iterator();
        bf.append(" (\n");
        while (iter.hasNext()) {
            columName = iter.next();
            dataType = schema.get(columName);
            if(dataTypeMap.containsKey(dataType.toLowerCase())){
                dataType=dataTypeMap.get(dataType.toLowerCase());//数据类型
                if(dataType.equalsIgnoreCase("String")){
                   bf.append("<isNotEmpty property=\""+rebuildString(columName.toLowerCase())+"\">"+columName+",</isNotEmpty>\n");
                }else {
                    bf.append("<isNotNull  property=\""+rebuildString(columName.toLowerCase())+"\">"+columName+",</isNotNull>\n");
                }
            }
        }
        bf.append(")\n");
    }
    
    /**
     * 构建insert字段值列
     * @param bf
     * @param schema
     */
    private void buildInsertValueColums(StringBuffer bf,Map<String,String> schema){
        String dataType="";
        String columName="";
        Iterator<String> iter = schema.keySet().iterator();
        bf.append(" (\n");
        while (iter.hasNext()) {
            columName= iter.next();
             dataType= schema.get(columName);
            if(dataTypeMap.containsKey(dataType.toLowerCase())){
                dataType=dataTypeMap.get(dataType.toLowerCase());//数据类型
                if(dataType.equalsIgnoreCase("String")){
                   bf.append("<isNotEmpty property=\""+rebuildString(columName.toLowerCase())+"\">#"+rebuildString(columName.toLowerCase())+"#,</isNotEmpty>\n");
                }else {
                    bf.append("<isNotNull  property=\""+rebuildString(columName.toLowerCase())+"\">#"+rebuildString(columName.toLowerCase())+"#</isNotNull>\n");
                }
            }
        }
        bf.append(")");
    }
    private String rebuildString(String filed){
        StringBuffer bf = new StringBuffer();
        if(filed.indexOf("_")>-1){
            bf = new StringBuffer();
            String fileds[]=filed.split("_");
            for(int i=0;i<fileds.length;i++){
                if(i==0){
                    bf.append(fileds[i]);
                }else{
                    bf.append(fileds[i].substring(0, 1).toUpperCase()+fileds[i].replaceFirst("\\w",""));
                }
            }
            return  bf.toString();
        }
        return filed;
    }
    
    public static void main(String[] args) throws InterruptedException {
        MainJDBC jdbc=new MainJDBC();
        
        System.err.println("-------------------生成查询列字段SQL语句----------------------");
        String content=jdbc.buildSQLFileds("rs_purchase_contract");
        System.out.println(content);
        Thread.sleep(1000);
        System.err.println("-------------------生成insert SQL 语句----------------------");
        content=jdbc.insertSQL("rs_purchase_contract");
        System.out.println(content);
        Thread.sleep(1000);
        System.err.println("-------------------生成update SQL 语句----------------------");
        content=jdbc.updateSQL("rs_purchase_contract");
        System.out.println(content);
        Thread.sleep(1000);
        System.err.println("-------------------生成Where SQL 语句----------------------");
        content=jdbc.buildWhereConditionSQL("rs_purchase_contract");
        System.out.println(content);
        Thread.sleep(1000);
        System.err.println("-------------------生成ibatis resultMap 结构----------------------");
        content=jdbc.buildResultMap("rs_purchase_contract");
        System.out.println(content);  
        Thread.sleep(1000);
        System.err.println("-------------------生成class 类属性----------------------");
        content=jdbc.buildClassFileds("rs_purchase_contract");
        System.out.println(content); 
    }
}
