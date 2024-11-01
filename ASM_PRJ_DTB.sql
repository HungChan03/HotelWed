USE [master]
GO
/****** Object:  Database [ASM_GROUP3]    Script Date: 10/25/2024 6:09:09 PM ******/
CREATE DATABASE [ASM_GROUP3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASM_GROUP3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ASM_GROUP3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASM_GROUP3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ASM_GROUP3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ASM_GROUP3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASM_GROUP3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASM_GROUP3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ASM_GROUP3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASM_GROUP3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASM_GROUP3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASM_GROUP3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASM_GROUP3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASM_GROUP3] SET  MULTI_USER 
GO
ALTER DATABASE [ASM_GROUP3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASM_GROUP3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASM_GROUP3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASM_GROUP3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASM_GROUP3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASM_GROUP3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ASM_GROUP3] SET QUERY_STORE = ON
GO
ALTER DATABASE [ASM_GROUP3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ASM_GROUP3]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/25/2024 6:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Birthday] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10/25/2024 6:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_ID] [int] NOT NULL,
	[Reservation_ID] [int] NOT NULL,
	[Payment_Date] [date] NOT NULL,
	[Total_Amount] [decimal](10, 2) NOT NULL,
	[Payment_Method] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 10/25/2024 6:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Reservation_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Room_Code] [varchar](10) NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Check_In_Date] [date] NOT NULL,
	[CheckOutDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Reservation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation_Has_Services]    Script Date: 10/25/2024 6:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation_Has_Services](
	[Reservation_ID] [int] NOT NULL,
	[Service_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Sales] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Reservation_ID] ASC,
	[Service_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/25/2024 6:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Room_ID] [int] NOT NULL,
	[Room_Type] [nvarchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IMAGER] [nvarchar](max) NOT NULL,
	[IMAGER1] [nvarchar](max) NOT NULL,
	[IMAGER2] [nvarchar](max) NOT NULL,
	[IMAGER3] [nvarchar](max) NOT NULL,
	[IMAGER4] [nvarchar](max) NOT NULL,
	[IMAGER5] [nvarchar](max) NOT NULL,
	[IMAGER6] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Room_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Manage]    Script Date: 10/25/2024 6:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Manage](
	[Room_Code] [varchar](10) NOT NULL,
	[Room_ID] [int] NOT NULL,
	[Status] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Room_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/25/2024 6:09:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Service_ID] [int] NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[IMAGES] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Service_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [Address], [PhoneNumber], [Email], [Password], [Birthday]) VALUES (0, N'ADMIN', N'ADDRESS', N'0000000000', N'hotel@admin.com', N'pass', CAST(N'1999-09-19' AS Date))
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [Address], [PhoneNumber], [Email], [Password], [Birthday]) VALUES (1, N'Nguyễn Văn A', N'123 Đường Trần Hưng Đạo, Hà Nội', N'0987654321', N'nguyenvana@gmail.com', N'passa', CAST(N'1989-09-18' AS Date))
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [Address], [PhoneNumber], [Email], [Password], [Birthday]) VALUES (2, N'Trần Thị B', N'45 Đường Lê Lợi, Hồ Chí Minh', N'0912345678', N'tranthib@gmail.com', N'passb', CAST(N'1976-09-19' AS Date))
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [Address], [PhoneNumber], [Email], [Password], [Birthday]) VALUES (3, N'Lê Văn C', N'78 Đường Phan Đình Phùng, Đà Nẵng', N'0935678910', N'levanc@gmail.com', N'passc', CAST(N'2004-09-25' AS Date))
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [Address], [PhoneNumber], [Email], [Password], [Birthday]) VALUES (4, N'Phạm Minh D', N'22 Đường Nguyễn Huệ, Hải Phòng', N'0909876543', N'phamminhd@gmail.com', N'passd', CAST(N'1987-09-18' AS Date))
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [Address], [PhoneNumber], [Email], [Password], [Birthday]) VALUES (5, N'Võ Thị E', N'9 Đường Bạch Đằng, Cần Thơ', N'0923456789', N'vothie@gmail.com', N'passe', CAST(N'1999-08-19' AS Date))
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Payment] ([Payment_ID], [Reservation_ID], [Payment_Date], [Total_Amount], [Payment_Method]) VALUES (1, 1, CAST(N'2024-09-19' AS Date), CAST(500000.00 AS Decimal(10, 2)), N'Bank Transfer')
INSERT [dbo].[Payment] ([Payment_ID], [Reservation_ID], [Payment_Date], [Total_Amount], [Payment_Method]) VALUES (2, 2, CAST(N'2024-09-18' AS Date), CAST(1600000.00 AS Decimal(10, 2)), N'Cash')
INSERT [dbo].[Payment] ([Payment_ID], [Reservation_ID], [Payment_Date], [Total_Amount], [Payment_Method]) VALUES (3, 3, CAST(N'2024-09-20' AS Date), CAST(1500000.00 AS Decimal(10, 2)), N'Credit Card')
INSERT [dbo].[Payment] ([Payment_ID], [Reservation_ID], [Payment_Date], [Total_Amount], [Payment_Method]) VALUES (4, 4, CAST(N'2024-09-19' AS Date), CAST(1200000.00 AS Decimal(10, 2)), N'Bank Transfer')
INSERT [dbo].[Payment] ([Payment_ID], [Reservation_ID], [Payment_Date], [Total_Amount], [Payment_Method]) VALUES (5, 5, CAST(N'2024-09-21' AS Date), CAST(2000000.00 AS Decimal(10, 2)), N'Cash')
GO
INSERT [dbo].[Reservation] ([Reservation_ID], [Customer_ID], [Room_Code], [TotalPrice], [Status], [Check_In_Date], [CheckOutDate]) VALUES (1, 1, N'101', CAST(500000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2024-09-20' AS Date), CAST(N'2024-09-22' AS Date))
INSERT [dbo].[Reservation] ([Reservation_ID], [Customer_ID], [Room_Code], [TotalPrice], [Status], [Check_In_Date], [CheckOutDate]) VALUES (2, 2, N'201', CAST(1600000.00 AS Decimal(10, 2)), N'Occupied', CAST(N'2024-09-18' AS Date), CAST(N'2024-09-20' AS Date))
INSERT [dbo].[Reservation] ([Reservation_ID], [Customer_ID], [Room_Code], [TotalPrice], [Status], [Check_In_Date], [CheckOutDate]) VALUES (3, 3, N'302', CAST(1500000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2024-09-21' AS Date), CAST(N'2024-09-23' AS Date))
INSERT [dbo].[Reservation] ([Reservation_ID], [Customer_ID], [Room_Code], [TotalPrice], [Status], [Check_In_Date], [CheckOutDate]) VALUES (4, 4, N'405', CAST(1200000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2024-09-19' AS Date), CAST(N'2024-09-21' AS Date))
INSERT [dbo].[Reservation] ([Reservation_ID], [Customer_ID], [Room_Code], [TotalPrice], [Status], [Check_In_Date], [CheckOutDate]) VALUES (5, 5, N'504', CAST(2000000.00 AS Decimal(10, 2)), N'Booked', CAST(N'2024-09-22' AS Date), CAST(N'2024-09-24' AS Date))
GO
INSERT [dbo].[Reservation_Has_Services] ([Reservation_ID], [Service_ID], [Quantity], [Sales]) VALUES (1, 1, 2, CAST(0.10 AS Decimal(10, 2)))
INSERT [dbo].[Reservation_Has_Services] ([Reservation_ID], [Service_ID], [Quantity], [Sales]) VALUES (2, 2, 1, CAST(0.20 AS Decimal(10, 2)))
INSERT [dbo].[Reservation_Has_Services] ([Reservation_ID], [Service_ID], [Quantity], [Sales]) VALUES (3, 3, 3, CAST(0.25 AS Decimal(10, 2)))
INSERT [dbo].[Reservation_Has_Services] ([Reservation_ID], [Service_ID], [Quantity], [Sales]) VALUES (4, 4, 1, CAST(0.50 AS Decimal(10, 2)))
INSERT [dbo].[Reservation_Has_Services] ([Reservation_ID], [Service_ID], [Quantity], [Sales]) VALUES (5, 5, 2, CAST(0.35 AS Decimal(10, 2)))
GO
INSERT [dbo].[Room] ([Room_ID], [Room_Type], [Capacity], [Price], [Description], [IMAGER], [IMAGER1], [IMAGER2], [IMAGER3], [IMAGER4], [IMAGER5], [IMAGER6]) VALUES (1, N'Single Room', 1, CAST(500000.00 AS Decimal(10, 2)), N'Cozy room for solo travelers.', N'img/single/single.jpg', N'img/single/single1.jpg', N'img/single/single2.jpg', N'img/single/single3.jpg', N'img/single/single4.jpg', N'img/single/single5.jpg', N'img/single/single6.jpg')
INSERT [dbo].[Room] ([Room_ID], [Room_Type], [Capacity], [Price], [Description], [IMAGER], [IMAGER1], [IMAGER2], [IMAGER3], [IMAGER4], [IMAGER5], [IMAGER6]) VALUES (2, N'Double Room', 2, CAST(800000.00 AS Decimal(10, 2)), N'Ideal room for two guests.', N'img/double/double.jpg', N'img/double/double1.jpg', N'img/double/double2.jpg', N'img/double/double3.jpg', N'img/double/double4.jpg', N'img/double/double5.jpg', N'img/double/double6.jpg')
INSERT [dbo].[Room] ([Room_ID], [Room_Type], [Capacity], [Price], [Description], [IMAGER], [IMAGER1], [IMAGER2], [IMAGER3], [IMAGER4], [IMAGER5], [IMAGER6]) VALUES (3, N'Family Room', 4, CAST(1500000.00 AS Decimal(10, 2)), N'Spacious room for the whole family.', N'img/family/family.jpg', N'img/family/family1.jpg', N'img/family/family2.jpg', N'img/family/family3.jpg', N'img/family/family4.jpg', N'img/family/family5.jpg', N'img/family/family6.jpg')
INSERT [dbo].[Room] ([Room_ID], [Room_Type], [Capacity], [Price], [Description], [IMAGER], [IMAGER1], [IMAGER2], [IMAGER3], [IMAGER4], [IMAGER5], [IMAGER6]) VALUES (4, N'Luxury Room', 2, CAST(1200000.00 AS Decimal(10, 2)), N'Luxury room with premium amenities.', N'img/luxury/luxury.jpg', N'img/luxury/luxury1.jpg', N'img/luxury/luxury2.png', N'img/luxury/luxury3.jpg', N'img/luxury/luxury4.jpg', N'img/luxury/luxury5.jpg', N'img/luxury/luxury6.jpg')
INSERT [dbo].[Room] ([Room_ID], [Room_Type], [Capacity], [Price], [Description], [IMAGER], [IMAGER1], [IMAGER2], [IMAGER3], [IMAGER4], [IMAGER5], [IMAGER6]) VALUES (5, N'View Mountain Room', 2, CAST(2000000.00 AS Decimal(10, 2)), N'Scenic mountain view from the room.', N'img/view_mountain/mountain.png', N'img/view_mountain/mountain1.jpg', N'img/view_mountain/mountain2.jpg', N'img/view_mountain/mountain3.jpg', N'img/view_mountain/mountain4.jpg', N'img/view_mountain/mountain5.jpg', N'img/view_mountain/mountain6.jpg')
GO
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'101', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'102', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'103', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'104', 1, N'Booked')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'105', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'106', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'107', 1, N'Occupied')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'108', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'109', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'110', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'201', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'202', 2, N'Booked')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'203', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'204', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'205', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'206', 2, N'Occupied')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'207', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'208', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'209', 2, N'Booked')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'210', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'301', 3, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'302', 3, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'303', 3, N'Occupied')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'304', 3, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'305', 3, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'306', 3, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'307', 3, N'Booked')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'308', 3, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'309', 3, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'310', 3, N'Occupied')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'401', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'402', 1, N'Booked')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'403', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'404', 1, N'Occupied')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'405', 1, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'406', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'407', 2, N'Booked')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'408', 2, N'Occupied')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'409', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'410', 2, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'501', 4, N'Occupied')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'502', 4, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'503', 4, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'504', 4, N'Booked')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'505', 4, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'506', 5, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'507', 5, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'508', 5, N'Occupied')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'509', 5, N'Available')
INSERT [dbo].[Room_Manage] ([Room_Code], [Room_ID], [Status]) VALUES (N'510', 5, N'Available')
GO
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (1, N'Laundry', N'We provide fast and efficient laundry service to keep your clothes fresh and clean during your stay.', CAST(20000.00 AS Decimal(10, 2)), N'img/service/Laundry.jpg')
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (2, N'Spa', N'Enjoy a relaxing spa experience with a variety of treatments including massage and skin care.', CAST(200000.00 AS Decimal(10, 2)), N'img/service/Spa.jpg')
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (3, N'Airport shuttle', N'Reliable airport shuttle service to ensure you reach your destination comfortably and on time.', CAST(200000.00 AS Decimal(10, 2)), N'img/service/Airport_shuttle.jpg')
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (4, N'Food & Restaurant', N'Our restaurant offers a diverse menu with local and international dishes to satisfy all palates.', CAST(350000.00 AS Decimal(10, 2)), N'img/service/Food.jpg')
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (5, N'Bike rental', N'Explore the surroundings with our bike rental service, perfect for a leisurely day out.', CAST(50000.00 AS Decimal(10, 2)), N'img/service/Bike_rental.jpg')
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (6, N'Motorbike rental', N'For those who prefer a faster way to explore, we offer convenient motorbike rentals.', CAST(150000.00 AS Decimal(10, 2)), N'img/service/Motorbike_rental.jpg')
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (7, N'Gym', N'Stay fit and active during your stay with our fully equipped gym, open 24/7 for all guests.', CAST(150000.00 AS Decimal(10, 2)), N'img/service/Gym.jpg')
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (8, N'Bar', N'Our cozy bar offers a wide selection of drinks and cocktails, perfect for unwinding after a long day.', CAST(300000.00 AS Decimal(10, 2)), N'img/service/Bar.jpg')
INSERT [dbo].[Services] ([Service_ID], [ServiceName], [Description], [Price], [IMAGES]) VALUES (9, N'Room & Apartment', N'Comfortable and spacious rooms with all the amenities to ensure a relaxing stay.', CAST(100000.00 AS Decimal(10, 2)), N'img/service/Room.jpg')
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([Reservation_ID])
REFERENCES [dbo].[Reservation] ([Reservation_ID])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([Room_Code])
REFERENCES [dbo].[Room_Manage] ([Room_Code])
GO
ALTER TABLE [dbo].[Reservation_Has_Services]  WITH CHECK ADD FOREIGN KEY([Reservation_ID])
REFERENCES [dbo].[Reservation] ([Reservation_ID])
GO
ALTER TABLE [dbo].[Reservation_Has_Services]  WITH CHECK ADD FOREIGN KEY([Service_ID])
REFERENCES [dbo].[Services] ([Service_ID])
GO
ALTER TABLE [dbo].[Room_Manage]  WITH CHECK ADD FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([Room_ID])
GO
USE [master]
GO
ALTER DATABASE [ASM_GROUP3] SET  READ_WRITE 
GO
