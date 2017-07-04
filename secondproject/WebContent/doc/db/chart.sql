-------- ���ɴ뺰 ���� ---------

select substr(age,0,1),
	   count(age) from users 
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