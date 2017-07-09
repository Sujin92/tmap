-------- ���ɴ뺰 ���� ---------

select substr(age,0,1),
	   count(age) from users 
	   group by substr(age,0,1) 
	   order by 1 desc 

-------- ���� ------------
select substr(age,0,1),
	   count(age) from users
	   where reg_date = sysdate
	   group by substr(age,0,1) 
	   order by 1 desc 
	   
	   
-------- ī�װ��� �ıⰹ�� (���ɴ�, ����)---------

-- ��ü

select count(r.review_id), sc.category_title
	   from review r, shop s, shop_category sc
	   where r.shop_id = s.shop_id
	   and s.category_id = sc.category_id
	   group by sc.category_title

-- ���� ( ���� )

select count(r.review_id), sc.category_title
	   from review r, shop s, shop_category sc, users u
	   where r.shop_id = s.shop_id
	   and s.category_id = sc.category_id
	   and u.user_id = r.user_id
	   and u.gender = 1
	   group by sc.category_title

-- ���� ( ���� )

select count(r.review_id), sc.category_title
	   from review r, shop s, shop_category sc, users u
	   where r.shop_id = s.shop_id
	   and s.category_id = sc.category_id
	   and u.user_id = r.user_id
	   and u.gender = 2
	   group by sc.category_title

-------- ������ ��ϵ� ���� �� ---------

select count(shop_id) as count, 
substr(address, 0, instr(address,' ')) as addressgroup
from shop
group by substr(address, 0, instr(address,' '));

-------- ī�װ��� ��ȣ�� (����) ---------

select NVL((SELECT avg(score) FROM review WHERE shop_id = s.shop_id), 0) as score
FROM SHOP s, shop_category sc
where s.category_id = sc.category_id


-------- ī�װ��� ��ȣ�� (����) ---------
SELECT
   (SELECT category_title FROM shop_category WHERE category_id = a.category_id) category_title,
   avg(score) aaa
	FROM
	(
  	 SELECT
      	r.score, 
      	(SELECT category_id FROM shop WHERE shop_id = r.shop_id) category_id
  	 FROM review r
	) a
	GROUP BY category_id