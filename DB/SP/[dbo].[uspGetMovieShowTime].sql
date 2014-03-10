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
	    
	SELECT MST.MovieShowTimeID, ST.ShowTime, ST.[Description]
	FROM dbo.MovieShowTime MST WITH(NOLOCK)
	INNER JOIN dbo.ShowTimes ST WITH(NOLOCK) on MST.ShowTimeID = ST.ShowTimeID	
	WHERE MST.MovieID = @MovieID
	AND MST.CinemaID = @CinemaID

	SET NOCOUNT OFF;
END
GO


