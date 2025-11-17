#문제 1
select
	고객회사명,
	concat('**', substr(고객회사명,3)) as 고객회사명2,
    전화번호,
    replace(replace(전화번호, '(' , '') , ')', '-') as 전화번호2
from 한빛무역.고객;


#문제4
select
	담당자명,
    고객회사명,
    도시,
	if(도시 regexp '(특별|광역)시', '대도시', '도시') as 도시구분,
    case when 마일리지 >= 100000 then 'VVIP고객'
		when 마일리지 >= 10000 then 'VIP고객'
		else '일반고객'
        end as 마일리지구분
from 한빛무역.고객;

#연습문제 
select 
	*
from 한빛무역.고객 
where 도시 regexp '광역시$'
and (고객번호 regexp '^.C.*' or 고객번호 regexp '^..C.*' );

#예제 4-1
select distinct
    count(지역) as 진짜지역,
    sum(마일리지),
    avg(마일리지),
    min(마일리지),
    max(마일리지),
    지역
from 한빛무역.고객
where 지역 <> ''
group by 지역;

#예제 4-5
select
	담당자직위,
    도시,
    count(*) as 고객수,
    avg(마일리지) as 평균마일리지
from 한빛무역.고객
group by 
	담당자직위,
	도시
order by 1, 2;

#예제 4-6
select
	도시,
    count(*),
    avg(마일리지) as 평균마일리지
from 한빛무역.고객
where 도시 <> '서울특별시'
group by 도시 
having count(*) >= 2;

#예제 4-7
select
	도시,
    sum(마일리지)
from 한빛무역.고객
where 고객번호 regexp '^T'
group by 도시
having sum(마일리지) >= 1000;

#예제 4-8
select
	if(도시 = '' or 도시 is null, '총계', 도시),
    count(*) as 고객수,
    avg(마일리지) as 평균마일리지
from 한빛무역.고객 
where 지역 is null or 지역 = ''
group by 도시
with rollup;

#예제 4-9
select
	도시,
    담당자직위,
    count(*) as 고객수
from 한빛무역.고객
where 담당자직위 regexp '마케팅'
group by 도시, 담당자직위
with rollup;

#예제 4-10
select
	지역,
    count(*) as 고객수,
    grouping(지역) as 구분
from 한빛무역.고객
where 담당자직위 = '대표 이사'
group by 지역
with rollup;

#예제 4-12
select
    group_concat(distinct 지역)
from 한빛무역.고객;

#예제 4-13
select
	 도시,
     group_concat(고객회사명) as 고객회사명목록
from 한빛무역.고객
group by 도시;


#2025-11-13 문제1
select
	count(도시) as 도시,
    count(distinct 도시) as 중복없는도시
from 한빛무역.고객;


#2025-11-13 문제6 
select
	if(마일리지 >= 50000,'VIP고객','일반고객') as 고객구분,
    count(*) as 고객수,
	avg(마일리지)
from 한빛무역.고객
group by 고객구분;


# field and elt 연습
select
	elt(field('java', 'sdkljf', 'java', 'java4'), 'sdkljf', 'java', 'java4');
    

    