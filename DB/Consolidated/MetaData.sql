
/****** Object:  Table [dbo].[ShowTimes]    Script Date: 03/09/2014 16:04:33 ******/
DELETE FROM [dbo].[ShowTimes]
GO
INSERT [dbo].[ShowTimes] ([ShowTimeID], [ShowTime], [Description]) VALUES (1, CAST(0x00B09A0000000000 AS Time), N'Morning Show')
INSERT [dbo].[ShowTimes] ([ShowTimeID], [ShowTime], [Description]) VALUES (2, CAST(0x00E8CB0000000000 AS Time), N'Matinee')
INSERT [dbo].[ShowTimes] ([ShowTimeID], [ShowTime], [Description]) VALUES (3, CAST(0x0028040100000000 AS Time), N'First Show')
INSERT [dbo].[ShowTimes] ([ShowTimeID], [ShowTime], [Description]) VALUES (4, CAST(0x0060350100000000 AS Time), N'Second Show')
/****** Object:  Table [dbo].[MovieShowTime]    Script Date: 03/09/2014 16:04:33 ******/
DELETE FROM [dbo].[MovieShowTime]
GO
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (101, 10005, 1, 1, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (102, 10005, 1, 2, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (103, 10005, 1, 3, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (104, 10001, 1, 4, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (105, 10002, 2, 1, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (106, 10003, 2, 2, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (107, 10004, 2, 3, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (108, 10005, 2, 4, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (109, 10005, 3, 1, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (110, 10006, 3, 2, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (111, 10007, 3, 3, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (112, 10008, 3, 4, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (113, 10008, 4, 1, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (114, 10008, 4, 2, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (115, 10009, 4, 3, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
INSERT [dbo].[MovieShowTime] ([MovieShowTimeID], [MovieID], [CinemaID], [ShowTimeID], [ReserveDate], [ExpiryDate]) VALUES (116, 10010, 4, 4, CAST(0x3C380B00 AS Date), CAST(0x5A380B00 AS Date))
/****** Object:  Table [dbo].[Movies]    Script Date: 03/09/2014 16:04:33 ******/
DELETE FROM [dbo].[Movies]
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10001, N'12 Years a Slave', N'UA', N'http://upload.wikimedia.org/wikipedia/en/5/5c/12_Years_a_Slave_film_poster.jpg')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10002, N'Blue Jasmine', N'A', N'http://en.wikipedia.org/wiki/File:Blue_Jasmine_poster.jpg')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10003, N'Lady in Number 6', N'A', N'http://en.wikipedia.org/wiki/File:The_Lady_in_Number_6.jpg')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10004, N'Frozen', N'U', N'http://en.wikipedia.org/wiki/File:Frozen_(2013_film)_poster.jpg')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10005, N'Gravity', N'U', N'http://en.wikipedia.org/wiki/File:Gravity_Poster.jpg')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10006, N'The Great Gatsby', N'U', N'http://en.wikipedia.org/wiki/File:Gatsby_1925_jacket.gif')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10007, N'20 Feet from Stardom', N'UA', N'http://upload.wikimedia.org/wikipedia/en/0/08/Twenty_Feet_From_Stardom_poster.jpg')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10008, N'Dallas Buyers Club', N'A', N'http://en.wikipedia.org/wiki/File:Dallas_Buyers_Club_poster.jpg')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10009, N'Mr. Hublot', N'U', N'http://en.wikipedia.org/wiki/File:Mr_Hublot.jpg')
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Rating], [Poster]) VALUES (10010, N'Her', N'UA', N'http://en.wikipedia.org/wiki/File:Her2013Poster.jpg')
/****** Object:  Table [dbo].[Cinemas]    Script Date: 03/09/2014 16:04:33 ******/
DELETE FROM [dbo].[Cinemas]
GO
INSERT [dbo].[Cinemas] ([CinemaID], [CinemaName], [Capacity], [Price]) VALUES (1, N'Omega', 1000, 150.0000)
INSERT [dbo].[Cinemas] ([CinemaID], [CinemaName], [Capacity], [Price]) VALUES (2, N'Alpha', 250, 100.0000)
INSERT [dbo].[Cinemas] ([CinemaID], [CinemaName], [Capacity], [Price]) VALUES (3, N'Beta', 500, 110.0000)
INSERT [dbo].[Cinemas] ([CinemaID], [CinemaName], [Capacity], [Price]) VALUES (4, N'Gamma', 750, 120.0000)
