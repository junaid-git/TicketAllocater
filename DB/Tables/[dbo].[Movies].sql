IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movies]') AND type in (N'U'))
DROP TABLE [dbo].[Movies]
GO

CREATE TABLE [dbo].[Movies](
	[MovieID] [int] NOT NULL,
	[MovieName] [varchar](250) NOT NULL,
	[Rating] [varchar](2) NOT NULL,
	[Poster] [varchar](500) NULL
 CONSTRAINT [PK_dbo.Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO