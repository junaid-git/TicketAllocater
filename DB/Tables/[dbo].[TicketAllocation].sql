/****** Object:  Table [dbo].[TicketAllocation]    Script Date: 03/08/2014 22:13:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TicketAllocation]') AND type in (N'U'))
DROP TABLE [dbo].[TicketAllocation]
GO

CREATE TABLE [dbo].[TicketAllocation](
	[TicketID] [bigint] IDENTITY(100001,1) NOT NULL,
	[MovieShowTimeID] [int] NOT NULL,
	[AllocatedDate] [datetime] NOT NULL,
	[Seats] [int] NOT NULL,
 CONSTRAINT [PK_TicketAllocation] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


