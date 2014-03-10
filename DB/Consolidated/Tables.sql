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