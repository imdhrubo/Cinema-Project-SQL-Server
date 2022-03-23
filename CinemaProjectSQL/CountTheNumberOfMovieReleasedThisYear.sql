
Select Count(DISTINCT Movie.[Name]) as MovieCount, Cinema.Name As CinemaName
from Cinema inner join Hall On Cinema.Id = Hall.Cinema_Id
inner join Schedule On Hall.Id = Schedule.Hall_Id
inner join Movie_Schedule On Schedule.Id = Movie_Schedule.Schedule_Id
inner join Movie On Movie_Schedule.Movie_Id = Movie.Id
where (Select Year(Movie.Release_Date)) = Year(GetDate())
group by Cinema.Name

Select Count(DISTINCT Movie.[Name]) as MovieCount, Cinema.Name As CinemaName
from Cinema inner join Hall On Cinema.Id = Hall.Cinema_Id
inner join Schedule On Hall.Id = Schedule.Hall_Id
inner join Movie_Schedule On Schedule.Id = Movie_Schedule.Schedule_Id
inner join Movie On Movie_Schedule.Movie_Id = Movie.Id
where (Select month(Movie.Release_Date)) = Month(GetDate())
group by Cinema.Name 

