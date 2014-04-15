#销售合同状态 3500 start
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3501,'未确认',3500,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3502,'已确认',3500,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3503,'待拆分',3500,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3504,'已拆分',3500,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3505,'拆分已确认',3500,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3506,'采购中',3500,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3507,'已验收',3500,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3508,'未出库',3500,0001,NOW());
##采购订单状态 3520 start 
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3521,'未确认',3520,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3522,'已确认',3520,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3523,'已合并',3520,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3524,'采购中',3520,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3525,'已采购',3520,0001,NOW());
#合同状态 3540 start
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3541,'未确认',3540,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3542,'已确认',3540,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3543,'审核中',3540,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (3544,'已审核',3540,0001,NOW());



##商品产地###
#国产为100个 省份简称-具体市(县)
INSERT INTO `rs_category_code`  
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(201,'国产-京-朝阳',200,'0001',NOW());
INSERT INTO `rs_category_code`  
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(202,'国产-津-河西',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(203,'国产-冀-唐山',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(204,'国产-晋-大同',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(205,'国产-沪-浦东',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(206,'国产-内蒙-赤峰',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(207,'国产-辽-xx',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(208,'国产-吉-xx',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(209,'国产-闽-泉州',200,'0001',NOW());
#进口为100个 #进口#-#国名简称#
INSERT INTO `rs_category_code`  
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(211,'进口-AF-阿富汗',200,'0001',NOW());
INSERT INTO `rs_category_code`  
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(212,'进口-AX-奥兰群岛',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(213,'进口-BE-比利时',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(214,'进口-CL-智利',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(215,'进口-FR-法国',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(216,'进口-DE-德国',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(217,'进口-JP-日本',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(218,'进口-NL-荷兰',200,'0001',NOW());
INSERT INTO `rs_category_code` 
(`category_id`,`category_name`,`category_type`,`creater`,`createdate`)
VALUES
(219,'进口-RU-俄罗斯联邦',200,'0001',NOW());


#商品分类 2600
#一类
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2601,'工业',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2602,'科学',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2603,'摄影',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2604,'农业',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2605,'园艺和林业的化学品',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2606,'未加工人造合成树脂',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2607,'未加工塑料物质',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2608,'肥料',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2609,'灭火用合成物',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2610,'淬火和焊接用制剂',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2611,'保存食品用化学品',2600,'0001',NOW());

INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2612,'鞣料',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2613,'工业粘合剂 ',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2614,'工业用油和油脂',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2615,'润滑剂',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2616,'吸收、润湿和粘结灰尘用合成物',2600,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(2617,'燃料（包括马达用燃料）和照明材料',2600,'0001',NOW());

#商品状态 1100
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(1101,'未确认',1100,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(1102,'已确认',1100,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(1103,'试销',1100,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(1104,'评估',1100,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(1105,'缺货',1100,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(1106,'清仓',1100,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(1107,'删除',1100,'0001',NOW());
	
##销售方式 3600

 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3601,'软文营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3602,'博客营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3603,'论坛营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3604,'热门事件营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3605,'媒体营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3606,'资源合作营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3607,'产品包装营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3608,'体验式营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3609,'关系营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3610,'网络营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3611,'连锁营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3612,'品牌式营销',3600,'0001',NOW());
 INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`)VALUES(3613,'深度营销',3600,'0001',NOW());

#送货方式 1600
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (1601,'自营',1600,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (1602,'顺丰',1600,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (1603,'申通',1600,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (1604,'中通',1600,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (1605,'圆通',1600,0001,NOW());
INSERT INTO rs_category_code(category_id,category_name,category_type,creater,createdate) VALUES (1606,'EMS',1600,0001,NOW());

##商品状态 3700
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate)VALUES(3701,'液态',3700,'0001',NOW());
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate)VALUES(3702,'固态',3700,'0001',NOW());


###全国市场区域 3800~5500 ###
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate) VALUES (3801,'华东地区',3800,'0001',NOW());
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate) VALUES (3901,'华南地区',3800,'0001',NOW());
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate) VALUES (4001,'华中地区',3800,'0001',NOW());
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate) VALUES (4101,'华北地区',3800,'0001',NOW());
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate) VALUES (4201,'西北地区',3800,'0001',NOW());
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate) VALUES (4301,'西南地区',3800,'0001',NOW());
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate) VALUES (4401,'东北地区',3800,'0001',NOW());
INSERT INTO rs_category_code (category_id,category_name,category_type,creater,createdate) VALUES (4501,'台港澳地区',3800,'0001',NOW());

###表单状态2400 未确认、已确认 
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`) VALUES (2401,'未确认',2400,'0001',NOW());
INSERT INTO `rs_category_code` (`category_id`,`category_name`,`category_type`,`creater`,`createdate`) VALUES (2402,'已确认',2400,'0001',NOW());