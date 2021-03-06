USE [master]
GO
/****** Object:  Database [TheGate]    Script Date: 2013-02-24 10:49:40 PM ******/
CREATE DATABASE [TheGate]
GO
ALTER DATABASE [TheGate] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheGate].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [TheGate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheGate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheGate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheGate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheGate] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheGate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TheGate] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TheGate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheGate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheGate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheGate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheGate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheGate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheGate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheGate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheGate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TheGate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheGate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheGate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheGate] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [TheGate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheGate] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TheGate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheGate] SET RECOVERY FULL 
GO
ALTER DATABASE [TheGate] SET  MULTI_USER 
GO
ALTER DATABASE [TheGate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheGate] SET DB_CHAINING OFF 
GO
USE [TheGate]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2013-02-24 10:49:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[accountNumber] [varchar](6) NOT NULL,
	[primaryContact] [int] NOT NULL,
	[phone] [varchar](14) NOT NULL,
	[fax] [varchar](10) NULL,
	[website] [varchar](50) NULL,
	[generalEmail] [varchar](50) NULL,
	[address] [int] NOT NULL,
	[billingAddress] [int] NOT NULL,
 CONSTRAINT [PrimaryKey_769fbe63-3383-47ec-96ce-9f0d718527be] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 2013-02-24 10:49:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Addresses](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[line1] [varchar](50) NOT NULL,
	[line2] [varchar](50) NULL,
	[city] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[zipcode] [varchar](7) NOT NULL,
 CONSTRAINT [PrimaryKey_3796a672-6710-4776-afa8-1801463bd9a6] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2013-02-24 10:49:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PrimaryKey_9e9ffc2e-3dc3-45eb-a416-f18248d81477] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 2013-02-24 10:49:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[contactID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[shippingAddress] [int] NULL,
	[billingAddress] [int] NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](14) NULL,
	[fax] [varchar](14) NULL,
 CONSTRAINT [PrimaryKey_f3e4b1a1-2a6a-47a8-b5b0-03436863840c] PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2013-02-24 10:49:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[employeeID] [int] IDENTITY(1,1) NOT NULL,
	[contactID] [int] NOT NULL,
	[employeeNumber] [varchar](10) NOT NULL,
	[salary] [decimal](8, 2) NULL,
	[hourlyRate] [decimal](4, 2) NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
 CONSTRAINT [PrimaryKey_13b34df2-6ddb-4109-97d0-1d307162a1b8] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 2013-02-24 10:49:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[orderLineID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PrimaryKey_389a750b-ef80-4650-bae5-0ce93978d45a] PRIMARY KEY CLUSTERED 
(
	[orderLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2013-02-24 10:49:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[type] [int] NOT NULL,
	[state] [int] NOT NULL,
	[contactID] [int] NOT NULL,
	[accountID] [int] NULL,
	[dateMade] [datetime] NOT NULL,
	[dateShipped] [datetime] NOT NULL,
	[dateRecieved] [datetime] NULL,
 CONSTRAINT [PrimaryKey_10082f2e-cbb3-4b49-8ef6-5a729387caa8] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[OrderStates]    Script Date: 2013-02-24 10:49:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderStates](
	[orderStateID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PrimaryKey_0ecdefd6-af03-4d10-8730-cb9fb072e4b8] PRIMARY KEY CLUSTERED 
(
	[orderStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTypes]    Script Date: 2013-02-24 10:49:41 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTypes](
	[orderTypeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PrimaryKey_bfdbd2b1-f803-461f-b8c7-a8dd6f44f276] PRIMARY KEY CLUSTERED 
(
	[orderTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2013-02-24 10:49:41 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[price] [decimal](6, 2) NOT NULL,
	[categoryID] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[onHand] [int] NOT NULL,
	[onOrder] [int] NOT NULL,
 CONSTRAINT [PrimaryKey_664967ea-2930-4c82-b7de-885868956153] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2013-02-24 10:49:41 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PrimaryKey_fd1e2765-f59c-4523-913c-13271140b333] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeSheetLines]    Script Date: 2013-02-24 10:49:41 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheetLines](
	[timeSheetLineID] [int] IDENTITY(1,1) NOT NULL,
	[timeSheetID] [int] NOT NULL,
	[hours] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PrimaryKey_a95288b3-bc64-412d-93d1-dd7f5c1397aa] PRIMARY KEY CLUSTERED 
(
	[timeSheetLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TimeSheets]    Script Date: 2013-02-24 10:49:41 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheets](
	[timeSheetID] [int] IDENTITY(1,1) NOT NULL,
	[employeeID] [int] NOT NULL,
	[periodStart] [datetime] NOT NULL,
	[periodEnd] [datetime] NOT NULL,
 CONSTRAINT [PrimaryKey_b640dbdf-6935-4346-9f93-e268ffbbf64d] PRIMARY KEY CLUSTERED 
(
	[timeSheetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2013-02-24 10:49:41 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[securityQuestion] [varchar](50) NOT NULL,
	[securityAnswer] [varchar](50) NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PrimaryKey_b8f9fbba-10ee-482e-a2c5-a2c5d7c11f18] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_0] FOREIGN KEY([primaryContact])
REFERENCES [dbo].[Contacts] ([contactID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_0]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_1] FOREIGN KEY([address])
REFERENCES [dbo].[Addresses] ([addressID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_1]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_2] FOREIGN KEY([billingAddress])
REFERENCES [dbo].[Addresses] ([addressID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_2]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_0] FOREIGN KEY([accountID])
REFERENCES [dbo].[Accounts] ([accountID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_0]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_1] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_1]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_2] FOREIGN KEY([shippingAddress])
REFERENCES [dbo].[Addresses] ([addressID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_2]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_3] FOREIGN KEY([billingAddress])
REFERENCES [dbo].[Addresses] ([addressID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_3]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_0] FOREIGN KEY([contactID])
REFERENCES [dbo].[Contacts] ([contactID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_0]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_0] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_0]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_1] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_0] FOREIGN KEY([type])
REFERENCES [dbo].[OrderTypes] ([orderTypeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_0]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_1] FOREIGN KEY([state])
REFERENCES [dbo].[OrderStates] ([orderStateID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_2] FOREIGN KEY([contactID])
REFERENCES [dbo].[Contacts] ([contactID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_2]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_3] FOREIGN KEY([accountID])
REFERENCES [dbo].[Accounts] ([accountID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_3]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_0] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_0]
GO
ALTER TABLE [dbo].[TimeSheetLines]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheetLines_0] FOREIGN KEY([timeSheetID])
REFERENCES [dbo].[TimeSheets] ([timeSheetID])
GO
ALTER TABLE [dbo].[TimeSheetLines] CHECK CONSTRAINT [FK_TimeSheetLines_0]
GO
ALTER TABLE [dbo].[TimeSheets]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheets_0] FOREIGN KEY([employeeID])
REFERENCES [dbo].[Employees] ([employeeID])
GO
ALTER TABLE [dbo].[TimeSheets] CHECK CONSTRAINT [FK_TimeSheets_0]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_0] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_0]
GO
USE [master]
GO
ALTER DATABASE [TheGate] SET  READ_WRITE 
GO
