select x.name
from student x
where x.name = (select name
from student a
where x.name=a.name and x.score>80 )


-- 子查询可以是查询商品比平均价格高的商品
-- 关联子查询可以查询价格高于相同品类的商品

select studentName
from student s1
where id in (select stduentId s2
from student
where s2.kecheng=s1.kecheng and s1.id=s2.id and score>80)


-- S (SNO,SNAME) 学生关系。SNO 为学号，SNAME 为姓名

-- C (CNO,CNAME,CTEACHER) 课程关系。CNO 为课程号，CNAME 为课程名，CTEACHER 为任课教师

-- SC(SNO,CNO,SCGRADE) 选课关系。SCGRADE 为成绩

-- 1. 找出没有选修过“李明”老师讲授课程的所有学生姓名

select SNAME
from S
where SNO NOT  in 
(select SNO
from SC join C ON C.CNO = SC.CNO
WHERE CTEACHER='李明')

-- 2. 列出有二门以上(含两门)不及格课程的学生姓名及其平均成绩

-- 我的解
select S.SNO, SNAME, AVG(SC.GRADE) AS AVG
from S
    JOIN SC ON SC.SNO= S.SNO
    JOIN (SELECT SNO
    from sc
    where GRADE<60
    group BY SNO
    having count(*)>=2) X ON X.SNO=S.SNO
GROUP BY S.SNO, SNAME
order by sno

-- 优化
select S.SNO, SNAME, AVG(SC.GRADE) AS AVG
from S,SC 
WHERE SC.SNO= S.SNO AND S.SNO IN
     (SELECT SNO
    from sc
    where GRADE<60
    group BY SNO
    having count(*)>=2) 
GROUP BY S.SNO, SNAME
order by sno

-- 最优解
SELECT S.SNO, S.SNAME, AVG(SC.GRADE)
FROM S, SC
WHERE S.SNO=SC.SNO
GROUP BY S.SNO,S.SNAME
HAVING COUNT(CASE WHEN SC.GRADE <60 THEN 1 END)>=2



