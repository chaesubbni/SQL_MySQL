select
	부서.부서번호,
    부서명,
    사원.이름,
    사원.부서번호
from 한빛무역.부서 
cross join 한빛무역.사원 
on 부서.부서번호 = 사원.부서번호
where 사원.이름 = '배재용';


select
	사원번호,
    직위,
    사원.부서번호,
    부서명 
from 한빛무역.사원
inner join 한빛무역.부서 
on 사원.부서번호 = 부서.부서번호
where 이름 = '이소미';

select
	고객.고객번호,
    담당자명,
    고객회사명,
	count(*) as 주문건수
from 한빛무역.고객
inner join 한빛무역.주문
on 고객.고객번호 = 주문.고객번호
group by 
	고객.고객번호,
    담당자명,
    고객회사명
order by 주문건수 desc;

select
	고객.고객번호,
    담당자명,
    고객회사명,
    sum(단가*주문수량) as 주문금액합
from 한빛무역.고객
inner join 한빛무역.주문
on 고객.고객번호 = 주문.고객번호
inner join 한빛무역.주문세부 
on 주문.주문번호 = 주문세부.주문번호
group by
		고객번호,
		담당자명,
        고객회사명
order by 주문금액합 desc;


select
	고객.고객번호,
    고객.담당자명,
    고객.마일리지,
    마일리지등급.*
from 한빛무역.고객 
cross join 한빛무역.마일리지등급
where 고객.담당자명 = '이은광';

select
	고객번호,
    고객회사명,
    담당자명,
    마일리지,
    등급명 
from 한빛무역.고객 
inner join 한빛무역.마일리지등급
on 마일리지 between 하한마일리지 and 상한마일리지
where 담당자명 = '이은광';

#예제 5-7
select
	사원번호,
    이름,
    부서명
from 한빛무역.사원
left join 한빛무역.부서
on 사원.부서번호 = 부서.부서번호
where 성별 = '여';

#예제 5-8 and 예제 5-9
select
	부서명,
    사원.*
from 한빛무역.부서
left join 한빛무역.사원
on 부서.부서번호 = 사원.부서번호
where 사원.사원번호 is null;

#예제5-10
select
	부서.부서번호,
    사원.부서번호
from 한빛무역.부서
left join 한빛무역.사원 
on 부서.부서번호 = 사원.부서번호
where 사원.부서번호 is null;

select *
from 한빛무역.사원;


#예제5-11
select
	사원.사원번호,
    사원.이름,
    상사.사원번호,
    상사.이름
from 한빛무역.사원 
inner join 한빛무역.사원 as 상사
on 사원.상사번호 = 상사.사원번호;


#2025-11-13문제1
select
	제품.제품명 as 제품명,
    sum(주문세부.주문수량) as 주문수량합,
    sum(주문세부.단가 * 주문세부.주문수량) as 주문금액합
from 한빛무역.제품
left join 한빛무역.주문세부
on 제품.제품번호 = 주문세부.제품번호
group by 제품명; 

#2025-11-13문제2
select
	year(주문.주문일) as 주문년도,
    제품.제품명 as 제품명,
    sum(주문세부.주문수량) as 주문수량합
from 한빛무역.주문세부 
inner join 한빛무역.주문
on 주문.주문번호 = 주문세부.주문번호
inner join 한빛무역.제품
on 주문세부.제품번호 = 제품.제품번호
where 제품명 regexp '아이스크림'
group by 1, 2;


#2025-11-13문제3
select
	제품.제품명 as 제품명,
    sum(주문세부.주문수량) as 주문수량합
from 한빛무역.제품 
left join 한빛무역.주문세부
on 제품.제품번호 = 주문세부.제품번호
group by 제품명;


#2025-11-13문제4
select
	고객번호,
    고객회사명,
    담당자명,
    등급명,
    마일리지
from 한빛무역.고객
inner join 한빛무역.마일리지등급
on 마일리지 between 하한마일리지 and 상한마일리지
where 등급명 = 'A'; 



# 연습분제
select 사원번호,
이름,
부서명
from 한빛무역.사원
left join 한빛무역.부서
on 사원.부서번호 <> 부서.부서번호;


# 2025-11-14 예제 6-1
select
	고객회사명,
    담당자명
