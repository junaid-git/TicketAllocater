Select * from dbo.Movies
Select * from dbo.Cinemas
Select * from dbo.ShowTimes
Select * from dbo.MovieShowTime


EXEC	[dbo].[uspGetAvailableSeats] 101 , N'2014-03-09'

INSERT INTO dbo.TicketAllocation (MovieShowTimeID, AllocatedDate, Seats)
SELECT 101, '2014-03-09', 50