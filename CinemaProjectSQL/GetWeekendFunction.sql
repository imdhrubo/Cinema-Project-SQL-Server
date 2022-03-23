CREATE FUNCTION GetWeekendForHall(@Hall_Id int )  
RETURNS INT  
AS  
BEGIN 
 declare @WeekDays table (Day_No int unique, check (Day_No between 1 and 7))
 declare @Weekend INT
 insert into @WeekDays values (1);
 insert into @WeekDays values (2);
 insert into @WeekDays values (3);
 insert into @WeekDays values (4);
 insert into @WeekDays values (5);
 insert into @WeekDays values (6);
 insert into @WeekDays values (7);   
 Select @Weekend = Day_No from @WeekDays WK left join 

                   ( Select Day from Hall inner join Schedule
				     on Hall.Id = Schedule.Hall_Id
					 where Hall.Id = @Hall_Id ) D

				  on WK.Day_No = D.Day
				  where D.Day is null                 
Return @Weekend 
END
