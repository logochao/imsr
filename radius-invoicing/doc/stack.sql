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