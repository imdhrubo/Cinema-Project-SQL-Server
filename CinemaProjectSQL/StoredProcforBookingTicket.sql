
Create Procedure BookTicket(@user_id int, @number_of_ticket int, @movie_schedule_id int, @ticket_price int out) as
begin
    declare @total_booked_for_given_user int;
    select @total_booked_for_given_user=sum(Booking.number_Of_Seats) from Booking where Booking.UserId=@user_id and Booking.Movie_Schedule_Id =@movie_schedule_id ;
    if @total_booked_for_given_user + @number_of_ticket > 4
    begin
        set @ticket_price = -2;
    end
    else
    begin
        declare @hall_capacity int;
        declare @total_number_of_seat_already_booked int;
        select @hall_capacity = Hall.Capacity from  Hall
        inner join Schedule on Schedule.Hall_Id = Hall.Id
        inner join Movie_Schedule on Movie_Schedule.Schedule_Id = Schedule.Id
        where Movie_Schedule.Id= @movie_schedule_id;
        select @total_number_of_seat_already_booked = sum(Booking.number_Of_Seats) from Booking
        where Movie_Schedule_Id = @movie_schedule_id;
        if @total_number_of_seat_already_booked+ @number_of_ticket > @hall_capacity
        begin
            set @ticket_price = -1;
        end
        else
        begin
            declare @total_ticket_price int;
            select @total_ticket_price = Movie_Schedule.Ticket_Price*@number_of_ticket from Movie_Schedule where Movie_Schedule.id=@movie_schedule_id;
            set @ticket_price = @total_ticket_price;
            insert into Booking(Movie_Schedule_Id,UserId,number_Of_Seats) values(@movie_schedule_id,@user_id,@number_of_ticket);
        end
    end
end

