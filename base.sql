Select product_type,  sum(purchase_price) sum1, sum(sale_price) sum2 
from Product 
group by product_type
having sum(purchase_price)= sum(sale_price)*1.5


Select product_id, product_name, product_type,regist_date
order by regist_date desc



BEGIN TRANSACTION;


COMMIT;

--5 关联子查询
select  product_id, product_name, product_type
        sale_price,(select avg(sale_price) from Product p2 where p2.product_type=p1.product_type )
        from Product as p1
