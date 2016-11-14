CREATE TABLE attraction
  (
    ano   NUMBER (10) NOT NULL ,
    aname VARCHAR2 (10) NOT NULL ,
    ainfo CLOB NOT NULL ,
    alocation VARCHAR2 (20) NOT NULL ,
    latitude  NUMBER (10) ,
    hardness  NUMBER (10) ,
    beacon    NUMBER (10)
  ) ;
ALTER TABLE attraction ADD CONSTRAINT attraction_PK PRIMARY KEY ( ano ) ;
CREATE TABLE attractionphoto
  (
    pno       NUMBER (10) NOT NULL ,
    savedfile VARCHAR2 (50) ,
    pcontent CLOB ,
    ano NUMBER (10) NOT NULL
  ) ;
ALTER TABLE attractionphoto ADD CONSTRAINT attractionphoto_PK PRIMARY KEY ( pno ) ;
CREATE TABLE favoritefield
  (
    mid VARCHAR2 (10) NOT NULL ,
    fno NUMBER (3) NOT NULL
  ) ;
ALTER TABLE favoritefield ADD CONSTRAINT guidefield_PK PRIMARY KEY ( fno, mid ) ;
CREATE TABLE field
  ( fno NUMBER (3) NOT NULL , fname VARCHAR2 (100)
  ) ;
ALTER TABLE field ADD CONSTRAINT field_PK PRIMARY KEY ( fno ) ;
CREATE TABLE guide
  (
    gid    VARCHAR2 (10) NOT NULL ,
    glocal VARCHAR2 (10) NOT NULL ,
    gintro CLOB NOT NULL ,
    gable VARCHAR2 (1)
  ) ;
ALTER TABLE guide ADD CONSTRAINT guide_PK PRIMARY KEY ( gid ) ;
CREATE TABLE matching
  (
    matchno   NUMBER (10) NOT NULL ,
    gid       VARCHAR2 (10) NOT NULL ,
    mid       VARCHAR2 (10) NOT NULL ,
    matchdate DATE ,
    score     NUMBER (3,1) ,
    bno       NUMBER (100) ,
    btitle    VARCHAR2 (50) ,
    bcontent CLOB ,
    bwriter   VARCHAR2 (10) ,
    bhitcount NUMBER (10) ,
    bdate     DATE ,
    savedfile VARCHAR2 (50)
  ) ;
ALTER TABLE matching ADD CONSTRAINT matching_PK PRIMARY KEY ( matchno ) ;
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
CREATE TABLE MESSAGE
  (
    mno NUMBER (10) NOT NULL ,
    mcontent CLOB ,
    mdate DATE ,
    mfrom VARCHAR2 (10) NOT NULL ,
    mto   VARCHAR2 (10) NOT NULL
  ) ;
ALTER TABLE MESSAGE ADD CONSTRAINT message_PK PRIMARY KEY ( mno ) ;
CREATE TABLE tourlist
  (
    tid        VARCHAR2 (10) NOT NULL ,
    tlocal     VARCHAR2 (10) NOT NULL ,
    tstartdate DATE NOT NULL ,
    tenddate   DATE ,
    tintro CLOB NOT NULL
  ) ;
ALTER TABLE tourlist ADD CONSTRAINT tourlist_PK PRIMARY KEY ( tid ) ;
ALTER TABLE attractionphoto ADD CONSTRAINT attractionphoto_attraction_FK FOREIGN KEY ( ano ) REFERENCES attraction ( ano ) ;
ALTER TABLE favoritefield ADD CONSTRAINT favoritefield_member_FK FOREIGN KEY ( mid ) REFERENCES member ( mid ) ;
ALTER TABLE guide ADD CONSTRAINT guide_member_FK FOREIGN KEY ( gid ) REFERENCES member ( mid ) ;
ALTER TABLE favoritefield ADD CONSTRAINT guidefield_field_FK FOREIGN KEY ( fno ) REFERENCES field ( fno ) ;
ALTER TABLE matching ADD CONSTRAINT matching_guide_guide_FK FOREIGN KEY ( gid ) REFERENCES guide ( gid ) ;
ALTER TABLE matching ADD CONSTRAINT matching_guide_member_FK FOREIGN KEY ( mid ) REFERENCES member ( mid ) ;
ALTER TABLE MESSAGE ADD CONSTRAINT message_member_FK FOREIGN KEY ( mfrom ) REFERENCES member ( mid ) ;
ALTER TABLE MESSAGE ADD CONSTRAINT message_member_FKv1 FOREIGN KEY ( mto ) REFERENCES member ( mid ) ;
ALTER TABLE tourlist ADD CONSTRAINT tourlist_member_FK FOREIGN KEY ( tid ) REFERENCES member ( mid ) ;
