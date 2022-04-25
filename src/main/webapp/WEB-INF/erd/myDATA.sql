insert into TB_ADMIN values ('admin',1, '$2a$10$1i8SJF1cXIxD95eLsi7HeewFox35RPD6FZYFOlBQzTfS5gIlt.2AK', '라츠온', '1', '0', 'system', DATE_FORMAT(now(), '%Y%m%d%H%i%s'), 'system', DATE_FORMAT(now(), '%Y%m%d%H%i%s'));

Insert into TB_ROLE (ROLE_ID,ROLE_NAME,ROLE_NAME_E,ROLE_TYPE,DESCRIPTION,REG_ID,REG_DT,MOD_ID,MOD_DT) values (1,'일반사람','ROLE_NORMAL','1',null,'BASE_DATA',current_timestamp,null,null);
Insert into TB_ROLE (ROLE_ID,ROLE_NAME,ROLE_NAME_E,ROLE_TYPE,DESCRIPTION,REG_ID,REG_DT,MOD_ID,MOD_DT) values (2,'학생증 관리자','ROLE_SID_ADMIN','1',null,'BASE_DATA',current_timestamp,null,null);
Insert into TB_ROLE (ROLE_ID,ROLE_NAME,ROLE_NAME_E,ROLE_TYPE,DESCRIPTION,REG_ID,REG_DT,MOD_ID,MOD_DT) values (3,'신분증 관리자','ROLE_ID_ADMIN','1',null,'BASE_DATA',current_timestamp,null,null);
Insert into TB_ROLE (ROLE_ID,ROLE_NAME,ROLE_NAME_E,ROLE_TYPE,DESCRIPTION,REG_ID,REG_DT,MOD_ID,MOD_DT) values (4,'학생','ROLE_STUDENT','2','사용자(학생)','BASE_DATA',current_timestamp,null,null);
Insert into TB_ROLE (ROLE_ID,ROLE_NAME,ROLE_NAME_E,ROLE_TYPE,DESCRIPTION,REG_ID,REG_DT,MOD_ID,MOD_DT) values (5,'교직원','ROLE_EMPLOYEE','2','사용자(교직원)','BASE_DATA',current_timestamp,null,null);
Insert into TB_ROLE (ROLE_ID,ROLE_NAME,ROLE_NAME_E,ROLE_TYPE,DESCRIPTION,REG_ID,REG_DT,MOD_ID,MOD_DT) values (9,'슈퍼 관리자','ROLE_SUPER_ADMIN',1',null,'BASE_DATA',current_timestamp,null,null);


Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0000','0000','메인화면',null,'/',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0100','0100','일반사람 메뉴',null,'/normal/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0101','0100','일반사람 메뉴1',null,'/normal/menu/1/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0102','0100','일반사람 메뉴2',null,'/normal/menu/2/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0103','0100','일반사람 메뉴3',null,'/normal/menu/3/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0104','0100','일반사람 메뉴4',null,'/normal/menu/4/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0105','0100','일반사람 메뉴5',null,'/normal/menu/5/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0106','0100','일반사람 메뉴6',null,'/normal/menu/6/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0107','0100','일반사람 메뉴7',null,'/normal/menu/7/**','list.do');


Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0200','0200','학생증 관리자 메뉴',null,'/sidadmin/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0201','0200','학생증 관리자 메뉴1',null,'/sidadmin/menu/1/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0202','0200','학생증 관리자 메뉴2',null,'/sidadmin/menu/2/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0203','0200','학생증 관리자 메뉴3',null,'/sidadmin/menu/3/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0204','0200','학생증 관리자 메뉴4',null,'/sidadmin/menu/4/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0205','0200','학생증 관리자 메뉴5',null,'/sidadmin/menu/5/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0206','0200','학생증 관리자 메뉴6',null,'/sidadmin/menu/6/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0207','0200','학생증 관리자 메뉴7',null,'/sidadmin/menu/7/**','list.do');


Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0300','0300','신분증 관리자 메뉴',null,'/idadmin/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0301','0300','신분증 관리자 메뉴1',null,'/idadmin/menu/1/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0302','0300','신분증 관리자 메뉴2',null,'/idadmin/menu/2/**','list.do');


Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0400','0400','학생 메뉴',null,'/student/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0401','0400','학생 메뉴1',null,'/student/menu/1/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0402','0400','학생 메뉴2',null,'/student/menu/2/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0403','0400','학생 메뉴3',null,'/student/menu/3/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0404','0400','학생 메뉴4',null,'/student/menu/4/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0405','0400','학생 메뉴5',null,'/student/menu/5/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0406','0400','학생 메뉴6',null,'/student/menu/6/**','list.do');


Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0500','0500','교직원 메뉴',null,'/employee/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0501','0500','교직원 메뉴1',null,'/employee/menu/1/**','list.do');

Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0900','0900','슈퍼관리자 메뉴',null,'/superadmin/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('0901','0900','슈퍼관리자 메뉴1',null,'/superadmin/menu/1/**','list.do');


Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('5100','5100','학생증/신분증 관리','ID Card Management','/user/idCard/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('5101','5100','학생증/신분증 신청','ID Card Application','/user/idCard/application/**','agree.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('5102','5100','학생증/신분증 신청 현황','ID Card Application Status','/user/idCard/issue/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('5200','5200','분실 등록','Lost/Damaged Registration','/user/lostReq/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('5201','5200','분실 등록','Lost/Damaged Registration','/user/lostReq/regist/**','detail.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('5300','5300','서비스 관리','Service','/user/service/**',null);
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('5301','5300','공지사항','Notice','/user/service/notice/**','list.do');
Insert into TB_MENU (MENU_CD,MENU_GROUP_CD,MENU_NAME,MENU_NAME_E,MENU_URL,MENU_DEFAULT_URL) values ('5302','5300','이용안내','FAQ','/user/service/faq/**','list.do');


Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0000');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0100');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0101');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0102');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0103');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0104');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0105');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0106');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (1,'0107');


Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0000');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0100');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0101');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0102');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0103');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0104');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0105');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0106');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0107');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0200');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0201');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0202');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0203');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0204');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0205');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0206');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (2,'0207');


Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0000');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0100');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0101');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0102');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0103');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0104');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0105');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0106');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0107');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0300');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0301');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (3,'0302');


Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0000');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0100');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0101');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0102');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0103');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0104');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0105');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0106');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0107');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0400');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0401');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0402');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0403');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0404');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0405');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (4,'0406');


Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0000');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0100');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0101');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0102');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0103');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0104');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0105');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0106');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0107');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0500');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (5,'0501');


Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0000');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0100');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0101');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0102');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0103');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0104');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0105');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0106');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0107');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0200');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0201');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0202');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0203');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0204');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0205');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0206');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0207');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0300');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0301');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0302');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0400');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0401');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0402');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0403');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0404');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0405');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0406');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0500');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0501');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0900');
Insert into TB_ROLE_MENU (ROLE_ID,MENU_CD) values (9,'0901');

insert into TB_ADMIN values ('superadmin',9, '$2a$10$1i8SJF1cXIxD95eLsi7HeewFox35RPD6FZYFOlBQzTfS5gIlt.2AK', '슈퍼관리자', '1', '0', 'system', DATE_FORMAT(now(), '%Y%m%d%H%i%s'), 'system', DATE_FORMAT(now(), '%Y%m%d%H%i%s'));
