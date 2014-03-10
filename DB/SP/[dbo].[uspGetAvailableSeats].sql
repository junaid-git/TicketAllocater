/****** Object:  StoredProcedure [dbo].[uspGetAvailableSeats]    Script Date: 03/09/2014 08:19:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetAvailableSeats]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetAvailableSeats]
GO

CREATE PROCEDURE [dbo].[uspGetAvailableSeats]
(
	@MovieShowTimeID int,	
	@SelectedDate DateTime
)	
AS
BEGIN	
	SET NOCOUNT ON;
	    
	SELECT (C.Capacity - SUM(ISNULL(TA.Seats,0))) AS 'AvailableSeats'
	FROM dbo.Cinemas C WITH(NOLOCK)
	INNER JOIN dbo.MovieShowTime MST WITH(NOLOCK) on C.CinemaID = MST.CinemaID
	LEFT OUTER JOIN dbo.TicketAllocation TA WITH(NOLOCK) 
	on TA.MovieShowTimeID = MST.MovieShowTimeID				
	AND TA.AllocatedDate = @SelectedDate
	WHERE MST.MovieShowTimeID = @MovieShowTimeID	
	GROUP BY C.Capacity

	SET NOCOUNT OFF;
END
GO


