#2025-11-13 문제 3
SELECT
	이름,
    생일,
    timestampdiff(year, 생일, curdate()) as 만나이,
    입사일,
    datediff(curdate(), 입사일) as 입사일수,
    adddate(입사일 ,500) as 500일후
from 한빛무역.사원;

select
	사원번호,
    직위,
    사원.부서번호,
    부서명 
from 한빛무역.사원
inner join 한빛무역.부서 
on 사원.부서번호 = 부서.부서번호;