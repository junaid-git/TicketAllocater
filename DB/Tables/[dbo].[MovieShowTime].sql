IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovieShowTime]') AND type in (N'U'))
DROP TABLE [dbo].[MovieShowTime]
GO

CREATE TABLE [dbo].[MovieShowTime](
	[MovieShowTimeID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[CinemaID] [smallint] NOT NULL,
	[ShowTimeID] [tinyint] NOT NULL,
	[ReserveDate] [date] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
 CONSTRAINT [PK_MovieShowTime] PRIMARY KEY CLUSTERED 
(
	[MovieShowTimeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO