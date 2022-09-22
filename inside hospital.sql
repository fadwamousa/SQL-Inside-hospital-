/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [emp_id]
      ,[action]
      ,[time]
  FROM [master].[dbo].[hospital]

  select * from (
  select emp_id , 
         max(case when action='in' then time end) as IN_Time,
		 max(case when action='out' then time end) as OUT_Time
  from hospital h
  group by emp_id
) as x
where IN_Time > OUT_Time or OUT_Time is null
