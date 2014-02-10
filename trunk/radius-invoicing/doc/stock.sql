/*
SQLyog Ultimate v8.32 
MySQL - 5.5.24 : Database - stock
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stock` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stock`;

/*Table structure for table `rs_account` */

DROP TABLE IF EXISTS `rs_account`;

CREATE TABLE `rs_account` (
  `ledger_id` char(8) NOT NULL,
  `ledger_name` varchar(100) DEFAULT NULL,
  `belong_institution` varchar(10) DEFAULT NULL,
  `father_ledger` char(10) DEFAULT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`ledger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_account` */

LOCK TABLES `rs_account` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_category_code` */

DROP TABLE IF EXISTS `rs_category_code`;

CREATE TABLE `rs_category_code` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `category_type` int(11) DEFAULT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_category_code` */

LOCK TABLES `rs_category_code` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_category_type` */

DROP TABLE IF EXISTS `rs_category_type`;

CREATE TABLE `rs_category_type` (
  `category_type` int(11) NOT NULL,
  `category_type_name` varchar(50) DEFAULT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`category_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_category_type` */

LOCK TABLES `rs_category_type` WRITE;

insert  into `rs_category_type`(`category_type`,`category_type_name`,`creater`,`createdate`,`reviser`,`revisedate`,`verifier`,`verifydate`) values (200,'产地','0001','2014-01-05 15:36:31',NULL,NULL,NULL,NULL),(400,'付款方式','0001','2014-01-05 15:36:31',NULL,NULL,NULL,NULL),(600,'收付款类型','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(800,'币种','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(1000,'结帐方式','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(1200,'公司性质','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(1400,'计量单位','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(1600,'送货方式','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(1800,'颜色','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(2000,'用途','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(2200,'付款状态','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(2400,'表单状态','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(2600,'商品类别','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(2800,'供应商类别','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(3000,'客户类别','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(3200,'票据类型','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL),(3400,'学历','0001','2014-01-05 15:36:32',NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `rs_customer` */

DROP TABLE IF EXISTS `rs_customer`;

CREATE TABLE `rs_customer` (
  `customer_id` char(5) NOT NULL,
  `customer_ab` varchar(100) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `link_man` char(4) DEFAULT NULL,
  `contact_info` varchar(50) DEFAULT NULL,
  `tel1` varchar(20) DEFAULT NULL,
  `tel2` varchar(20) DEFAULT NULL,
  `tel3` varchar(20) DEFAULT NULL,
  `fax1` char(20) DEFAULT NULL,
  `fax2` char(20) DEFAULT NULL,
  `fax3` char(20) DEFAULT NULL,
  `paymented_type` char(4) DEFAULT NULL,
  `customer_illustrate` text,
  `customer_property` varchar(100) DEFAULT NULL,
  `office_address` varchar(50) DEFAULT NULL,
  `delivery_or_not` char(4) DEFAULT NULL,
  `post_code` char(6) DEFAULT NULL,
  `salesman_id` char(4) DEFAULT NULL,
  `pay_type` char(4) DEFAULT NULL,
  `delivery_type` char(4) DEFAULT NULL,
  `bank_acc_no` varchar(20) DEFAULT NULL,
  `tax_no` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `account_bank` varchar(100) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `account_no` char(20) DEFAULT NULL,
  `paymented_man` char(4) DEFAULT NULL,
  `voucher` char(4) DEFAULT NULL,
  `goods_bills_date` int(11) DEFAULT NULL,
  `min_order_amount` int(11) DEFAULT NULL,
  `ledger_id` char(8) DEFAULT NULL,
  `memo` text,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_customer` */

LOCK TABLES `rs_customer` WRITE;

insert  into `rs_customer`(`customer_id`,`customer_ab`,`customer_name`,`address`,`link_man`,`contact_info`,`tel1`,`tel2`,`tel3`,`fax1`,`fax2`,`fax3`,`paymented_type`,`customer_illustrate`,`customer_property`,`office_address`,`delivery_or_not`,`post_code`,`salesman_id`,`pay_type`,`delivery_type`,`bank_acc_no`,`tax_no`,`url`,`email`,`account_bank`,`account_name`,`account_no`,`paymented_man`,`voucher`,`goods_bills_date`,`min_order_amount`,`ledger_id`,`memo`,`creater`,`createdate`,`reviser`,`revisedate`,`verifier`,`verifydate`) values ('K0001','tomcat','机器猫','北京市昌平区天通苑北三区南','陈波宁','15110237946','010-331800',NULL,NULL,'010-331800',NULL,NULL,'1',NULL,'国企','北京市海淀区','1','331800','0001','001','01','62280001244555','5800023','http://www.badu.com','boning_chen@126.com','北京银行','陈波宁','622802039458','002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('K0002','ECCache','计算机缓存','江西省南昌市XXXX','周有才','12345678923','010-331800',NULL,NULL,'010-331800',NULL,NULL,'1',NULL,'私企','江西南昌','1','331800','0002','001','01','62280001244555','5800023','http://www.google.cm.h','boning_chen@126.com','南昌银行','陈波宁','622802039458','002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `rs_goods` */

DROP TABLE IF EXISTS `rs_goods`;

CREATE TABLE `rs_goods` (
  `goods_id` char(5) NOT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `goods_property` varchar(50) DEFAULT NULL,
  `category_id` char(4) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `goods_series` text,
  `unit` char(2) DEFAULT NULL,
  `origin_place` varchar(100) DEFAULT NULL,
  `uses` varchar(100) DEFAULT NULL,
  `weight_prop` int(11) DEFAULT NULL,
  `goods_status` char(2) DEFAULT NULL,
  `vulnerability` char(4) DEFAULT NULL,
  `deposit_deadline` int(11) DEFAULT NULL,
  `goods_description` text,
  `min_limit_of_store` int(11) DEFAULT NULL,
  `max_limit_of_store` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `purchase_illustrate` text,
  `price` int(11) DEFAULT NULL,
  `true_goods_name` varchar(100) DEFAULT NULL,
  `cash_type` char(4) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `batch_no` varchar(10) DEFAULT NULL,
  `use_status` char(2) DEFAULT NULL,
  `month_batch` int(11) DEFAULT NULL,
  `modify_batch_date` datetime DEFAULT NULL,
  `modify_batch_month` char(6) DEFAULT NULL,
  `format_no` char(4) DEFAULT NULL,
  `net_quantity` int(11) DEFAULT NULL,
  `little_unit_quantity` int(11) DEFAULT NULL,
  `little_unit` char(4) DEFAULT NULL,
  `sales_type` char(4) DEFAULT NULL,
  `defult_sales_institution` char(4) DEFAULT NULL,
  `tax_no` varchar(50) DEFAULT NULL,
  `off_sales` int(11) DEFAULT NULL,
  `memo` text,
  `cost_of_convert_unit` int(11) DEFAULT NULL,
  `price_of_convert_unit` int(11) DEFAULT NULL,
  `goods_bar_code` char(10) DEFAULT NULL,
  `weigth_per_unit` int(11) DEFAULT NULL,
  `price_of_weigth_per_unit` int(11) DEFAULT NULL,
  `ledger_id` char(8) DEFAULT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_goods` */

LOCK TABLES `rs_goods` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_link_man` */

DROP TABLE IF EXISTS `rs_link_man`;

CREATE TABLE `rs_link_man` (
  `link_man_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_type` int(11) DEFAULT NULL COMMENT '客户联系人、供应商联系人',
  `other_id` char(10) DEFAULT NULL COMMENT '如果是客户联系人 该字段记录客户编号\n            如果是供应商联系人 该字段记录供应商编码',
  `link_man_name` varchar(100) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `card_no` char(19) DEFAULT NULL,
  `link_mobile` char(11) DEFAULT NULL,
  `link_tel` char(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `qq` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `pinyin` varchar(100) DEFAULT NULL,
  `mome` text,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`link_man_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `rs_link_man` */

LOCK TABLES `rs_link_man` WRITE;

insert  into `rs_link_man`(`link_man_id`,`link_type`,`other_id`,`link_man_name`,`sex`,`card_no`,`link_mobile`,`link_tel`,`email`,`qq`,`address`,`pinyin`,`mome`,`creater`,`createdate`,`reviser`,`revisedate`,`verifier`,`verifydate`) values (1,1,'K0001','周星驰','0','62559948576','1383838438','010-12345678','xingchi_zhou@136.com','252588246','中国香港',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'K0001','周杰伦','0','62559948576','1383838438','010-12345678','jiereng_zhou@136.com','252588246','中国台湾',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,'K0002','刘德华','0','62559948576','1383838438','010-12345678','jiereng_zhou@136.com','252588246','中国香港',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,'K0002','张学友','1','62559948576','1383838438','010-12345678','jiereng_zhou@136.com','252588246','中国香港',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `rs_purchase_contract` */

DROP TABLE IF EXISTS `rs_purchase_contract`;

CREATE TABLE `rs_purchase_contract` (
  `contract_id` char(14) NOT NULL,
  `purchase_order_id` char(14) NOT NULL,
  `supplier_id` char(5) NOT NULL,
  `supplier_name` varchar(50) DEFAULT NULL,
  `contract_file_id` char(14) DEFAULT NULL,
  `effect_date` datetime DEFAULT NULL,
  `sign_time` datetime DEFAULT NULL,
  `trade_assistant` char(4) DEFAULT NULL,
  `purchaser` char(4) DEFAULT NULL,
  `link_man` varchar(4) DEFAULT NULL,
  `link_mobile` char(11) DEFAULT NULL,
  `link_tel` char(20) DEFAULT NULL,
  `link_fax` char(20) DEFAULT NULL,
  `ordered_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_point` varchar(100) DEFAULT NULL,
  `contract_terms` text,
  `newest_print_time` datetime DEFAULT NULL,
  `newest_print_acc` char(4) DEFAULT NULL,
  `newest_print_record` varchar(100) DEFAULT NULL,
  `print_times` int(11) DEFAULT NULL,
  `paymented_status` char(4) DEFAULT NULL,
  `validity_date` datetime DEFAULT NULL,
  `STATUS` char(4) DEFAULT NULL,
  `ledger_id` char(8) NOT NULL,
  `memo` text,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_purchase_contract` */

LOCK TABLES `rs_purchase_contract` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_purchase_contract_goods_grd` */

DROP TABLE IF EXISTS `rs_purchase_contract_goods_grd`;

CREATE TABLE `rs_purchase_contract_goods_grd` (
  `contract_id` char(14) NOT NULL,
  `goods_id` char(5) NOT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `unit` char(2) DEFAULT NULL,
  `price_of_unit` int(11) DEFAULT NULL,
  `equivalent_unit` char(2) DEFAULT NULL,
  `price_of_eu` int(11) DEFAULT NULL,
  `quantity_of_eu_per_unit` int(11) DEFAULT NULL,
  `quantity_of_unit` int(11) DEFAULT NULL,
  `quantity_of_eu` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `memo` text,
  `STATUS` char(4) DEFAULT NULL,
  `ledger_id` char(8) NOT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_purchase_contract_goods_grd` */

LOCK TABLES `rs_purchase_contract_goods_grd` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_purchase_contract_payment` */

DROP TABLE IF EXISTS `rs_purchase_contract_payment`;

CREATE TABLE `rs_purchase_contract_payment` (
  `contract_id` char(14) NOT NULL,
  `cash_type` char(4) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `amount_in_words` text,
  `payment_type` char(4) DEFAULT NULL,
  `ledger_id` char(8) NOT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_purchase_contract_payment` */

LOCK TABLES `rs_purchase_contract_payment` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_purchase_contract_payment_grd` */

DROP TABLE IF EXISTS `rs_purchase_contract_payment_grd`;

CREATE TABLE `rs_purchase_contract_payment_grd` (
  `money_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `money_list_name` varchar(100) DEFAULT NULL,
  `contract_id` char(14) NOT NULL,
  `money_list_batch` char(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `amount_in_word` text,
  `pay_receive_type` char(4) DEFAULT NULL,
  `validity_date` datetime DEFAULT NULL,
  `STATUS` char(4) DEFAULT NULL,
  `memo` text,
  `ledger_id` char(8) NOT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`money_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_purchase_contract_payment_grd` */

LOCK TABLES `rs_purchase_contract_payment_grd` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_resource` */

DROP TABLE IF EXISTS `rs_resource`;

CREATE TABLE `rs_resource` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_resource_type` int(11) DEFAULT NULL,
  `r_name` char(100) DEFAULT NULL,
  `r_label_name` varchar(100) DEFAULT NULL,
  `r_icon` char(100) DEFAULT NULL,
  `r_parent_id` int(11) DEFAULT NULL,
  `r_url` char(100) DEFAULT NULL,
  `r_level` int(11) DEFAULT NULL,
  `r_isleaf` bit(1) DEFAULT NULL,
  `r_remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

/*Data for the table `rs_resource` */

LOCK TABLES `rs_resource` WRITE;

insert  into `rs_resource`(`r_id`,`r_resource_type`,`r_name`,`r_label_name`,`r_icon`,`r_parent_id`,`r_url`,`r_level`,`r_isleaf`,`r_remark`) values (1,1,'sysmange','系统管理',NULL,0,NULL,1,'\0','系统管理'),(2,1,'buinessmange','业务管理',NULL,0,NULL,1,'\0',NULL),(11,2,'usermanage','用户管理',NULL,1,'/stock/user/manager/user_view.html',2,'','用户管理'),(12,2,'usermanage','密码管理',NULL,1,'/stock/password/manager/password_view.html',2,'','密码管理'),(21,2,'suppliermanage','供运商管理',NULL,1,'/stock/supplier/manager/supplier_view.html',2,'',NULL),(22,2,'clientmanage','客户管理',NULL,1,'/stock/client/manager/client_view.html',2,'',NULL),(111,2,'resourcemanage','资源管理',NULL,0,'/stock/resource/system/resouce_view.html',1,'','资源管理'),(112,1,'contractmanage','合同管理',NULL,1,NULL,1,'',NULL),(113,2,'salescontract','销售合同',NULL,112,'/stock/contract/manager/sales_view.html',2,'',NULL);

UNLOCK TABLES;

/*Table structure for table `rs_sale_quotation` */

DROP TABLE IF EXISTS `rs_sale_quotation`;

CREATE TABLE `rs_sale_quotation` (
  `quotation_id` char(14) NOT NULL,
  `quotation_date` datetime DEFAULT NULL,
  `customer_id` char(5) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `link_man` varchar(4) DEFAULT NULL,
  `link_mobile` char(11) DEFAULT NULL,
  `link_tel` char(20) DEFAULT NULL,
  `link_fax` char(20) DEFAULT NULL,
  `status` char(4) DEFAULT NULL,
  `salesman_id` char(4) DEFAULT NULL,
  `print_times` smallint(6) DEFAULT NULL,
  `newest_print_time` datetime DEFAULT NULL,
  `newest_print_acc` char(4) DEFAULT NULL,
  `newest_print_record` varchar(100) DEFAULT NULL,
  `ledger_id` char(8) DEFAULT NULL,
  `memo` text,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`quotation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_sale_quotation` */

LOCK TABLES `rs_sale_quotation` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_sale_quotation_grd` */

DROP TABLE IF EXISTS `rs_sale_quotation_grd`;

CREATE TABLE `rs_sale_quotation_grd` (
  `quotation_id` char(14) NOT NULL,
  `goods_id` char(5) NOT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `unit` char(2) DEFAULT NULL,
  `price_of_unit` int(11) DEFAULT NULL,
  `equivalent_unit` char(2) DEFAULT NULL,
  `price_of_eu` int(11) DEFAULT NULL,
  `quantity_of_eu_per_unit` int(11) DEFAULT NULL,
  `quantity_of_unit` int(11) DEFAULT NULL,
  `quantity_of_eu` int(11) DEFAULT NULL,
  `made_date` datetime DEFAULT NULL,
  `validity_date` datetime DEFAULT NULL,
  `ledger_id` char(8) DEFAULT NULL,
  `memo` text,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`quotation_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_sale_quotation_grd` */

LOCK TABLES `rs_sale_quotation_grd` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_sales_contract` */

DROP TABLE IF EXISTS `rs_sales_contract`;

CREATE TABLE `rs_sales_contract` (
  `contract_id` char(14) NOT NULL,
  `customer_id` char(5) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `contract_file_id` char(14) DEFAULT NULL,
  `effect_date` datetime DEFAULT NULL,
  `sign_time` datetime DEFAULT NULL,
  `trade_assistant` char(4) DEFAULT NULL,
  `salesman_id` char(4) DEFAULT NULL,
  `link_man` varchar(10) DEFAULT NULL,
  `link_mobile` char(11) DEFAULT NULL,
  `link_tel` char(20) DEFAULT NULL,
  `link_fax` char(20) DEFAULT NULL,
  `ordered_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_point` varchar(100) DEFAULT NULL,
  `contract_terms` text,
  `newest_print_time` datetime DEFAULT NULL,
  `newest_print_acc` char(4) DEFAULT NULL,
  `newest_print_record` varchar(100) DEFAULT NULL,
  `paymented_status` char(4) DEFAULT NULL,
  `validity_date` datetime DEFAULT NULL,
  `ledger_id` char(8) NOT NULL,
  `status` char(4) DEFAULT NULL,
  `print_times` int(11) DEFAULT NULL,
  `memo` text,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_sales_contract` */

LOCK TABLES `rs_sales_contract` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_sales_contract_goods_grd` */

DROP TABLE IF EXISTS `rs_sales_contract_goods_grd`;

CREATE TABLE `rs_sales_contract_goods_grd` (
  `contract_id` char(14) NOT NULL,
  `goods_id` char(5) NOT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `unit` char(2) DEFAULT NULL,
  `price_of_unit` int(11) DEFAULT NULL,
  `equivalent_unit` char(2) DEFAULT NULL,
  `price_of_eu` int(11) DEFAULT NULL,
  `quantity_of_eu_per_unit` int(11) DEFAULT NULL,
  `quantity_of_unit` int(11) DEFAULT NULL,
  `quantity_of_eu` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `memo` text,
  `status` char(4) DEFAULT NULL,
  `ledger_id` char(8) NOT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_sales_contract_goods_grd` */

LOCK TABLES `rs_sales_contract_goods_grd` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_sales_contract_payment` */

DROP TABLE IF EXISTS `rs_sales_contract_payment`;

CREATE TABLE `rs_sales_contract_payment` (
  `contract_id` char(14) NOT NULL,
  `cash_type` char(4) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `amount_in_words` text,
  `payment_type` char(4) DEFAULT NULL,
  `ledger_id` char(8) DEFAULT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_sales_contract_payment` */

LOCK TABLES `rs_sales_contract_payment` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_sales_contract_payment_grd` */

DROP TABLE IF EXISTS `rs_sales_contract_payment_grd`;

CREATE TABLE `rs_sales_contract_payment_grd` (
  `money_list_id` char(20) NOT NULL,
  `money_list_name` varchar(100) DEFAULT NULL,
  `contract_id` char(14) DEFAULT NULL,
  `money_list_batch` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `amount_in_word` text,
  `pay_receive_type` char(4) DEFAULT NULL,
  `validity_date` datetime DEFAULT NULL,
  `status` char(4) DEFAULT NULL,
  `memo` text,
  `ledger_id` char(8) DEFAULT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`money_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_sales_contract_payment_grd` */

LOCK TABLES `rs_sales_contract_payment_grd` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_supplier` */

DROP TABLE IF EXISTS `rs_supplier`;

CREATE TABLE `rs_supplier` (
  `supplier_id` char(5) NOT NULL,
  `supplier_name` varchar(50) DEFAULT NULL,
  `supplier_short_name` varchar(20) DEFAULT NULL,
  `nature` char(60) DEFAULT NULL,
  `delivery_type` char(4) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `market_zone` varchar(100) DEFAULT NULL,
  `delivery_address` varchar(100) DEFAULT NULL,
  `link_man` varchar(4) DEFAULT NULL,
  `contact_info` varchar(50) DEFAULT NULL,
  `tel1` char(20) DEFAULT NULL,
  `tel2` char(20) DEFAULT NULL,
  `tel3` char(20) DEFAULT NULL,
  `fax1` char(20) DEFAULT NULL,
  `fax2` char(20) DEFAULT NULL,
  `fax3` char(20) DEFAULT NULL,
  `paymented_type` int(11) DEFAULT NULL,
  `supplier_notes` text,
  `purchaser` char(4) DEFAULT NULL,
  `office_address` varchar(50) DEFAULT NULL,
  `delivery_or_not` char(4) DEFAULT NULL,
  `post_code` char(6) DEFAULT NULL,
  `bank_acc_no` varchar(20) DEFAULT NULL,
  `tax_no` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ledger_id` char(8) DEFAULT NULL,
  `memo` text,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_supplier` */

LOCK TABLES `rs_supplier` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_supplier_goods` */

DROP TABLE IF EXISTS `rs_supplier_goods`;

CREATE TABLE `rs_supplier_goods` (
  `supplier_id` char(5) NOT NULL,
  `goods_id` char(5) NOT NULL,
  `ledger_id` char(8) DEFAULT NULL,
  `creater` char(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `reviser` char(4) DEFAULT NULL,
  `revisedate` datetime DEFAULT NULL,
  `verifier` char(4) DEFAULT NULL,
  `verifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`supplier_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_supplier_goods` */

LOCK TABLES `rs_supplier_goods` WRITE;

UNLOCK TABLES;

/*Table structure for table `rs_user` */

DROP TABLE IF EXISTS `rs_user`;

CREATE TABLE `rs_user` (
  `u_id` char(4) NOT NULL,
  `u_name` char(100) DEFAULT NULL,
  `u_real_name` varchar(100) DEFAULT NULL,
  `u_pass_word` char(30) DEFAULT NULL,
  `u_phone` char(11) DEFAULT NULL,
  `u_email` char(100) DEFAULT NULL,
  `u_address` varchar(200) DEFAULT NULL,
  `u_post_code` char(6) DEFAULT NULL,
  `u_login_ip` char(11) DEFAULT NULL,
  `u_last_login_time` datetime DEFAULT NULL,
  `u_creater` char(4) DEFAULT NULL,
  `u_create_time` datetime DEFAULT NULL,
  `u_remark` varbinary(200) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rs_user` */

LOCK TABLES `rs_user` WRITE;

UNLOCK TABLES;

/*Table structure for table `sheet1$` */

DROP TABLE IF EXISTS `sheet1$`;

CREATE TABLE `sheet1$` (
  `F1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sheet1$` */

LOCK TABLES `sheet1$` WRITE;

insert  into `sheet1$`(`F1`) values (NULL);

UNLOCK TABLES;

/*Table structure for table `sheet2$` */

DROP TABLE IF EXISTS `sheet2$`;

CREATE TABLE `sheet2$` (
  `F1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sheet2$` */

LOCK TABLES `sheet2$` WRITE;

insert  into `sheet2$`(`F1`) values (NULL);

UNLOCK TABLES;

/*Table structure for table `sheet3$` */

DROP TABLE IF EXISTS `sheet3$`;

CREATE TABLE `sheet3$` (
  `F1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sheet3$` */

LOCK TABLES `sheet3$` WRITE;

insert  into `sheet3$`(`F1`) values (NULL);

UNLOCK TABLES;

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `test` */

LOCK TABLES `test` WRITE;

insert  into `test`(`id`,`name`) values (1,'1'),(5,'2');

UNLOCK TABLES;

/*Table structure for table `treenodes` */

DROP TABLE IF EXISTS `treenodes`;

CREATE TABLE `treenodes` (
  `id` int(11) NOT NULL,
  `nodename` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `treenodes` */

LOCK TABLES `treenodes` WRITE;

insert  into `treenodes`(`id`,`nodename`,`pid`) values (1,'A',0),(2,'B',1),(3,'C',1),(4,'D',2),(5,'E',2),(6,'F',3),(7,'G',6),(8,'H',0),(9,'I',8),(10,'J',8),(11,'K',8),(12,'L',9),(13,'M',9),(14,'N',12),(15,'O',12),(16,'P',15),(17,'Q',15);

UNLOCK TABLES;

/* Function  structure for function  `getChildLst` */

/*!50003 DROP FUNCTION IF EXISTS `getChildLst` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `getChildLst`(rootId INT) RETURNS varchar(1000) CHARSET utf8
BEGIN
			DECLARE sTemp VARCHAR(1000);
			DECLARE sTempChd VARCHAR(1000);
		        SET sTemp = '$';
			WHILE sTempChd is not null DO
			SET sTemp = concat(sTemp,',',sTempChd);
			 SELECT group_concat(id) INTO sTempChd FROM treeNodes where FIND_IN_SET(pid,sTempChd)>0;
 END WHILE;
RETURN sTemp;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
