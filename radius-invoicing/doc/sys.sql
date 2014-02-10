drop table tb_user


/*==============================================================*/
/* Table: tb_user   ϵͳ�û���                                         */
/*==============================================================*/
create table tb_user 
(
   u_id                 char(4)                        not null,
   u_name               char(100)                      null,
   u_real_name          varchar(100)                   null,
   u_pass_word          char(30)                       null,
   u_phone              char(11)                       null,
   u_email              char(100)                      null,
   u_address            varchar(200)                   null,
   u_post_code          char(6)                        null,
   u_login_ip           char(11)                       null,
   u_last_login_time    datetime                       null,
   u_creater            char(4)                        null,
   u_create_time        datetime                       null,
   u_remark             varbinary(200)                 null,
   constraint PK_TB_USER primary key clustered (u_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table tb_resource
/*==============================================================*/
/* Table: tb_resource ϵͳ��Դ��                                       */
/*==============================================================*/
create table tb_resource 
(
   r_id                 int                            not null,
   r_resource_type      int                            null,
   r_name               char(100)                      null,
   r_label_name         varchar(100)                   null,
   r_icon               char(100)                      null,
   r_parent_id          int                            null,
   r_url                char(100)                      null,
   r_level              int                            null,
   r_isleaf             bit                            null,
   r_remark             varchar(200)                   null,
   constraint PK_TB_RESOURCE primary key clustered (r_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_category_type;

/*==============================================================*/
/* Table: rs_category_type                                         */
/*==============================================================*/
CREATE TABLE rs_category_type
(
   category_type        INT,
   category_type_name   VARCHAR(50),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
 CONSTRAINT PK_TB_USER PRIMARY KEY clustered (category_type)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_category_code;

/*==============================================================*/
/* Table: rs_category_code                                      */
/*==============================================================*/

CREATE TABLE `rs_category_code` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) default NULL,
  `category_type` int(11) default NULL,
  `creater` char(4) default NULL,
  `createdate` datetime default NULL,
  `reviser` char(4) default NULL,
  `revisedate` datetime default NULL,
  `verifier` char(4) default NULL,
  `verifydate` datetime default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS rs_customer;

/*==============================================================*/
/* Table: rs_customer         客户信息                          */
/*==============================================================*/
CREATE TABLE rs_customer
(
   customer_id          CHAR(5) NOT NULL,
   customer_ab          VARCHAR(100),
   customer_name        VARCHAR(100),
   address              VARCHAR(100),
   link_man             CHAR(4),
   contact_info         VARCHAR(50),
   tel1                 VARCHAR(20),
   tel2                 VARCHAR(20),
   tel3                 VARCHAR(20),
   fax1                 CHAR(20),
   fax2                 CHAR(20),
   fax3                 CHAR(20),
   paymented_type       CHAR(4),
   customer_illustrate  TEXT,
   customer_property    VARCHAR(100),
   office_address       VARCHAR(50),
   delivery_or_not      CHAR(4),
   post_code            CHAR(6),
   salesman_id          CHAR(4),
   pay_type             CHAR(4),
   delivery_type        CHAR(4),
   bank_acc_no          VARCHAR(20),
   tax_no               VARCHAR(50),
   url                  VARCHAR(100),
   email                VARCHAR(60),
   account_bank         VARCHAR(100),
   account_name         VARCHAR(100),
   account_no           CHAR(20),
   paymented_man        CHAR(4),
   voucher              CHAR(4),
   goods_bills_date     INTEGER,
   min_order_amount     INTEGER,
   ledger_id            CHAR(8),
   memo                 TEXT,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
    PRIMARY KEY (customer_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8



DROP TABLE IF EXISTS rs_supplier;

/*==============================================================*/
/* Table: rs_supplier          供应商信息                           */
/*==============================================================*/
CREATE TABLE rs_supplier
(
   supplier_id          CHAR(5) NOT NULL,
   supplier_name        VARCHAR(50),
   supplier_short_name  VARCHAR(20),
   nature               CHAR(60),
   delivery_type        CHAR(4),
   pay_type             INTEGER,
   market_zone          VARCHAR(100),
   delivery_address     VARCHAR(100),
   link_man             VARCHAR(4),
   contact_info         VARCHAR(50),
   tel1                 CHAR(20),
   tel2                 CHAR(20),
   tel3                 CHAR(20),
   fax1                 CHAR(20),
   fax2                 CHAR(20),
   fax3                 CHAR(20),
   paymented_type       INTEGER,
   supplier_notes       TEXT,
   purchaser            CHAR(4),
   office_address       VARCHAR(50),
   delivery_or_not      CHAR(4),
   post_code            CHAR(6),
   bank_acc_no          VARCHAR(20),
   tax_no               VARCHAR(50),
   url                  VARCHAR(100),
   email                VARCHAR(100),
   ledger_id            CHAR(8),
   memo                 TEXT,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (supplier_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8



DROP TABLE IF EXISTS rs_link_man;

/*==============================================================*/
/* Table: rs_link_man   联系人信息                                      */
/*==============================================================*/
CREATE TABLE rs_link_man
(
   link_man_id          INT NOT NULL AUTO_INCREMENT,
   link_type            INT COMMENT '客户联系人、供应商联系人',
   other_id             CHAR(10) COMMENT '如果是客户联系人 该字段记录客户编号
            如果是供应商联系人 该字段记录供应商编码',
   link_man_name        VARCHAR(100),
   sex                  CHAR(2),
   card_no              CHAR(19),
   link_mobile          CHAR(11),
   link_tel             CHAR(20),
   email                VARCHAR(100),
   qq                   VARCHAR(100),
   address              VARCHAR(100),
   pinyin               VARCHAR(100),
   memo                 TEXT,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY clustered (link_man_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_supplier_goods;

/*==============================================================*/
/* Table: rs_supplier_goods      供应商-商品信息                */
/*==============================================================*/
CREATE TABLE rs_supplier_goods
(
   supplier_id          CHAR(5) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   ledger_id            CHAR(8),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (supplier_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_goods;

/*==============================================================*/
/* Table: rs_goods            销售-商品                         */
/*==============================================================*/
CREATE TABLE rs_goods
(
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   goods_property       VARCHAR(50),
   category_id          CHAR(4),
   category_name        VARCHAR(50),
   goods_series         TEXT(250),
   unit                 CHAR(2),
   origin_place         VARCHAR(100),
   uses                 VARCHAR(100),
   weight_prop          INTEGER,
   goods_status         CHAR(2),
   vulnerability        CHAR(4),
   deposit_deadline     INTEGER,
   goods_description    TEXT,
   min_limit_of_store   INTEGER,
   max_limit_of_store   INTEGER,
   cost                 INTEGER,
   purchase_illustrate  TEXT,
   price                INTEGER,
   true_goods_name      VARCHAR(100),
   cash_type            CHAR(4),
   batch                INTEGER,
   batch_no             VARCHAR(10),
   use_status           CHAR(2),
   month_batch          INTEGER,
   modify_batch_date    DATETIME,
   modify_batch_month   CHAR(6),
   format_no            CHAR(4),
   net_quantity         INTEGER,
   little_unit_quantity INTEGER,
   little_unit          CHAR(4),
   sales_type           CHAR(4),
   defult_sales_institution CHAR(4),
   tax_no               VARCHAR(50),
   off_sales            INTEGER,
   memo                 TEXT,
   cost_of_convert_unit INTEGER,
   price_of_convert_unit INTEGER,
   goods_bar_code       CHAR(10),
   weigth_per_unit      INTEGER,
   price_of_weigth_per_unit INTEGER,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_sale_quotation;

/*==============================================================*/
/* Table: rs_list_quotation        销售报价        */
/*==============================================================*/

CREATE TABLE rs_sale_quotation
(
   quotation_id         CHAR(14) NOT NULL,
   quotation_date       DATETIME,
   customer_id          CHAR(5),
   customer_name        VARCHAR(100),
   address              VARCHAR(100),
   link_man             VARCHAR(4),
   link_mobile          CHAR(11),
   link_tel             CHAR(20),
   link_fax             CHAR(20),
   STATUS               CHAR(4),
   salesman_id          CHAR(4),
   print_times          SMALLINT,
   newest_print_time    DATETIME,
   newest_print_acc     CHAR(4),
   newest_print_record  VARCHAR(100),
   ledger_id            CHAR(8),
   memo                 TEXT,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (quotation_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_sale_quotation_grd;

/*==============================================================*/
/* Table: rs_sale_quotation_grd    销售报价商品明细             */
/*==============================================================*/
CREATE TABLE rs_sale_quotation_grd
(
   quotation_id         CHAR(14) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   unit                 CHAR(2),
   price_of_unit        INTEGER,
   equivalent_unit      CHAR(2),
   price_of_eu          INTEGER,
   quantity_of_eu_per_unit INTEGER,
   quantity_of_unit     INTEGER,
   quantity_of_eu       INTEGER,
   made_date            DATETIME,
   validity_date        DATETIME,
   ledger_id            CHAR(8),
   memo                 TEXT,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (quotation_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS rs_purchase_contract;

/*==============================================================*/
/* Table: rs_purchase_contract         采购合同      */
/*==============================================================*/
CREATE TABLE rs_purchase_contract
(
   contract_id          CHAR(14) NOT NULL,
   purchase_order_id    CHAR(14) NOT NULL,
   supplier_id          CHAR(5) NOT NULL,
   supplier_name        VARCHAR(50),
   contract_file_id     CHAR(14),
   effect_date          DATETIME,
   sign_time            DATETIME,
   trade_assistant      CHAR(4),
   purchaser            CHAR(4),
   link_man             VARCHAR(4),
   link_mobile          CHAR(11),
   link_tel             CHAR(20),
   link_fax             CHAR(20),
   ordered_date         DATETIME,
   delivery_date        DATETIME,
   delivery_point       VARCHAR(100),
   contract_terms       TEXT,
   newest_print_time    DATETIME,
   newest_print_acc     CHAR(4),
   newest_print_record  VARCHAR(100),
   print_times          INTEGER,
   paymented_status     CHAR(4),
   validity_date        DATETIME,
   STATUS               CHAR(4),
   ledger_id            CHAR(8) NOT NULL,
   memo                 TEXT,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (contract_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_purchase_contract_goods_grd;

/*==============================================================*/
/* Table: rs_purchase_contract_goods_grd  采购合同_商品明细   */
/*==============================================================*/
CREATE TABLE rs_purchase_contract_goods_grd
(
   contract_id          CHAR(14) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   unit                 CHAR(2),
   price_of_unit        INTEGER,
   equivalent_unit      CHAR(2),
   price_of_eu          INTEGER,
   quantity_of_eu_per_unit INTEGER,
   quantity_of_unit     INTEGER,
   quantity_of_eu       INTEGER,
   amount               INTEGER,
   memo                 TEXT,
   STATUS               CHAR(4),
   ledger_id            CHAR(8) NOT NULL,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (contract_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_purchase_contract_payment;

/*==============================================================*/
/* Table: rs_purchase_contract_payment 采购合同_付款     */
/*==============================================================*/
CREATE TABLE rs_purchase_contract_payment
(
   contract_id          CHAR(14) NOT NULL,
   cash_type            CHAR(4),
   total_amount         INTEGER,
   amount_in_words      TEXT,
   payment_type         CHAR(4),
   ledger_id            CHAR(8) NOT NULL,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (contract_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_purchase_contract_payment_grd;

/*==============================================================*/
/* Table: rs_purchase_contract_payment_grd  采购合同_付款_明细   */
/*==============================================================*/
CREATE TABLE rs_purchase_contract_payment_grd
(
   money_list_id        INT NOT NULL AUTO_INCREMENT,
   money_list_name      VARCHAR(100),
   contract_id          CHAR(14) NOT NULL,
   money_list_batch     CHAR(50),
   amount               INTEGER,
   amount_in_word       TEXT,
   pay_receive_type     CHAR(4),
   validity_date        DATETIME,
   STATUS               CHAR(4),
   memo                 TEXT,
   ledger_id            CHAR(8) NOT NULL,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (money_list_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_sales_contract;

/*==============================================================*/
/* Table: rs_sales_contract         销售合同          */
/*==============================================================*/
CREATE TABLE rs_sales_contract
(
   contract_id          CHAR(14) NOT NULL,
   customer_id          CHAR(5),
   customer_name        VARCHAR(100),
   contract_file_id     CHAR(14),
   effect_date          DATETIME,
   sign_time            DATETIME,
   trade_assistant      CHAR(4),
   salesman_id          CHAR(4),
   link_man             VARCHAR(10),
   link_mobile          CHAR(11),
   link_tel             CHAR(20),
   link_fax             CHAR(20),
   ordered_date         DATETIME,
   delivery_date        DATETIME,
   delivery_point       VARCHAR(100),
   contract_terms       TEXT,
   newest_print_time    DATETIME,
   newest_print_acc     CHAR(4),
   newest_print_record  VARCHAR(100),
   paymented_status     CHAR(4),
   validity_date        DATETIME,
   ledger_id            CHAR(8) NOT NULL,
   STATUS               CHAR(4),
   print_times          INTEGER,
   memo                 TEXT,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (contract_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_sales_contract_goods_grd;

/*==============================================================*/
/* Table: rs_sales_contract_goods_grd      销售合同_商品明细          */
/*==============================================================*/
CREATE TABLE rs_sales_contract_goods_grd
(
   contract_id          CHAR(14) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   unit                 CHAR(2),
   price_of_unit        INTEGER,
   equivalent_unit      CHAR(2),
   price_of_eu          INTEGER,
   quantity_of_eu_per_unit INTEGER,
   quantity_of_unit     INTEGER,
   quantity_of_eu       INTEGER,
   amount               INTEGER,
   memo                 TEXT,
   STATUS               CHAR(4),
   ledger_id            CHAR(8) NOT NULL,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (contract_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_sales_contract_payment;

/*==============================================================*/
/* Table: rs_sales_contract_payment       销售合同_付款          */
/*==============================================================*/
CREATE TABLE rs_sales_contract_payment
(
   contract_id          CHAR(14) NOT NULL,
   cash_type            CHAR(4),
   total_amount         INTEGER,
   amount_in_words      TEXT,
   payment_type         CHAR(4),
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (contract_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_sales_contract_payment_grd;

/*==============================================================*/
/* Table: rs_sales_contract_payment_grd   销售合同_付款_明细         */
/*==============================================================*/
CREATE TABLE rs_sales_contract_payment_grd
(
   money_list_id        INT NOT NULL AUTO_INCREMENT,
   money_list_name      VARCHAR(100),
   contract_id          CHAR(14),
   money_list_batch     INT,
   amount               INTEGER,
   amount_in_word       TEXT,
   pay_receive_type     CHAR(4),
   validity_date        DATETIME,
   STATUS               CHAR(4),
   memo                 TEXT,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (money_list_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS rs_contract_scan_grd;

/*==============================================================*/
/* Table: rs_contract_scan_grd  销售合同扫描件列表          */
/*==============================================================*/
CREATE TABLE rs_contract_scan_grd
(
   contract_id          CHAR(14) NOT NULL,
   contract_type        INTEGER,
   scan_code            CHAR(10) NOT NULL,
   file_name            VARCHAR(50),
   file_path            CHAR(20),
   file_order           CHAR(10),
   scan_quantity        INTEGER,
   memo                 TEXT,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (contract_id, scan_code)
)ENGINE=INNODB DEFAULT CHARSET=utf8;