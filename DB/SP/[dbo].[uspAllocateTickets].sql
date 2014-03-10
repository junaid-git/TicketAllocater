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


