/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2016/12/5 9:52:19                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tb_Sign') and o.name = 'FK_TB_SIGN_REFERENCE_TB_SUBJE')
alter table tb_Sign
   drop constraint FK_TB_SIGN_REFERENCE_TB_SUBJE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tb_Sign') and o.name = 'FK_TB_SIGN_REFERENCE_TB_STUDE')
alter table tb_Sign
   drop constraint FK_TB_SIGN_REFERENCE_TB_STUDE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tb_Admin')
            and   type = 'U')
   drop table tb_Admin
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tb_Grade')
            and   type = 'U')
   drop table tb_Grade
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tb_Message')
            and   type = 'U')
   drop table tb_Message
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tb_Sign')
            and   type = 'U')
   drop table tb_Sign
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tb_Student')
            and   type = 'U')
   drop table tb_Student
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tb_Subject')
            and   type = 'U')
   drop table tb_Subject
go

/*==============================================================*/
/* Table: tb_Admin                                              */
/*==============================================================*/
create table tb_Admin (
   ID                   int                  not null,
   adminAccount         varchar(50)          null,
   adminPwd             varchar(50)          null,
   constraint PK_TB_ADMIN primary key (ID)
)
go

/*==============================================================*/
/* Table: tb_Grade                                              */
/*==============================================================*/
create table tb_Grade (
   gradeID              int                  not null,
   gradeSubject         varchar(50)          null,
   gradeScore           int                  null,
   gradeTime            date                 null,
   gradeSno             varchar(20)          null,
   constraint PK_TB_GRADE primary key (gradeID)
)
go

/*==============================================================*/
/* Table: tb_Message                                            */
/*==============================================================*/
create table tb_Message (
   msgID                int                  not null,
   msgTitle             varchar(50)          null,
   msgLookTotal         varchar(10)          null,
   msgTime              datetime             null,
   msgContents          varchar(500)         null,
   constraint PK_TB_MESSAGE primary key (msgID)
)
go

/*==============================================================*/
/* Table: tb_Sign                                               */
/*==============================================================*/
create table tb_Sign (
   signID               int                  not null,
   stuNo                varchar(20)          null,
   subjectID            int                  null,
   constraint AK_KEY_1_TB_SIGN unique clustered (signID)
)
go

/*==============================================================*/
/* Table: tb_Student                                            */
/*==============================================================*/
create table tb_Student (
   stuID                int                  not null,
   stuName              varchar(20)          null,
   stuNo                varchar(20)          not null,
   stuPwd               varchar(100)         null,
   stuSex               varchar(2)           null,
   stuClass             varchar(40)          null,
   stuMajor             varchar(20)          null,
   stuAddress           varchar(50)          null,
   stuMobile            varchar(20)          null,
   stuEmail             varchar(20)          null,
   constraint PK_TB_STUDENT primary key (stuNo)
)
go

/*==============================================================*/
/* Table: tb_Subject                                            */
/*==============================================================*/
create table tb_Subject (
   subjectID            int                  not null,
   subjectName          varchar(50)          null,
   subjectExamTime      date                 null,
   subjectExamAddress   varchar(20)          null,
   subjectSignStartTime date                 null,
   subjectSignEndTime   date                 null,
   constraint PK_TB_SUBJECT primary key (subjectID)
)
go

alter table tb_Sign
   add constraint FK_TB_SIGN_REFERENCE_TB_SUBJE foreign key (subjectID)
      references tb_Subject (subjectID)
go

alter table tb_Sign
   add constraint FK_TB_SIGN_REFERENCE_TB_STUDE foreign key (stuNo)
      references tb_Student (stuNo)
go

