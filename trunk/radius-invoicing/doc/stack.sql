DROP TABLE IF EXISTS rs_customer;

/*==============================================================*/
/* Table: rs_customer    客户                   */
/*==============================================================*/
CREATE TABLE rs_customer
(
   customer_id          CHAR(6) NOT NULL AUTO_INCREMENT,
   customer_ab          VARCHAR(100),
   customer_name        VARCHAR(100),
   link_man             VARCHAR(100),
   contact_info         VARCHAR(50),
   tel                  VARCHAR(20),
   fax                  CHAR(20),
   customer_illustrate  TEXT,
   customer_property    VARCHAR(100),
   office_address       VARCHAR(50),
   post_code            CHAR(6),
   url                  VARCHAR(100),
   email                VARCHAR(60),
   delivery_or_not      CHAR(4),
   delivery_type        CHAR(4),
   pay_type             CHAR(4),
   account_bank         VARCHAR(100),
   account_name         VARCHAR(100),
   bank_acc_no          VARCHAR(20),
   tax_no               VARCHAR(50),
   voucher              CHAR(4),
   goods_bills_date     INTEGER,
   min_order_amount     INTEGER,
   memo                 TEXT,
   salesman_id          CHAR(4),
   operator             CHAR(4),
   modify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (customer_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_link_man;

/*==============================================================*/
/* Table: rs_link_man    联系人信息                             */
/*==============================================================*/
CREATE TABLE rs_link_man
(
   link_man_id          INT NOT NULL AUTO_INCREMENT,
   link_man_name        VARCHAR(100),
   pinyin               VARCHAR(100),
   sex                  CHAR(2),
   id_number            CHAR(17),
   link_mobile1         CHAR(11),
   link_mobile2         CHAR(11),
   link_mobile3         CHAR(11),
   link_tel             CHAR(20),
   home_tel             CHAR(20),
   address              VARCHAR(100),
   qq                   VARCHAR(100),
   email                VARCHAR(100),
   job_duty             VARCHAR(100),
   expertise            VARCHAR(100),
   job_title            VARCHAR(100),
   job_content          VARCHAR(100),
   hobbies              VARCHAR(100),
   post_code            CHAR(6),
   serv_company_id      CHAR(5),
   serv_company_name    VARCHAR(100),
   customer_property    VARCHAR(100),
   customer_illustrate  TEXT,
   office_address       VARCHAR(50),
   mome                 TEXT,
   staff_id             CHAR(4) NOT NULL,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (link_man_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_supplier;

/*==============================================================*/
/* Table: rs_supplier               供应商信息                           */
/*==============================================================*/
CREATE TABLE rs_supplier
(
   supplier_id          CHAR(6) NOT NULL,
   supplier_short_name  VARCHAR(20),
   supplier_name        VARCHAR(50),
   link_man             CHAR(20),
   contact_info         VARCHAR(50),
   tel                  VARCHAR(20),
   fax                  CHAR(20),
   supplier_illustrate  TEXT,
   supplier_property    VARCHAR(100),
   office_address       VARCHAR(50),
   post_code            CHAR(6),
   url                  VARCHAR(100),
   email                VARCHAR(100),
   market_zone          VARCHAR(100),
   delivery_or_not      CHAR(4),
   delivery_type        CHAR(4),
   pay_type             CHAR(4),
   account_bank         VARCHAR(100),
   account_name         VARCHAR(100),
   bank_acc_no          VARCHAR(20),
   tax_no               VARCHAR(50),
   voucher              CHAR(4),
   goods_bills_date     INTEGER,
   min_order_amount     INTEGER,
   memo                 TEXT,
   purchaser            CHAR(4),
   operator             CHAR(4),
   modify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (supplier_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8





DROP TABLE IF EXISTS rs_goods;

/*==============================================================*/
/* Table: rs_goods     销售商品信息           */
/*==============================================================*/
CREATE TABLE rs_goods
(
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   true_goods_name      VARCHAR(100),
   goods_type           CHAR(4),
   host_machine_series  VARCHAR(100),
   machine_position     VARCHAR(100),
   part_no              VARCHAR(100),
   map_series           VARCHAR(100),
   made_company         VARCHAR(100),
   goods_status         CHAR(2) COMMENT '液态/固态',
   weight_prop          INTEGER,
   vulnerability        CHAR(4),
   goods_description    TEXT,
   use_status           CHAR(2),
   memo                 TEXT,
   ledger_id            CHAR(8),
   operator             CHAR(4),
   motify_date          DATETIME,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS rs_sales_contract;

/*==============================================================*/
/* Table: rs_sales_contract   				      销售合同          */
/*==============================================================*/
CREATE TABLE rs_sales_contract
(
   contract_id          CHAR(14) NOT NULL,
   customer_id          CHAR(6),
   customer_name        VARCHAR(100),
   contract_file_id     CHAR(14),
   effect_date          DATETIME,
   sign_time            DATETIME,
   salesman_id          CHAR(4),
   link_man             CHAR(4),
   link_mobile          CHAR(11),
   link_tel             VARCHAR(20),
   link_fax             CHAR(20),
   ordered_date         DATETIME,
   delivery_date        DATETIME,
   delivery_point       VARCHAR(100),
   contract_terms       TEXT,
   print_times          INTEGER,
   newest_print_time    DATETIME,
   newest_print_acc     CHAR(4),
   newest_print_record  VARCHAR(100),
   memo                 TEXT,
   STATUS               CHAR(2),
   audited_status       CHAR(2),
   checked_status       CHAR(2),
   validity_date        DATETIME,
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
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
/* Table: rs_sales_contract_goods_grd  销售合同_商品明细          */
/*==============================================================*/
CREATE TABLE rs_sales_contract_goods_grd
(
   contract_id          CHAR(14) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   spec_id              INT,
   unit                 CHAR(2),
   price_of_unit        INTEGER,
   equivalent_unit      CHAR(2),
   price_of_eu          INTEGER,
   quantity_of_eu_per_unit INTEGER,
   quantity_of_unit     INTEGER,
   quantity_of_eu       INTEGER,
   amount               INTEGER,
   memo                 TEXT,
   settled_amount       INTEGER,
   STATUS               CHAR(4),
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
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
/* Table: rs_sales_contract_payment    销售合同_付款          */
/*==============================================================*/
CREATE TABLE rs_sales_contract_payment
(
   contract_id          CHAR(14) NOT NULL,
   cash_type            INTEGER,
   total_amount         INTEGER,
   amount_in_words      TEXT,
   payment_type         INTEGER,
   STATUS               INTEGER,
   audited_status       INTEGER,
   mome                 TEXT,
   ledger_id            CHAR(8),
   operator             CHAR(4),
   motify_date          DATETIME,
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
/* Table: rs_sales_contract_payment_grd  销售合同_付款_明细     */
/*==============================================================*/
CREATE TABLE rs_sales_contract_payment_grd
(
   money_list_id        CHAR(20) NOT NULL AUTO_INCREMENT,
   money_list_name      VARCHAR(100),
   contract_id          CHAR(14) NOT NULL,
   money_list_batch     INT,
   amount               INT,
   amount_in_word       TEXT,
   pay_receive_type     INT,
   validity_date        DATETIME,
   STATUS               INT,
   mome                 TEXT,
   ledger_id            CHAR(8),
   operator             CHAR(4),
   motify_date          DATETIME,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (money_list_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

drop table if exists rs_sales_order;

/*==============================================================*/
/* Table: rs_sales_order                    销售订单     */
/*==============================================================*/
create table rs_sales_order
(
   sales_order_id       CHAR(20) not null,
   customer_id          CHAR(6),
   customer_name        VARCHAR(100),
   link_man             CHAR(4),
   link_mobile          CHAR(11),
   tel                  CHAR(20),
   fax                  CHAR(20),
   contract_id          CHAR(14),
   total_amount         INTEGER,
   amount_in_words      text,
   ordered_date         datetime,
   delivery_date        datetime,
   delivery_address     VARCHAR(100),
   terms                text,
   memo                 text,
   status               CHAR(4),
   splited_flg          INTEGER,
   splited_sales_order_id CHAR(20),
   print_times          INTEGER,
   newest_print_time    datetime,
   newest_print_acc     CHAR(4),
   newest_print_record  VARCHAR(100),
   salesman_id          CHAR(4),
   operator             CHAR(4),
   motify_date          datetime,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           datetime,
   reviser              CHAR(4),
   revisedate           datetime,
   verifier             CHAR(4),
   verifydate           datetime,
   primary key (sales_order_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
alter table rs_sales_order comment '拆单标识:0未拆单,1已拆单状态:';

DROP TABLE IF EXISTS rs_sales_order_goods_grd;

/*==============================================================*/
/* Table: rs_sales_order_goods_grd       销售订单_商品明细    */
/*==============================================================*/
CREATE TABLE rs_sales_order_goods_grd
(
   sales_order_id       CHAR(20) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   spec_id              INT,
   unit                 CHAR(2),
   price_of_unit        INT,
   equivalent_unit      CHAR(2),
   price_of_eu          INT,
   quantity_of_eu_per_unit INT,
   quantity_of_unit     INT,
   quantity_of_eu       INT,
   amount               INT,
   amount_in_words      TEXT,
   memo                 TEXT,
   STATUS               INT,
   operator             CHAR(4),
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   motify_date          DATETIME,
   PRIMARY KEY (sales_order_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_purchase_order;

/*==============================================================*/
/* Table: rs_purchase_order          列表_采购订单(订货)               */
/*==============================================================*/
CREATE TABLE rs_purchase_order
(
   purchase_order_id    CHAR(20) NOT NULL,
   supplier_id          CHAR(6),
   supplier_name        VARCHAR(100),
   link_man             CHAR(4),
   link_mobile          CHAR(11),
   tel                  VARCHAR(20),
   fax                  CHAR(20),
   sales_order_id       CHAR(20),
   total_amount         INTEGER,
   ordered_date         DATETIME,
   delivery_date        DATETIME,
   terms                TEXT,
   memo                 TEXT,
   STATUS               CHAR(4),
   consolidated_flg     INT,
   consolidated_purchase_order_id CHAR(20),
   print_times          INTEGER,
   newest_print_time    DATETIME,
   newest_print_acc     CHAR(4),
   newest_print_record  VARCHAR(100),
   purchaser_id         CHAR(4),
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (purchase_order_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_purchase_order_grd;

/*==============================================================*/
/* Table: rs_purchase_order_grd        列表_采购订单(订货)_明细     */
/*==============================================================*/
CREATE TABLE rs_purchase_order_grd
(
   purchase_order_id    CHAR(20) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   spec_id              INTEGER,
   unit                 CHAR(4),
   price_of_unit        INTEGER,
   equivalent_unit      CHAR(4),
   price_of_eu          INTEGER,
   quantity_of_eu_per_unit INTEGER,
   quantity_of_unit     INTEGER,
   quantity_of_eu       INTEGER,
   amount               INTEGER,
   memo                 TEXT,
   STATUS               CHAR(4),
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   primary key (purchase_order_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_purchase_contract;

/*==============================================================*/
/* Table: rs_purchase_contract                      采购合同      */
/*==============================================================*/
CREATE TABLE rs_purchase_contract
(
   contract_id          CHAR(14) NOT NULL,
   purchase_order_id    CHAR(20) NOT NULL,
   supplier_id          CHAR(6),
   supplier_name        VARCHAR(50),
   contract_file_id     CHAR(14),
   effect_date          DATETIME,
   sign_time            DATETIME,
   purchaser            CHAR(4),
   link_man             CHAR(4),
   link_mobile          CHAR(11),
   link_tel             VARCHAR(20),
   link_fax             CHAR(20),
   ordered_date         DATETIME,
   delivery_date        DATETIME,
   delivery_point       VARCHAR(100),
   contract_terms       TEXT,
   newest_print_time    DATETIME,
   newest_print_acc     CHAR(4),
   newest_print_record  VARCHAR(100),
   print_times          INTEGER,
   memo                 TEXT,
   paymented_status     CHAR(4),
   validity_date        DATETIME,
   audited_status       CHAR(4),
   STATUS               CHAR(4),
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (contract_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_purchase_contract_payment;

/*==============================================================*/
/* Table: rs_purchase_contract_payment        采购合同_付款     */
/*==============================================================*/
CREATE TABLE rs_purchase_contract_payment
(
   purchase_contract_id CHAR(14) NOT NULL,
   cash_type            CHAR(4),
   total_amount         INTEGER,
   amount_in_words      TEXT,
   payment_type         CHAR(4),
   audited_status       CHAR(4),
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (purchase_contract_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_purchase_contract_payment_grd;

/*==============================================================*/
/* Table: rs_purchase_contract_payment_grd        采购合同_付款_明细    */
/*==============================================================*/
CREATE TABLE rs_purchase_contract_payment_grd
(
   money_list_id        INT NOT NULL AUTO_INCREMENT,
   money_list_name      VARCHAR(100),
   contract_id          CHAR(14),
   money_list_batch     VARCHAR(100),
   amount               INTEGER,
   amount_in_word       TEXT,
   pay_receive_type     CHAR(4),
   validity_date        DATETIME,
   STATUS               CHAR(4),
   memo                 TEXT,
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (money_list_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8;



drop table if exists rs_sales_quotation;

/*==============================================================*/
/* Table: rs_sales_quotation      销售_报价       */
/*==============================================================*/
create table rs_sales_quotation
(
   sales_quotation_id     CHAR(14) not null,
   customer_id          CHAR(6),
   customer_ab          VARCHAR(100),
   cash_type            CHAR(4),
   address              VARCHAR(100),
   link_man             VARCHAR(4),
   link_mobile          CHAR(11),
   link_tel             VARCHAR(20),
   link_fax             CHAR(20),
   inquiry_date         datetime,
   latest_quotate_date  datetime,
   salesman_id          CHAR(4),
   status               CHAR(4),
   audited_status       CHAR(2),
   memo                 text,
   print_times          INTEGER,
   newest_print_time    datetime,
   newest_print_record  VARCHAR(100),
   operator             CHAR(4),
   motify_date          datetime,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           datetime,
   reviser              CHAR(4),
   revisedate           datetime,
   verifier             CHAR(4),
   verifydate           datetime,
   primary key (sales_inquiry_id)
);

alter table rs_sales_quotation comment '状态：01：未确认 00：已确认（审批中）';


DROP TABLE IF EXISTS rs_sales_quotation_grd;

/*==============================================================*/
/* Table: rs_sales_quotation_grd         销售报价商品明细             */
/*==============================================================*/
CREATE TABLE rs_sales_quotation_grd
(
   sales_quotation_id   CHAR(14) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   spec_id              INT,
   unit                 CHAR(4),
   equivalent_unit      CHAR(4),
   quantity_of_eu_per_unit INTEGER,
   supply_cash_type     CHAR(4),
   price_of_unit_of_supply INTEGER,
   price_of_eu_of_supply INTEGER,
   sales_cash_type       CHAR(4),
   exch_rate            INTEGER,
   price_of_eu_to_customer INTEGER,
   mark_up_rate         INTEGER,
   memo                 TEXT,
   made_date            DATETIME,
   validity_date        DATETIME,
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (sales_quotation_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_instorage_order;

/*==============================================================*/
/* Table: rs_instorage_order          列表_入库_货品   */
/*==============================================================*/
CREATE TABLE rs_instorage_order
(
   instorage_id         CHAR(20) NOT NULL,
   supplier_id          CHAR(6),
   supplier_name        VARCHAR(100),
   certificate_no       VARCHAR(50),
   link_man             INTEGER,
   link_mobile          CHAR(11),
   tel                  VARCHAR(20),
   fax                  CHAR(20),
   contract_id          CHAR(20),
   total_amount         INTEGER,
   ordered_date         DATE,
   delivery_date        DATE,
   terms                TEXT,
   memo                 TEXT,
   STATUS               INTEGER,
   print_times          INTEGER,
   newest_print_time    DATETIME,
   newest_print_acc     CHAR(4),
   newest_print_record  VARCHAR(100),
   purchaser_id         CHAR(4),
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (instorage_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS rs_sales_inquiry;

/*==============================================================*/
/* Table: rs_sales_inquiry   销售询价      */
/*==============================================================*/
create table rs_sales_inquiry
(
   sales_inquiry_id     CHAR(14) not null,
   customer_id          CHAR(6),
   customer_ab          VARCHAR(100),
   cash_type            CHAR(4),
   address              VARCHAR(100),
   link_man             CHAR(4),
   link_mobile          CHAR(11),
   link_tel             VARCHAR(20),
   link_fax             CHAR(20),
   Inquiry_date         datetime,
   latest_quotate_date  datetime,
   salesman_id          CHAR(4),
   status               CHAR(4),
   memo                 text,
   print_times          INTEGER,
   newest_print_time    datetime,
   newest_print_record  VARCHAR(100),
   operator             CHAR(4),
   motify_date          datetime,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           datetime,
   reviser              CHAR(4),
   revisedate           datetime,
   verifier             CHAR(4),
   verifydate           datetime,
   primary key (sales_inquiry_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

状态：
01：未确认
00：已确认
02：已报价，当全部商品均有供应商报价后，状态改变为已报价。

DROP TABLE IF EXISTS rs_sales_inquiry_grd;

/*==============================================================*/
/* Table: rs_sales_Inquiry_grd   销售询价_明细      */
/*==============================================================*/
CREATE TABLE rs_sales_inquiry_grd
(
   sales_inquiry_id     CHAR(20) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(50),
   spec_id              INT,
   unit                 INT,
   quantity_of_unit     INTEGER,
   quantity_of_eu_per_unit INTEGER,
   STATUS               CHAR(4),
   memo                 TEXT,
   ledger_id            CHAR(8),
   operator             CHAR(4),
   motify_date          DATETIME,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (sales_inquiry_id,goods_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE rs_sales_inquiry_grd COMMENT '状态：
00：已询价
01：询价中
生成询价单时，商品状态为01,当供应商报价后，商品状态为00';

DROP TABLE IF EXISTS rs_purchase_inquiry;

/*==============================================================*/
/* Table: rs_purchase_inquiry         采购询价       */
/*==============================================================*/
CREATE TABLE rs_purchase_inquiry
(
   purchase_inquiry_id  CHAR(20) NOT NULL,
   supplier_id          CHAR(6),
   supplier_name        VARCHAR(50),
   cash_type            INT,
   address              TEXT,
   link_man             INT,
   link_mobile          CHAR(11),
   link_tel             CHAR(20),
   link_fax             CHAR(20),
   Inquiry_date         DATE,
   latest_quotate_date  DATE,
   salesman_id          CHAR(4),
   STATUS               INT,
   memo                 TEXT,
   print_times          INTEGER,
   newest_print_time    DATETIME,
   newest_print_record  VARCHAR(100),
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (purchase_inquiry_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
alter table rs_purchase_inquiry comment '状态：
01：未确认
00：已确认
02：已报价，当全部商品均有供应商报价后，状态改';

DROP TABLE IF EXISTS rs_purchase_inquiry_grd;

/*==============================================================*/
/* Table: rs_purchase_inquiry_grd      采购询价列表            */
/*==============================================================*/
CREATE TABLE rs_purchase_inquiry_grd
(
   purchase_inquiry_id  CHAR(20) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   goods_name           VARCHAR(100),
   spec_id              INT,
   unit                 INT,
   quantity_of_unit     INT,
   STATUS               CHAR(4),
   memo                 TEXT,
   operator             CHAR(4),
   motify_date          DATETIME,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (purchase_inquiry_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

状态：
00：已询价
01：询价中
生成询价单时，商品状态为01,当供应商报价后，商品状态为00





DROP TABLE IF EXISTS rs_staff;

/*==============================================================*/
/* Table: rs_staff       员工信息表               */
/*==============================================================*/
CREATE TABLE rs_staff
(
   staff_id             CHAR(4) NOT NULL,
   NAME                 VARCHAR(100),
   sex                  INT,
   age                  INT,
   belong_institution   CHAR(4),
   post                 VARCHAR(50),
   LEVEL                INT,
   contact_info         VARCHAR(50),
   education            CHAR(2),
   id_number            VARCHAR(20),
   RESUME               TEXT,
   institution_name     VARCHAR(100),
   married              CHAR(2),
   office_tel           CHAR(20),
   mobile_num           CHAR(11),
   home_tel             CHAR(20),
   QQ                   CHAR(15),
   email                VARCHAR(60),
   post_code            CHAR(6),
   jobs                 VARCHAR(100),
   STATUS               CHAR(4),
   birthday             DATE,
   memo                 TEXT,
   address              VARCHAR(100),
   operator             CHAR(4),
   modify_date          DATETIME,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (staff_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS rs_user_password;

/*==============================================================*/
/* Table: rs_user_password           用户_密码    */
/*==============================================================*/
CREATE TABLE rs_user_password
(
   user_id              INT NOT NULL,
   login_acc            VARCHAR(20),
   PASSWORD             CHAR(50),
   staff_id             CHAR(4),
   user_description     TEXT,
   account_status       CHAR(2),
   create_date          DATETIME,
   ledger_id            CHAR(8),
   operator             CHAR(4),
   motify_date          DATETIME,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (user_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS rs_role_auth;

/*==============================================================*/
/* Table: rs_role_auth     角色权限信息表                */
/*==============================================================*/
CREATE TABLE rs_role_auth
(
   role_id              INT NOT NULL,
   menu_id              INT,
   lmt_id               INT,
   operator             CHAR(4),
   motify_date          DATETIME,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (role_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_role;

/*==============================================================*/
/* Table: rs_role                      角色信息表         */
/*==============================================================*/
CREATE TABLE rs_role
(
   role_id              INT NOT NULL,
   role_name            CHAR(20),
   role_description     VARCHAR(100),
   operator             CHAR(4),
   motify_date          DATETIME,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME
)ENGINE=INNODB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS rs_user_role;

/*==============================================================*/
/* Table: rs_user_role               用户_角色   */
/*==============================================================*/
CREATE TABLE rs_user_role
(
   user_id              INT NOT NULL,
   role_id              INT,
   create_date          DATETIME,
   operator             CHAR(4),
   motify_date          DATETIME,
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (user_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
