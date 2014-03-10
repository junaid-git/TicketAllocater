/****** Object:  Table [dbo].[ShowTimes]    Script Date: 03/09/2014 13:03:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShowTimes]') AND type in (N'U'))
DROP TABLE [dbo].[ShowTimes]
GO

CREATE TABLE [dbo].[ShowTimes](
	[ShowTimeID] [tinyint] NOT NULL,
	[ShowTime] [time](0) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_ShowTimes] PRIMARY KEY CLUSTERED 
(
	[ShowTimeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO