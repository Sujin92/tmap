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
