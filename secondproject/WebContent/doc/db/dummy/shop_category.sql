DROP SEQUENCE SEQ_SHOP_CATEGORY_ID;
CREATE SEQUENCE SEQ_SHOP_CATEGORY_ID start with 1;

TRUNCATE TABLE SHOP_CATEGORY;

Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'�ѽ�');
Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'�Ͻ�');
Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'�߽�');
Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'�̽�');
Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'��Ÿ');