from 한빛무역.고객
inner join 한빛무역.주문
on 고객.고객번호 = 주문.고객번호
where 주문.주문번호 = 'H0250';

select
	고객회사명,
    담당자명
from 한빛무역.고객
where 고객.고객번호 = (select 주문.고객번호 
					from 한빛무역.주문 
                    where 주문번호 = 'H0250');
                    
                    
select
	고객회사명,
    담당자명
from 한빛무역.고객
where 고객.고객번호 in (select 주문.고객번호 
					from 한빛무역.주문 
                    where 주문번호 = 'H0250');
                    
                    
#예제 6-4
select
	count(*) as 주문건수
from 한빛무역.주문
where 고객번호 = (select
					고객번호
				from 한빛무역.고객 
                where 도시 = '부산광역시');
                
                
                
#예제 6-5
select
	담당자명,
    고객회사명,
    마일리지
from 한빛무역.고객
where 마일리지 > ANY (select
						마일리지
                    from 한빛무역.고객
                    where 도시 = '부산광역시');
                    
#예제 6-6
select
	담당자명,
    고객회사명,
    마일리지
from 한빛무역.고객 
where 마일리지 > all (select
						avg(마일리지)
					from 한빛무역.고객 
                    group by 지역);
                    
                    
#예제 6-7
select
	고객번호,
    고객회사명
from 한빛무역.고객
where exists (select
					1
				from 한빛무역.주문 
                where 고객번호 = 고객.고객번호)
order by 2;

#예제 6-8
select
	도시,
    avg(마일리지) as 평균마일리지
from 한빛무역.고객
group by 도시
having avg(마일리지) > (select avg(마일리지) from 한빛무역.고객);


#예제 6-9
select
	담당자명,
    마일리지,
    고객.도시,
    도시_평균마일리지,
    도시_평균마일리지 - 마일리지 as 차이
from 한빛무역.고객,
(select 도시, avg(마일리지) as 도시_평균마일리지 from 한빛무역.고객 group by 도시) as 도시별요약
where 고객.도시 = 도시별요약.도시;


select distinct
	고객.고객번호,
    고객.고객회사명
from 한빛무역.고객
inner join 한빛무역.주문
on 고객.고객번호 = 주문.고객번호
order by 2;


#예제 6-10
select
	고객.고객번호,
    담당자명,
    (select max(주문일) from 한빛무역.주문 where 고객.고객번호 = 주문.고객번호) as 최종주문일
from 한빛무역.고객
order by 1;

select
	고객.고객번호,
    담당자명,
    max(주문일) as 최종주문일
from 한빛무역.고객
left join 한빛무역.주문 
on 고객.고객번호 = 주문.고객번호
group by 1,2
order by 1;
    
with 도시별요약 as
	(
	select 
		도시,
		avg(마일리지) as 도시_평균마일리지
		from 한빛무역.고객
		group by 도시
	)
select
	담당자명,
    고객회사명,
    마일리지,
    고객.도시,
    도시_평균마일리지
from 한빛무역.고객, 도시별요약
where 고객.도시 = 도시별요약.도시;



#문제1
with 사원 as (select 사원.이름, 사원.부서번호 from 한빛무역.사원 where 사원.이름 = '배재용')
select
	부서.부서명 
from 한빛무역.부서, 사원
where 부서.부서번호 = 사원.부서번호;

#문제2
select
	제품.*,
    (제품.재고 * 제품.단가) as 재고금액
from 한빛무역.제품
where 제품.제품번호 not in (select 주문세부.제품번호 from 한빛무역.주문세부);

#문제3
with 완전주문 as (
select 고객번호, count(*) as 주문건수, min(주문.주문일) as 최초주문일, 
max(주문.주문일) as 최종주문일 
from 한빛무역.주문
group by 1)
select
	고객.담당자명,
    고객.고객회사명,
    주문건수,
    최초주문일,
    최종주문일
from 한빛무역.고객, 완전주문
where 고객.고객번호 = 완전주문.고객번호;


insert into 한빛무역.부서
values('A5', '마케팅부');
select *
from 한빛무역.부서;

insert into 한빛무역.사원(사원번호, 이름, 직위, 성별, 입사일)
values ('E20', '김사과', '수습사원', '남', curdate()),
		('E21', '김사과', '수습사원', '남', curdate()),
        ('E22', '김사과', '수습사원', '남', curdate());