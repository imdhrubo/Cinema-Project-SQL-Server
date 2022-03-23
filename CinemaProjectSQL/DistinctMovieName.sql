
Select DISTINCT Movie.[Name] as MovieName, Cinema.Name as CinemaName
from Cinema left join Hall On Cinema.Id = Hall.Cinema_Id
inner join Schedule On Hall.Id = Schedule.Hall_Id
inner join Movie_Schedule On Schedule.Id = Movie_Schedule.Schedule_Id
inner join Movie On Movie_Schedule.Movie_Id = Movie.Id
order by Cinema.Name
