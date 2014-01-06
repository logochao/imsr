DROP TABLE IF EXISTS rs_user;

/*==============================================================*/
/* Table: rs_user                                               */
/*==============================================================*/
CREATE TABLE rs_user
(
   u_id                 VARCHAR(4) NOT NULL,
   u_name               VARCHAR(100),
   u_real_name          VARCHAR(100),
   u_pass_word          VARCHAR(50),
   u_phone              VARCHAR(11),
   u_email              VARCHAR(100),
   u_address            VARCHAR(200),
   u_remark             VARCHAR(200),
   u_post_code          CHAR(6),
   u_login_ip           CHAR(11),
   u_last_login_time    DATETIME,
   u_create_time        DATETIME,
   u_creater            VARCHAR(4),
   PRIMARY KEY (u_id)
);



DROP TABLE IF EXISTS rs_supplier_goods;

/*==============================================================*/
/* Table: rs_supplier_goods      供应商-商品信息                */
/*==============================================================*/
CREATE TABLE rs_supplier_goods
(
   supplier_id          CHAR(5) NOT NULL,
   goods_id             CHAR(5) NOT NULL,
   ledger_id            CHAR(8),
   creater              CHAR(4),
   createdate           DATETIME,
   reviser              CHAR(4),
   revisedate           DATETIME,
   verifier             CHAR(4),
   verifydate           DATETIME,
   PRIMARY KEY (supplier_id, goods_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
