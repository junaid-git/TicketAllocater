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