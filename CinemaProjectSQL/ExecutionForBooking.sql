declare @ticket_price int ;
execute BookTicket 2,3,4,@ticket_price output;
print @ticket_price;
