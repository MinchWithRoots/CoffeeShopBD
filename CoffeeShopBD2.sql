USE [master]
GO
/****** Object:  Database [CoffeeShop]    Script Date: 16.11.2024 10:55:13 ******/
CREATE DATABASE [CoffeeShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeeShop', FILENAME = N'C:\Users\10241421\CoffeeShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoffeeShop_log', FILENAME = N'C:\Users\10241421\CoffeeShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoffeeShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoffeeShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoffeeShop] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoffeeShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeeShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CoffeeShop] SET QUERY_STORE = OFF
GO
USE [CoffeeShop]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[loyalty_points] [int] NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Customer__CD65CB8583898CB6] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Customer__AB6E61645F7BE0AA] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[salary] [decimal](10, 2) NULL,
	[hire_date] [date] NULL,
	[password] [nvarchar](50) NOT NULL,
	[position_id] [int] NULL,
 CONSTRAINT [PK__Employee__C52E0BA8EF001770] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
	[last_ordered] [date] NULL,
 CONSTRAINT [PK__Inventor__B59ACC49B02C0329] PRIMARY KEY CLUSTERED 
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__OrderIte__3764B6BCEF8764AE] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[order_date] [datetime] NULL,
	[total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Orders__4659622980253742] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[position_id] [int] IDENTITY(1,1) NOT NULL,
	[position_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[position_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__ProductC__D54EE9B4659760FE] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__ProductC__72E12F1BAD7F0C2B] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[category_id] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK__Products__47027DF564C99437] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentItems]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentItems](
	[shipment_item_id] [int] IDENTITY(1,1) NOT NULL,
	[shipment_id] [int] NOT NULL,
	[inventory_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK__Shipment__731D6A95934BB6DE] PRIMARY KEY CLUSTERED 
(
	[shipment_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[shipment_id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [date] NULL,
 CONSTRAINT [PK__Shipment__41466E598DF1C3D1] PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 16.11.2024 10:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[contact_name] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [text] NULL,
 CONSTRAINT [PK__Supplier__6EE594E8C5C9A97F] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF__Customers__loyal__25869641]  DEFAULT ((0)) FOR [loyalty_points]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__order_da__32E0915F]  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__stock__2F10007B]  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_PositionID] FOREIGN KEY([position_id])
REFERENCES [dbo].[Positions] ([position_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_PositionID]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Suppliers] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Suppliers]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([category_id])
REFERENCES [dbo].[ProductCategories] ([category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[ShipmentItems]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentItems_Inventory] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[Inventory] ([inventory_id])
GO
ALTER TABLE [dbo].[ShipmentItems] CHECK CONSTRAINT [FK_ShipmentItems_Inventory]
GO
ALTER TABLE [dbo].[ShipmentItems]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentItems_Shipments] FOREIGN KEY([shipment_id])
REFERENCES [dbo].[Shipments] ([shipment_id])
GO
ALTER TABLE [dbo].[ShipmentItems] CHECK CONSTRAINT [FK_ShipmentItems_Shipments]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Suppliers] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Suppliers]
GO
USE [master]
GO
ALTER DATABASE [CoffeeShop] SET  READ_WRITE 
GO
