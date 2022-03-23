
Select Hall.Name As HallName, Schedule.Id AS ScheduleId, Schedule.Day, Schedule.Start_Time As StartTime, Schedule.End_Time as Endtime
from
Hall inner join 
Schedule on Hall.Id = Schedule.Hall_Id
left join Movie_Schedule On Schedule.Id = Movie_Schedule.Schedule_Id
Where Movie_Schedule.Schedule_Id is null

