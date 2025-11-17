SELECT 
	고객번호,
    담당자명,
    담당자직위
from 한빛무역.고객
where 담당자직위 in ('영업 과장', '마케팅 과장')
order by 3;


select
	담당자명,
    마일리지 
from 한빛무역.고객
where 마일리지 between 1000 and 20000
order by 2 desc;

select *
from 한빛무역.고객
where 도시 like '%광역시'
and (고객번호 like '_C%' or 고객번호 like '__C%');

/*
select *
from 한빛무역.고객
where 고객회사명 regexp '푸드'
*/

/*
select *
from 한빛무역.고객
where 도시 regexp '인천광역시|서울특별시'
order by 도시;
*/

/*
select *
from 한빛무역.고객
where 도시 regexp '[인천|부산|대전]광역시'
order by 도시;
*/

/*select *
from 한빛무역.고객
where 고객회사명 regexp '^한';
*/
/*
select *
from 한빛무역.고객
where 고객회사명 regexp '^....울$';
*/


#문제 1
SELECT *
from 한빛무역.고객
where 도시 regexp '서울'
and 마일리지 between 15000 and 20000;

#문제 2
SELECT distinct
	지역,
    도시
from 한빛무역.고객
order by 지역,도시;

#문제3
SELECT *
from 한빛무역.고객
where 도시 regexp '(춘천|과천|광명)시'
and 담당자직위 regexp '(이사|사원)';

#문제4
SELECT *
from 한빛무역.고객
where 도시 not regexp '(광역시|특별시)'
order by 마일리지 desc 
limit 3;

#문제5
SELECT *
from 한빛무역.고객
where 지역 is not null
and 지역 <> ''
and 담당자직위 <> '대표 이사';

select
	char_length('hello'),
    length('hello')
    ;
    
select
	concat('hello','subin'),
    concat_ws(' ', 'hello', 'subin');

# concat은 중간에 NULL이 들어있으면 결과가 NULL이 된다.
select
	concat('hello','subin'),
    concat_ws(' ', 'hello', 'subin'),
    concat('hello','subin', NULL),
    concat_ws('-', 'hello', NULL, 'subin');

select
	left('SQL 완전정복',3),
    right('SQL 완전정복',3),
    substr('SQL 완전정복',2),
    substr('SQL 완전정복', 2, 5);
    
select
	substring_index('서울시 동작구 흑석로', ' ', 2) as answer;
    
select
	lpad('sql',10,'#'),
    rpad('sql', 10, '#');

select
	length(ltrim(' sql ')),
    length(rtrim(' sql ')),
    length(trim(' sql '));

select
	trim(both 'abc' from 'abcdfkjsdhfabc');
    
select
	field('java', 'javaplus','Java','C'),
    find_in_set('java', 'java,sdljf,dflskd'),
    instr('네 인생을 살아라', '인생'),
    locate('인생', '네 인생을 살아라');

select
	elt(2,'java','python','c');

select
	repeat('df', 5);

select
	replace('010-8946-7584', '-', ' ');

select
	reverse('hello');

select
	ceiling(2.1),
    floor(2.9),
    round(3.15343, 2),
    truncate(3.25352,2);
select
	sign(100),
    sign(-100),
    sign(0),
    abs(-2030);
    
select
	power(3,4),
    rand(),
    rand(5),
    round(rand() * 100);
select
	now(),
	datediff('2025-11-13', now()),
    timestampdiff(hour, now(), '2025-11-13');
    
select
	adddate(now(), interval 4 month),
    subdate(now(), interval 4 month);
    
select
	last_day(now()),
    dayofyear(now()),
    monthname(now()),
    weekday(now());
    
select
	cast('1' as unsigned),
    cast(2 as char(1));
