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
) ENGINE=InnoDB DEFAULT CHARSET=utf8
