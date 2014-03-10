/****** Object:  Table [dbo].[Cinemas]    Script Date: 03/08/2014 22:12:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cinemas]') AND type in (N'U'))
DROP TABLE [dbo].[Cinemas]
GO

CREATE TABLE [dbo].[Cinemas](
	[CinemaID] [smallint] NOT NULL,
	[CinemaName] [varchar](250) NOT NULL,
	[Capacity] [smallint] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Cinemas] PRIMARY KEY CLUSTERED 
(
	[CinemaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
