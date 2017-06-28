DROP SEQUENCE SEQ_SHOP_CATEGORY_ID;
CREATE SEQUENCE SEQ_SHOP_CATEGORY_ID start with 1;

TRUNCATE TABLE SHOP_CATEGORY;

Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE,CATEGORY_ORDER) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'한식',SEQ_SHOP_CATEGORY_ID.CURRVAL);
Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE,CATEGORY_ORDER) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'일식',SEQ_SHOP_CATEGORY_ID.CURRVAL);
Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE,CATEGORY_ORDER) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'중식',SEQ_SHOP_CATEGORY_ID.CURRVAL);
Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE,CATEGORY_ORDER) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'미식',SEQ_SHOP_CATEGORY_ID.CURRVAL);
Insert into MAP.SHOP_CATEGORY (CATEGORY_ID,CATEGORY_TITLE,CATEGORY_ORDER) values (SEQ_SHOP_CATEGORY_ID.NEXTVAL,'기타',SEQ_SHOP_CATEGORY_ID.CURRVAL);
