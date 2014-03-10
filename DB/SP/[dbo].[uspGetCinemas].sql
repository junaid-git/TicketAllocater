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