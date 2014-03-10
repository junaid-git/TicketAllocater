/****** Object:  StoredProcedure [dbo].[uspGetCinemas]    Script Date: 03/09/2014 08:37:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetCinemas]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetCinemas]
GO

CREATE PROCEDURE [dbo].[uspGetCinemas]
AS
BEGIN	
	SET NOCOUNT ON;
	    
	SELECT CinemaID,CinemaName,Price,Capacity
	FROM dbo.Cinemas
	
	SET NOCOUNT OFF;
END
GO

/****** Object:  StoredProcedure [dbo].[uspGetMovies]    Script Date: 03/09/2014 08:37:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetMovies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetMovies]
GO

CREATE PROCEDURE [dbo].[uspGetMovies]
(
	@SelectedDate DateTime,
	@CinemaID  smallint	
)
AS
BEGIN	
	SET NOCOUNT ON;
	    
	SELECT M.MovieID, M.MovieName, M.Rating, M.Poster 
	FROM dbo.Movies M WITH(NOLOCK)
	INNER JOIN dbo.MovieShowTime MST WITH(NOLOCK)
	ON M.MovieID = MST.MovieID
	INNER JOIN dbo.Cinemas C WITH(NOLOCK)
	ON C.CinemaID = MST.CinemaID
	WHERE @SelectedDate >= MST.ReserveDate
	AND @SelectedDate <= MST.ExpiryDate
	AND C.CinemaID = @CinemaID

	SET NOCOUNT OFF;
END
GO


/****** Object:  StoredProcedure [dbo].[uspGetMovieShowTime]    Script Date: 03/09/2014 08:19:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetMovieShowTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetMovieShowTime]
GO

CREATE PROCEDURE [dbo].[uspGetMovieShowTime]
(
	@MovieID int,
	@CinemaID  smallint	
)	
AS
BEGIN	
	SET NOCOUNT ON;
	    
	SELECT MST.MovieShowTimeID as 'ShowTimeID', ST.ShowTime, ST.[Description]
	FROM dbo.MovieShowTime MST WITH(NOLOCK)
	INNER JOIN dbo.ShowTimes ST WITH(NOLOCK) on MST.ShowTimeID = ST.ShowTimeID	
	WHERE MST.MovieID = @MovieID
	AND MST.CinemaID = @CinemaID

	SET NOCOUNT OFF;
END
GO


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


/****** Object:  StoredProcedure [dbo].[uspAllocateTickets]    Script Date: 03/09/2014 08:19:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspAllocateTickets]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspAllocateTickets]
GO

CREATE PROCEDURE [dbo].[uspAllocateTickets]
(
	@MovieShowTimeID int,	
	@SelectedDate DateTime,
	@Seats smallint,
	@ErrorNo int Output,
	@ErrorMessage NVarchar(MAX) Output
)
AS
BEGIN	
	SET NOCOUNT ON;
	SELECT @ErrorNo = 0, @ErrorMessage = '' --SUCCESS   	
	 
	BEGIN TRY 
		BEGIN TRAN
			INSERT INTO dbo.TicketAllocation (MovieShowTimeID, AllocatedDate, Seats)
			SELECT @MovieShowTimeID, @SelectedDate, @Seats
		COMMIT TRAN
	END TRY	
	BEGIN CATCH		
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN			
		SELECT @ErrorNo = ERROR_NUMBER(), @ErrorMessage = ERROR_MESSAGE()
	END CATCH
	

	SET NOCOUNT OFF;
END
GO