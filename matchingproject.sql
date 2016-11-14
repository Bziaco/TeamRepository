CREATE TABLE member
  (
    mid          VARCHAR2 (10) NOT NULL ,
    mpassword    VARCHAR2 (20) NOT NULL ,
    mnickname    VARCHAR2 (10) NOT NULL ,
    mname        VARCHAR2 (10) NOT NULL ,
    mage         NUMBER (5) NOT NULL ,
    msex         VARCHAR2 (5) NOT NULL ,
    memail       VARCHAR2 (20) NOT NULL ,
    mlocal       VARCHAR2 (10) NOT NULL ,
    mtel         VARCHAR2 (20) NOT NULL ,
    originalfile VARCHAR2 (50) NOT NULL ,
    savedfile    VARCHAR2 (50) NOT NULL ,
    mimetype     VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE member ADD CONSTRAINT member_PK PRIMARY KEY ( mid ) ;

