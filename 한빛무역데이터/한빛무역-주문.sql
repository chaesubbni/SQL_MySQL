#문제 2
select
	year(주문일) as 주문년도,
    count(*) as 주문건수
from 한빛무역.주문
group by 주문년도;

#문제3
select
	year(주문일) as 주문년도,
    quarter(주문일) as 분기,
    count(*) as 주문건수
from 한빛무역.주문
group by 주문년도, 분기
with rollup;

#문제4
select
	month(주문일) as 주문월,
    count(*)
from 한빛무역.주문
where datediff(발송일, 요청일) > 0
group by 주문월
order by 1;
