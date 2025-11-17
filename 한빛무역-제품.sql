#2025-11-13 문제5
select
	제품명,
    sum(재고) as 재고합
from 한빛무역.제품 
where 제품명 regexp '아이스크림'
group by 제품명;

