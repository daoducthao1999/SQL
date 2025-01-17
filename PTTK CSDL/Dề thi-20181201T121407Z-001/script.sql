USE [master]
GO
/****** Object:  Database [QLCuuSinhVien_DaoLy_160702233]    Script Date: 12/6/2018 9:53:48 AM ******/
CREATE DATABASE [QLCuuSinhVien_DaoLy_160702233]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLCuuSinhVien_TenSV_MaSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLCuuSinhVien_TenSV_MaSV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLCuuSinhVien_TenSV_MaSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLCuuSinhVien_TenSV_MaSV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLCuuSinhVien_DaoLy_160702233].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET  MULTI_USER 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET QUERY_STORE = OFF
GO
USE [QLCuuSinhVien_DaoLy_160702233]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [QLCuuSinhVien_DaoLy_160702233]
GO
/****** Object:  User [DaoLy]    Script Date: 12/6/2018 9:53:49 AM ******/
CREATE USER [DaoLy] FOR LOGIN [ThiLy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 12/6/2018 9:53:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [nvarchar](3) NOT NULL,
	[TenKhoa] [nvarchar](150) NULL,
	[GhiChu] [nvarchar](30) NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 12/6/2018 9:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [nvarchar](3) NOT NULL,
	[TenLop] [nvarchar](150) NULL,
	[MaKhoa] [nvarchar](3) NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 12/6/2018 9:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [nvarchar](7) NOT NULL,
	[Ho] [nvarchar](30) NULL,
	[Ten] [nvarchar](10) NULL,
	[SDT] [nvarchar](15) NULL,
	[emailSV] [nvarchar](50) NULL,
	[NoiO] [nvarchar](100) NULL,
	[MaKhoa] [nvarchar](3) NULL,
	[NienKhoa] [nvarchar](3) NULL,
	[MaLop] [nvarchar](3) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[dssvien]    Script Date: 12/6/2018 9:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[dssvien](@khoa nvarchar(10),@malop nvarchar(10),@nienkhoa nvarchar(10))
returns table
as
return
(
   Select MaSV as N'Mã SV', Ho as N'Họ đệm', Ten as N'Tên', Sdt, emailSV as email, NoiO as N'Nơi ở', SinhVien.MaKhoa as N'Mã Khoa', 
	NienKhoa as N'Niên khóa', SinhVien.MaLop as N'Mã Lớp'
   from SinhVien join Lop on SinhVien.MaLop = Lop.MaLop
   join Khoa on Khoa.MaKhoa=SinhVien.MaKhoa
   where Khoa.MaKhoa = @khoa and NienKhoa=@nienkhoa and Lop.MaLop=@malop
)
GO
/****** Object:  View [dbo].[Cau4]    Script Date: 12/6/2018 9:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Cau4] 
	as 
		select MaSV, Ho, Ten, Sdt, emailSV, NoiO, SinhVien.MaKhoa, NienKhoa
		from SinhVien join Lop on SinhVien.MaLop= Lop.MaLop join Khoa on SinhVien.MaKhoa= Khoa.MaKhoa
		where Lop.TenLop =N'Công nghệ thông tin 2' and NienKhoa='55'
		and SDT is not null and emailSV is not null and TenKhoa=N'Khoa Công nghệ thông tin'
GO
/****** Object:  Table [dbo].[NoiLamViec]    Script Date: 12/6/2018 9:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiLamViec](
	[MaNLV] [nvarchar](6) NOT NULL,
	[TenNLV] [nvarchar](150) NULL,
	[TapDoan] [nvarchar](150) NULL,
 CONSTRAINT [PK_NoiLamViec] PRIMARY KEY CLUSTERED 
(
	[MaNLV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SV-NoiLV]    Script Date: 12/6/2018 9:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SV-NoiLV](
	[MaSV] [nvarchar](7) NULL,
	[MaNLV] [nvarchar](6) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [GhiChu]) VALUES (N'001', N'Khoa Công trình', NULL)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [GhiChu]) VALUES (N'002', N'Khoa Cơ khí', NULL)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [GhiChu]) VALUES (N'003', N'Khoa Vận tải - Kinh tế', NULL)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [GhiChu]) VALUES (N'004', N'Khoa Điện - Điện tử', NULL)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [GhiChu]) VALUES (N'005', N'Khoa Công nghệ thông tin', NULL)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [GhiChu]) VALUES (N'006', N'Khoa Kỹ thuật xây dựng', NULL)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [GhiChu]) VALUES (N'007', N'Khoa Đào tạo quốc tế', NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'001', N'Kỹ thuật xây dựng Cầu-Đường bộ', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'002', N'Kỹ thuật xây dựng Đường bộ', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'003', N'Kỹ thuật xây dựng Cầu-Đường sắt', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'004', N'Kỹ thuật xây dựng Cầu-hầm', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'005', N'Kỹ thuật xây dựng Đường sắt', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'006', N'Kỹ thuật xây dựng Đường sắt đô thị', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'007', N'Kỹ thuật XD Cầu-Đường ô tô và sân bay', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'008', N'Kỹ thuật XD Đường ô tô và sân bay', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'009', N'Kỹ thuật XD Đường hầm và Metro', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'010', N'Công trình giao thông công chính', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'011', N'Công trình giao thông đô thị', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'012', N'Công trình giao thông thuỷ', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'013', N'Địa kỹ thuật công trình giao thông', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'014', N'Quản lý xây dựng CTGT', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'015', N'Tự động hoá thiết kế cầu đường', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'016', N'Kỹ thuật giao thông đường bộ', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'017', N'Kỹ thuật GIS và trắc địa CTGT', N'001')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'018', N'Công nghệ thông tin 1', N'005')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'019', N'Công nghệ thông tin 2', N'005')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'020', N'Công nghệ thông tin 3', N'005')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'021', N'Công nghệ thông tin 4', N'005')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'022', N'Công nghệ chế tạo cơ khí', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'023', N'Cơ điện tử', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'024', N'Cơ giới hóa xây dựng giao thông', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'025', N'Cơ khí GT công chính', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'026', N'Cơ khí ô tô', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'027', N'Đầu máy – Toa xe', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'028', N'Kỹ thuật máy động lực', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'029', N'Kỹ thuật nhiệt lạnh', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'030', N'Máy xây dựng', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'031', N'Tầu điện – Metro', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'032', N'Tự động hóa thiết kế cơ khí', N'002')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'033', N'Điều hòa không khí và thông gió công trình', N'004')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'034', N'Kỹ thuật thông tin và truyền thông', N'004')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'035', N'Kỹ thuật viễn thông', N'004')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'036', N'Kỹ thuật Điện tử và Tin học công nghiệp', N'004')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'037', N'Trang bị điện trong Công nghiệp và Giao thông', N'004')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'038', N'Kỹ thuật điều khiển và tự động hóa giao', N'004')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'039', N'Tự động hóa', N'004')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'040', N'Quản trị doanh nghiệp vận tải', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'041', N'Quản trị doanh nghiệp xây dựng', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'042', N'Quản trị doanh nghiệp bưu chính viễn thông', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'043', N'Quản trị logistisc', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'044', N'Kinh tế bưu chính viễn thông', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'045', N'Kinh tế quản lý khai thác cầu đường', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'046', N'Kinh tế xây dựng công trình giao thông', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'047', N'Kế toán tổng hợp', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'048', N'Khai thác vận tải đường sắt đô thị', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'049', N'Khai thác vận tải đa phương thức', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'050', N'Khai thác vận tải đường sắt', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'051', N'Khai thác vận tải đường bộ và thành', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'052', N'Quy hoạch và quản lý GTVT', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'053', N'Kinh tế vận tải hàng không', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'054', N'Kinh tế vận tải ô tô', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'055', N'Kinh tế vận tải sắt', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'056', N'Kinh tế vận tải thủy bộ', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'057', N'Kinh tế vận tải du lịch', N'003')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'058', N'Kỹ thuật môi trường giao thông', N'006')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'059', N'Kỹ thuật an toàn giao thông', N'006')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'060', N'Xây dựng công trình dân dụng và công', N'006')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'061', N'Kết cấu xây dựng', N'006')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'062', N'Vật liệu và công nghệ xây dựng', N'006')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'063', N'Kỹ thuật hạ tầng đô thị', N'006')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'064', N'Kế toán tổng hợp Việt – Anh', N'007')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'065', N'Kinh tế xây dựng công trình giao thông Việt - Anh', N'007')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'066', N'Vật liệu và Công nghệ Việt – Pháp', N'007')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'067', N'Cầu - Đường bộ Việt - Pháp', N'007')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'068', N'Kỹ thuật xây dựng công trình giao thông', N'007')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'069', N'Cầu - Đường bộ Việt – Anh', N'007')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'070', N'Công trình giao thông Đô thị Việt - Nhật', N'007')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000001', N'Công ty Than Quảng Ninh', N'Tập đoàn Công nghiệp Than - Khoáng sản Việt Nam')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000002', N'Bưu điện Hà Nội', N'Tập đoàn Bưu chính viễn thông Việt Nam')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000003', N'Công ty Cao su Sao Vàng', N'Tập đoàn Công nghiệp Cao su Việt Nam')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000004', N'Công ty Đóng tàu VN', N'Tập đoàn Công nghiệp Tàu thủy Việt Nam')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000005', N'Công ty dầu khí PT', N'Tập đoàn Dầu khí Quốc gia Việt Nam')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000006', N'Dệt may VN', N'Tập đoàn Dệt- May Việt Nam')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000007', N'Điện lực HN', N'Tập đoàn Điện lực Việt Nam')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000008', N'Bảo hiểm Bảo Việt 1', N'Tập đoàn Bảo Việt')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000009', N'Viettel', N'Tập đoàn Viễn thông quân đội    ')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000010', N'Xây dựng Bạch Đằng', N'Tập đoàn Phát triển nhà và đô thị Việt Nam ')
INSERT [dbo].[NoiLamViec] ([MaNLV], [TenNLV], [TapDoan]) VALUES (N'000011', N'Máy và thiết bị Công nghiệp', N'Tập đoàn Công nghiệp Xây dựng Việt Nam ')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1202020', N'Nguyễn Văn', N'Duy', N'0901234718', N'NguyenVanDuy	@gmail.com', N'Hưng Yên', N'005', N'47', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1203164', N'Đặng Trung', N'Đức', N'0901234577', N'DangTrungDuc	@gmail.com', N'Bình Thuận', N'004', N'50', N'011')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1301994', N'Vũ Văn', N'Dương', N'0901234720', N'VuVanDuong	@gmail.com', N'Kiên Giang', N'007', N'49', N'014')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1309787', N'Ngô Công', N'Tráng', N'0901234700', N'NgoCongTrang	@gmail.com', N'Bình Định', N'001', N'45', N'064')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1320015', N'Hà Công Tuấn', N'Anh', N'0901234708', N'HaCongAnh	@gmail.com', N'Điện Biên', N'002', N'53', N'002')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400146', N'Lê Đức', N'Anh', N'0901234612', N'LeDucAnh	@gmail.com', N'Sơn La', N'004', N'53', N'046')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400149', N'Lê Hoàng', N'Anh', N'0901234664', N'LeHoangAnh	@gmail.com', N'Nam Định', N'007', N'41', N'028')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400196', N'Ngô Văn', N'Anh', N'0901234709', N'NgoVanAnh	@gmail.com', N'Đồng Nai', N'003', N'54', N'003')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400239', N'Nguyễn Ngọc', N'Anh', N'0901234613', N'NguyenNgocAnh	@gmail.com', N'Tây Ninh', N'005', N'54', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400311', N'Nguyễn Tuấn', N'Anh', N'0901234710', N'NguyenTuanAnh	@gmail.com', N'Đồng Tháp', N'004', N'55', N'004')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400330', N'Nguyễn Vân', N'Anh', N'0901234567', N'NguyenVanAnh	@gmail.com', N'An Giang', N'001', N'40', N'001')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400379', N'Phạm Văn', N'Anh', N'0901234665', N'PhamVanAnh	@gmail.com', N'Nghệ An', N'001', N'42', N'029')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400521', N'Ngô Thị', N'Ba', N'0901234568', N'NgoThiBa	@gmail.com', N'Bà Rịa - Vũng Tàu', N'002', N'41', N'002')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400530', N'Đinh Đức', N'Bảo', N'0901234614', N'DinhDucBao	@gmail.com', N'Thái Bình', N'005', N'55', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400577', N'Nguyễn Đức', N'Bằng', N'0901234711', N'NguyenDucBang	@gmail.com', N'Gia Lai', N'005', N'40', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400588', N'Nguyễn Hữu', N'Bắc', N'0901234569', N'NguyenHuuBac	@gmail.com', N'Bắc Giang', N'005', N'42', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400659', N'Phạm Thanh', N'Bình', N'0901234615', N'PhamThanhBinh	@gmail.com', N'Thái Nguyên', N'005', N'40', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400683', N'Phan Thị Ngọc', N'Bích', N'0901234666', N'PhanThiBich	@gmail.com', N'Ninh Bình', N'002', N'43', N'030')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400702', N'Trần Quốc', N'Bộ', N'0901234712', N'TranQuocBo	@gmail.com', N'Hà Giang', N'006', N'41', N'006')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400760', N'Lưu Thị', N'Chiên', N'0901234616', N'LuuThiChien	@gmail.com', N'Thanh Hóa', N'005', N'41', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400787', N'Lê Xuân', N'Chiến', N'0901234713', N'LeXuanChien	@gmail.com', N'Hà Nam', N'007', N'42', N'007')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400814', N'Bùi Thị Tuyết', N'Chinh', N'0901234617', N'BuiThiChinh	@gmail.com', N'Thừa Thiên Huế', N'002', N'42', N'051')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400854', N'Trần Minh', N'Chính', N'0901234667', N'TranMinhChinh	@gmail.com', N'Ninh Thuận', N'005', N'55', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400889', N'Dương Thị', N'Chúc', N'0901234714', N'DuongThiChuc	@gmail.com', N'Hà Tĩnh', N'001', N'43', N'008')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1400957', N'Nguyễn Thị', N'Cúc', N'0901234618', N'NguyenThiCuc	@gmail.com', N'Tiền Giang', N'003', N'43', N'052')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401008', N'Lê Kim', N'Cường', N'0901234668', N'LeKimCuong	@gmail.com', N'Phú Thọ', N'004', N'45', N'032')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401144', N'Hoàng Văn', N'Cương', N'0901234715', N'HoangVanCuong	@gmail.com', N'Hải Dương', N'005', N'55', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401162', N'Phạm Duy', N'Cương', N'0901234570', N'PhamDuyCuong	@gmail.com', N'Bắc Kạn', N'004', N'43', N'004')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401198', N'Trần Văn', N'Diện', N'0901234619', N'TranVanDien	@gmail.com', N'Trà Vinh', N'005', N'55', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401228', N'Vũ Quốc', N'Doanh', N'0901234716', N'VuQuocDoanh	@gmail.com', N'Hậu Giang', N'003', N'45', N'010')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401294', N'Bùi Gia', N'Duy', N'0901234572', N'BuiGiaDuy	@gmail.com', N'Bắc Ninh', N'006', N'45', N'006')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401334', N'Nguyễn Khánh', N'Duy', N'0901234669', N'NguyenKhanhDuy	@gmail.com', N'Quảng Bình', N'005', N'46', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401351', N'Nguyễn Thành', N'Duy', N'0901234717', N'NguyenThanhDuy	@gmail.com', N'Hòa Bình', N'004', N'46', N'011')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401352', N'Nguyễn Văn', N'Duy', N'0901234573', N'NguyenVanDuy	@gmail.com', N'Bến Tre', N'007', N'46', N'007')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401381', N'Trần Lê', N'Duy', N'0901234621', N'TranLeDuy	@gmail.com', N'Vĩnh Long', N'006', N'46', N'055')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401384', N'Trần Văn', N'Duy', N'0901234670', N'TranVanDuy	@gmail.com', N'Quảng Nam', N'006', N'47', N'034')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401397', N'Lê Thị', N'Duyên', N'0901234719', N'LeThiDuyen	@gmail.com', N'Khánh Hòa', N'006', N'48', N'013')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401492', N'Nguyễn Bá', N'Dũng', N'0901234571', N'NguyenBaDung	@gmail.com', N'Bạc Liêu', N'005', N'44', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401506', N'Nguyễn Hữu', N'Dũng', N'0901234620', N'NguyenHuuDung	@gmail.com', N'Tuyên Quang', N'005', N'45', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401699', N'Trần Thị Thuỳ', N'Dương', N'0901234672', N'TranThiDuong	@gmail.com', N'Quảng Ninh', N'001', N'49', N'036')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401736', N'Lê Thị', N'Đào', N'0901234721', N'LeThiDao	@gmail.com', N'Kon Tum', N'001', N'50', N'015')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401746', N'Bùi Công', N'Đại', N'0901234574', N'BuiCongDai	@gmail.com', N'Bình Định', N'005', N'55', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401777', N'Lê Quang', N'Đạo', N'0901234622', N'LeQuangDao	@gmail.com', N'Vĩnh Phúc', N'005', N'55', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401779', N'Nguyễn Hoàng', N'Đạo', N'0901234673', N'NguyenHoangDao	@gmail.com', N'Quảng Trị', N'002', N'50', N'037')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401853', N'Nguyễn Quang', N'Đạt', N'0901234722', N'NguyenQuangDat	@gmail.com', N'Lai Châu', N'002', N'51', N'016')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401885', N'Phan Quốc', N'Đạt', N'0901234575', N'PhanQuocDat	@gmail.com', N'Bình Dương', N'005', N'55', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401920', N'Trần Tiến', N'Đạt', N'0901234623', N'TranTienDat	@gmail.com', N'Yên Bái', N'001', N'48', N'057')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1401997', N'Hoàng Thị', N'Định', N'0901234723', N'HoangThiDinh	@gmail.com', N'Lâm Đồng', N'003', N'52', N'017')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402009', N'Vũ Thuý', N'Đoan', N'0901234576', N'VuThuyDoan	@gmail.com', N'Bình Phước', N'003', N'49', N'010')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402080', N'Đỗ Đức', N'Độ', N'0901234674', N'DoDucDo	@gmail.com', N'Sóc Trăng', N'003', N'51', N'038')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402164', N'Nguyễn Mạnh', N'Đức', N'0901234724', N'NguyenManhDuc	@gmail.com', N'Lạng Sơn', N'004', N'53', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402349', N'Phạm Thị Hương', N'Giang', N'0901234725', N'PhamThiGiang	@gmail.com', N'Lào Cai', N'005', N'54', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402599', N'Nguyễn Hoàng', N'Hải', N'0901234625', N'NguyenHoangHai	@gmail.com', N'Cần Thơ', N'003', N'50', N'059')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402806', N'Phạm Văn', N'Hậu', N'0901234726', N'PhamVanHau	@gmail.com', N'Long An', N'006', N'55', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402826', N'Lê Thị', N'Hiền', N'0901234578', N'LeThiHien	@gmail.com', N'Cà Mau', N'005', N'51', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402848', N'Nguyễn Thị Thu', N'Hiền', N'0901234626', N'NguyenThiHien	@gmail.com', N'Đà Nẵng', N'004', N'51', N'060')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402869', N'Vũ Thị Thu', N'Hiền', N'0901234675', N'VuThiHien	@gmail.com', N'Sơn La', N'005', N'55', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1402959', N'Nguyễn Đức', N'Hiếu', N'0901234579', N'NguyenDucHieu	@gmail.com', N'Cao Bằng', N'005', N'55', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403031', N'Vũ Xuân', N'Hiếu', N'0901234727', N'VuXuanHieu	@gmail.com', N'Nam Định', N'007', N'40', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403163', N'Nguyễn Thị', N'Hoà', N'0901234728', N'NguyenThiHoa	@gmail.com', N'Nghệ An', N'001', N'41', N'022')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403192', N'Lâm Văn', N'Hoàn', N'0901234580', N'LamVanHoan	@gmail.com', N'Đắk Lắk', N'007', N'53', N'014')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403380', N'Nguyễn Thái', N'Học', N'0901234627', N'NguyenThaiHoc	@gmail.com', N'Hải Phòng', N'005', N'52', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403394', N'Lê Thị', N'Hồng', N'0901234677', N'LeThiHong	@gmail.com', N'Thái Bình', N'006', N'54', N'041')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403447', N'Từ Tất', N'Huân', N'0901234729', N'TuTatHuan	@gmail.com', N'Ninh Bình', N'002', N'42', N'023')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403468', N'Nguyễn Thị', N'Huế', N'0901234582', N'NguyenThiHue	@gmail.com', N'Điện Biên', N'002', N'55', N'016')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403498', N'Vũ Thị Thu', N'Huệ', N'0901234628', N'VuThiHue	@gmail.com', N'Hà Nội', N'006', N'53', N'062')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403511', N'Dương Đình Đức', N'Huy', N'0901234678', N'DuongDinhHuy	@gmail.com', N'Thái Nguyên', N'007', N'55', N'042')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403549', N'Lê Thế', N'Huy', N'0901234730', N'LeTheHuy	@gmail.com', N'Ninh Thuận', N'003', N'43', N'024')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403570', N'Nguyễn Đức', N'Huy', N'0901234679', N'NguyenDucHuy	@gmail.com', N'Thanh Hóa', N'001', N'40', N'043')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403593', N'Nguyễn Quang', N'Huy', N'0901234731', N'NguyenQuangHuy	@gmail.com', N'Phú Thọ', N'004', N'44', N'025')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403697', N'Lưu Thị Kim', N'Huyền', N'0901234631', N'LuuThiHuyen	@gmail.com', N'Bà Rịa - Vũng Tàu', N'002', N'40', N'065')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403752', N'Vũ Thị Thu', N'Hiền', N'0901234676', N'VuThiHien	@gmail.com', N'Tây Ninh', N'005', N'53', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1403912', N'Trần Mạnh', N'Hùng', N'0901234630', N'TranManhHung	@gmail.com', N'An Giang', N'001', N'55', N'064')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404097', N'Nguyễn Thị', N'Hương', N'0901234680', N'NguyenThiHuong	@gmail.com', N'Thừa Thiên Huế', N'002', N'41', N'044')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404099', N'Nguyễn Thị', N'Hương', N'0901234732', N'NguyenThiHuong	@gmail.com', N'Quảng Bình', N'005', N'45', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404102', N'Nguyễn Thị', N'Hương', N'0901234583', N'NguyenThiHuong	@gmail.com', N'Đồng Nai', N'003', N'40', N'017')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404156', N'Phạm Văn', N'Khang', N'0901234632', N'PhamVanKhang	@gmail.com', N'Bắc Giang', N'003', N'41', N'066')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404231', N'Nguyễn Ngọc', N'Khánh', N'0901234733', N'NguyenNgocKhanh	@gmail.com', N'Quảng Nam', N'006', N'46', N'027')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404301', N'Nguyễn Đức', N'Khôi', N'0901234585', N'NguyenDucKhoi	@gmail.com', N'Gia Lai', N'005', N'42', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404368', N'Ngô Trung', N'Kiên', N'0901234681', N'NgoTrungKien	@gmail.com', N'Tiền Giang', N'003', N'42', N'045')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404465', N'Trương Thị', N'Lan', N'0901234586', N'TruongThiLan	@gmail.com', N'Hà Giang', N'006', N'43', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404470', N'Nguyễn Thị', N'Là', N'0901234633', N'NguyenThiLa	@gmail.com', N'Bắc Kạn', N'004', N'42', N'067')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404494', N'Lê Văn', N'Lâm', N'0901234682', N'LeVanLam	@gmail.com', N'Trà Vinh', N'004', N'43', N'046')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404512', N'Nguyễn Tùng', N'Lâm', N'0901234734', N'NguyenTungLam	@gmail.com', N'Quảng Ngãi', N'007', N'47', N'028')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404654', N'Lương Tuấn', N'Linh', N'0901234634', N'LuongTuanLinh	@gmail.com', N'Bạc Liêu', N'005', N'55', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404672', N'Nguyễn Khánh', N'Linh', N'0901234683', N'NguyenKhanhLinh	@gmail.com', N'Tuyên Quang', N'005', N'55', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404720', N'Nguyễn Văn', N'Linh', N'0901234735', N'NguyenVanLinh	@gmail.com', N'Quảng Ninh', N'001', N'48', N'029')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1404856', N'Nguyễn Hoàn', N'Long', N'0901234635', N'NguyenHoanLong	@gmail.com', N'Bắc Ninh', N'006', N'44', N'069')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405013', N'Kiều Thị', N'Lụa', N'0901234587', N'KieuThiLua	@gmail.com', N'Hà Nam', N'007', N'44', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405057', N'Nguyễn Trọng', N'Lực', N'0901234636', N'NguyenTrongLuc	@gmail.com', N'Bến Tre', N'007', N'45', N'070')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405058', N'Nguyễn Văn', N'Lực', N'0901234684', N'NguyenVanLuc	@gmail.com', N'Vĩnh Long', N'006', N'45', N'048')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405062', N'Tạ Quang', N'Lực', N'0901234736', N'TaQuangLuc	@gmail.com', N'Quảng Trị', N'002', N'49', N'030')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405069', N'Lưu Thị Thảo', N'Ly', N'0901234588', N'LuuThiLy	@gmail.com', N'Hà Tĩnh', N'001', N'45', N'022')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405101', N'Lê Thị', N'Mai', N'0901234637', N'LeThiMai	@gmail.com', N'Bình Định', N'001', N'46', N'001')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405110', N'Nguyễn Thị', N'Mai', N'0901234686', N'NguyenThiMai	@gmail.com', N'Yên Bái', N'001', N'47', N'050')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405193', N'Phan Văn', N'Mạnh', N'0901234638', N'PhanVanManh	@gmail.com', N'Bình Dương', N'002', N'47', N'002')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405229', N'Đào Trần', N'Minh', N'0901234737', N'DaoTranMinh	@gmail.com', N'Sóc Trăng', N'003', N'50', N'031')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405292', N'Nguyễn Quang', N'Minh', N'0901234639', N'NguyenQuangMinh	@gmail.com', N'Bình Phước', N'003', N'48', N'003')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405351', N'Vũ Tiến', N'Minh', N'0901234738', N'VuTienMinh	@gmail.com', N'Sơn La', N'004', N'51', N'032')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405476', N'Nguyễn Đức', N'Nam', N'0901234640', N'NguyenDucNam	@gmail.com', N'Bình Thuận', N'004', N'49', N'004')
GO
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405632', N'Vũ Thị', N'Nga', N'0901234589', N'VuThiNga	@gmail.com', N'Hải Dương', N'002', N'46', N'023')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405650', N'Nguyễn Thị', N'Ngân', N'0901234641', N'NguyenThiNgan	@gmail.com', N'Cà Mau', N'005', N'55', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405729', N'Nguyễn Anh', N'Ngọc', N'0901234687', N'NguyenAnhNgoc	@gmail.com', N'Phú Yên', N'002', N'48', N'051')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405759', N'Phạm Thị', N'Ngọc', N'0901234740', N'PhamThiNgoc	@gmail.com', N'Thái Bình', N'006', N'53', N'034')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405829', N'Nguyễn Thị', N'Nhàn', N'0901234642', N'NguyenThiNhan	@gmail.com', N'Cao Bằng', N'005', N'51', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405913', N'Phạm Thị', N'Nhung', N'0901234643', N'PhamThiNhung	@gmail.com', N'Đắk Lắk', N'007', N'52', N'007')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1405915', N'Phạm Thị', N'Nhung', N'0901234688', N'PhamThiNhung	@gmail.com', N'Cần Thơ', N'003', N'49', N'052')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406020', N'Đỗ Minh', N'Phong', N'0901234741', N'DoMinhPhong	@gmail.com', N'Thái Nguyên', N'007', N'54', N'035')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406022', N'Hoàng Minh', N'Phong', N'0901234590', N'HoangMinhPhong	@gmail.com', N'Hậu Giang', N'003', N'47', N'024')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406039', N'Nguyễn Quốc', N'Phong', N'0901234644', N'NguyenQuocPhong	@gmail.com', N'Đắk Nông', N'001', N'53', N'008')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406230', N'Phùng Thị', N'Phương', N'0901234591', N'PhungThiPhuong	@gmail.com', N'Hòa Bình', N'004', N'48', N'025')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406257', N'Chu Văn', N'Quang', N'0901234645', N'ChuVanQuang	@gmail.com', N'Điện Biên', N'002', N'54', N'009')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406454', N'Nguyễn Trung', N'Quy', N'0901234689', N'NguyenTrungQuy	@gmail.com', N'Đà Nẵng', N'004', N'50', N'053')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406468', N'Đồng Viết', N'Quyền', N'0901234742', N'DongVietQuyen	@gmail.com', N'Thanh Hóa', N'001', N'55', N'036')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406542', N'Nguyễn Thị', N'Quỳnh', N'0901234592', N'NguyenThiQuynh	@gmail.com', N'Hưng Yên', N'005', N'55', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406594', N'Nguyễn Văn', N'Quý', N'0901234646', N'NguyenVanQuy	@gmail.com', N'Đồng Nai', N'003', N'55', N'010')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406661', N'Nguyễn Hữu', N'Sử', N'0901234594', N'NguyenHuuSu	@gmail.com', N'Kiên Giang', N'007', N'51', N'028')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406693', N'Đỗ Hồng', N'Sơn', N'0901234648', N'DoHongSon	@gmail.com', N'Gia Lai', N'005', N'55', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406843', N'Vũ Hồng', N'Sơn', N'0901234743', N'VuHongSon	@gmail.com', N'Thừa Thiên Huế', N'002', N'40', N'037')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406848', N'Vũ Văn', N'Sơn', N'0901234593', N'VuVanSon	@gmail.com', N'Khánh Hòa', N'006', N'50', N'027')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406964', N'Đào Kỳ', N'Thanh', N'0901234745', N'DaoKyThanh	@gmail.com', N'Trà Vinh', N'004', N'42', N'039')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1406968', N'Đỗ Chí', N'Thanh', N'0901234595', N'DoChiThanh	@gmail.com', N'Kon Tum', N'001', N'52', N'029')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407005', N'Phạm Duy', N'Thanh', N'0901234649', N'PhamDuyThanh	@gmail.com', N'Hà Giang', N'006', N'42', N'013')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407059', N'Lê Tất', N'Thành', N'0901234746', N'LeTatThanh	@gmail.com', N'Tuyên Quang', N'005', N'55', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407108', N'Nguyễn Văn', N'Thành', N'0901234596', N'NguyenVanThanh	@gmail.com', N'Lai Châu', N'002', N'53', N'030')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407218', N'Nguyễn Thị Thu', N'Thảo', N'0901234691', N'NguyenThiThao	@gmail.com', N'Hà Nội', N'006', N'52', N'055')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407258', N'Lê Bá', N'Thái', N'0901234744', N'LeBaThai	@gmail.com', N'Tiền Giang', N'003', N'41', N'038')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407356', N'Hoàng Ngọc', N'Thắng', N'0901234598', N'HoangNgocThang	@gmail.com', N'Lạng Sơn', N'004', N'55', N'032')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407397', N'Nguyễn Huy', N'Thắng', N'0901234650', N'NguyenHuyThang	@gmail.com', N'Hà Nam', N'007', N'43', N'014')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407505', N'Nguyễn Văn', N'Thế', N'0901234651', N'NguyenVanThe	@gmail.com', N'Hà Tĩnh', N'001', N'44', N'015')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407585', N'Bạch Văn', N'Thịnh', N'0901234599', N'BachVanThinh	@gmail.com', N'Lào Cai', N'005', N'40', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407592', N'Đỗ Hữu', N'Thịnh', N'0901234652', N'DoHuuThinh	@gmail.com', N'Hải Dương', N'002', N'45', N'016')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407634', N'Trương Văn', N'Thịnh', N'0901234692', N'TruongVanThinh	@gmail.com', N'TP HCM', N'007', N'53', N'056')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407687', N'Mạc Thị', N'Thu', N'0901234748', N'MacThiThu	@gmail.com', N'Vĩnh Phúc', N'005', N'45', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407693', N'Nguyễn Thị', N'Thu', N'0901234600', N'NguyenThiThu	@gmail.com', N'Long An', N'006', N'41', N'034')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407697', N'Nguyễn Thị Hoài', N'Thu', N'0901234653', N'NguyenThiThu	@gmail.com', N'Hậu Giang', N'003', N'46', N'017')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407707', N'Nguyễn Văn', N'Thuân', N'0901234694', N'NguyenVanThuan	@gmail.com', N'Bà Rịa - Vũng Tàu', N'002', N'55', N'058')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407829', N'Vũ Văn', N'Thủy', N'0901234749', N'VuVanThuy	@gmail.com', N'Yên Bái', N'001', N'46', N'043')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407855', N'Lê Thị', N'Thư', N'0901234601', N'LeThiThu	@gmail.com', N'Nam Định', N'007', N'42', N'035')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407860', N'Quách Anh', N'Thư', N'0901234654', N'QuachAnhThu	@gmail.com', N'Hòa Bình', N'004', N'47', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407910', N'Đặng Thị', N'Thơm', N'0901234693', N'DangThiThom	@gmail.com', N'An Giang', N'001', N'54', N'057')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407955', N'Lương Hoàng', N'Tiến', N'0901234751', N'LuongHoangTien	@gmail.com', N'Cần Thơ', N'003', N'48', N'045')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1407976', N'Nguyễn Ngọc', N'Tiến', N'0901234602', N'NguyenNgocTien	@gmail.com', N'Nghệ An', N'001', N'43', N'036')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408038', N'Mai Thị', N'Tình', N'0901234696', N'MaiThiTinh	@gmail.com', N'Bắc Kạn', N'004', N'41', N'060')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408093', N'Nguyễn Văn', N'Toàn', N'0901234697', N'NguyenVanToan	@gmail.com', N'Bạc Liêu', N'005', N'42', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408149', N'Đỗ Thị Huyền', N'Trang', N'0901234752', N'DoThiTrang	@gmail.com', N'Đà Nẵng', N'004', N'49', N'046')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408182', N'Nguyễn Huyền', N'Trang', N'0901234604', N'NguyenHuyenTrang	@gmail.com', N'Ninh Thuận', N'003', N'45', N'038')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408186', N'Nguyễn Thị', N'Trang', N'0901234655', N'NguyenThiTrang	@gmail.com', N'Hưng Yên', N'005', N'48', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408192', N'Nguyễn Thị', N'Trang', N'0901234699', N'NguyenThiTrang	@gmail.com', N'Bến Tre', N'007', N'44', N'063')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408255', N'Vũ Thị Huyền', N'Trang', N'0901234605', N'VuThiTrang	@gmail.com', N'Phú Thọ', N'004', N'46', N'039')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408261', N'Lê Thị', N'Trà', N'0901234698', N'LeThiTra	@gmail.com', N'Bắc Ninh', N'006', N'43', N'062')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408265', N'Dương Công', N'Tráng', N'0901234753', N'DuongCongTrang	@gmail.com', N'Hải Phòng', N'005', N'50', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408392', N'Nguyễn Đức', N'Trung', N'0901234657', N'NguyenDucTrung	@gmail.com', N'Kiên Giang', N'007', N'50', N'021')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408417', N'Nguyễn Văn', N'Trung', N'0901234754', N'NguyenVanTrung	@gmail.com', N'Hà Nội', N'006', N'51', N'048')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408444', N'Trần Quang', N'Trung', N'0901234606', N'TranQuangTrung	@gmail.com', N'Quảng Bình', N'005', N'47', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408451', N'Trịnh Thị', N'Trung', N'0901234658', N'TrinhThiTrung	@gmail.com', N'Kon Tum', N'001', N'51', N'022')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408539', N'Trần Văn', N'Trường', N'0901234755', N'TranVanTruong	@gmail.com', N'TP HCM', N'007', N'52', N'049')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408613', N'Đỗ Đức', N'Tuấn', N'0901234659', N'DoDucTuan	@gmail.com', N'Lai Châu', N'002', N'52', N'023')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408671', N'Nguyễn Anh', N'Tuấn', N'0901234702', N'NguyenAnhTuan	@gmail.com', N'Bình Phước', N'003', N'47', N'066')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408696', N'Nguyễn Quang', N'Tuấn', N'0901234757', N'NguyenQuangTuan	@gmail.com', N'Bà Rịa - Vũng Tàu', N'002', N'54', N'051')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408698', N'Nguyễn Quang', N'Tuấn', N'0901234607', N'NguyenQuangTuan	@gmail.com', N'Quảng Nam', N'006', N'48', N'041')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408699', N'Nguyễn Quang', N'Tuấn', N'0901234660', N'NguyenQuangTuan	@gmail.com', N'Lâm Đồng', N'003', N'53', N'024')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408712', N'Nguyễn Văn', N'Tuấn', N'0901234703', N'NguyenVanTuan	@gmail.com', N'Bình Thuận', N'004', N'48', N'067')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408715', N'Nguyễn Văn', N'Tuấn', N'0901234758', N'NguyenVanTuan	@gmail.com', N'Bắc Giang', N'003', N'55', N'052')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408829', N'Đàm Quang', N'Tuyển', N'0901234705', N'DamQuangTuyen	@gmail.com', N'Cao Bằng', N'006', N'50', N'069')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408838', N'Đoàn Văn', N'Tuyến', N'0901234760', N'DoanVanTuyen	@gmail.com', N'Bạc Liêu', N'005', N'54', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408927', N'Lê Thanh', N'Tùng', N'0901234608', N'LeThanhTung	@gmail.com', N'Quảng Ngãi', N'007', N'49', N'042')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408969', N'Nguyễn Thanh', N'Tùng', N'0901234704', N'NguyenThanhTung	@gmail.com', N'Cà Mau', N'005', N'49', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1408972', N'Nguyễn Thanh', N'Tùng', N'0901234759', N'NguyenThanhTung	@gmail.com', N'Bắc Kạn', N'004', N'53', N'053')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409042', N'Vũ Mạnh', N'Tùng', N'0901234661', N'VuManhTung	@gmail.com', N'Lạng Sơn', N'004', N'54', N'025')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409107', N'Nguyễn Thị', N'Tú', N'0901234701', N'NguyenThiTu	@gmail.com', N'Bình Dương', N'002', N'46', N'065')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409124', N'Tạ Quang', N'Tú', N'0901234756', N'TaQuangTu	@gmail.com', N'An Giang', N'001', N'53', N'050')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409191', N'Lê Thị Tố', N'Uyên', N'0901234609', N'LeThiUyen	@gmail.com', N'Quảng Ninh', N'001', N'50', N'043')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409208', N'Đỗ Trung', N'Văn', N'0901234662', N'DoTrungVan	@gmail.com', N'Lào Cai', N'005', N'55', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409242', N'Nguyễn Thị', N'Vân', N'0901234706', N'NguyenThiVan	@gmail.com', N'Đắk Lắk', N'007', N'51', N'070')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409288', N'Nguyễn Bá', N'Việt', N'0901234610', N'NguyenBaViet	@gmail.com', N'Quảng Trị', N'002', N'51', N'044')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409350', N'Nguyễn Trọng', N'Vinh', N'0901234707', N'NguyenTrongVinh	@gmail.com', N'Đắk Nông', N'001', N'52', N'001')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409399', N'Đinh Ngọc', N'Vũ', N'0901234761', N'DinhNgocVu	@gmail.com', N'Bắc Ninh', N'006', N'55', N'055')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409431', N'Phạm Tuấn', N'Vũ', N'0901234611', N'PhamTuanVu	@gmail.com', N'Sóc Trăng', N'003', N'52', N'045')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1409543', N'Tống Thị Hải', N'Yến', N'0901234663', N'TongThiYen	@gmail.com', N'Long An', N'006', N'40', N'027')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420194', N'Nguyễn Thị Thùy', N'Dương', N'0901234671', N'NguyenThiDuong	@gmail.com', N'Quảng Ngãi', N'007', N'48', N'035')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420375', N'Hồ Sỹ', N'Hoàng', N'0901234581', N'HoSyHoang	@gmail.com', N'Đắk Nông', N'001', N'54', N'015')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420454', N'Nguyễn Văn', N'Hùng', N'0901234629', N'NguyenVanHung	@gmail.com', N'TP HCM', N'007', N'54', N'063')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420576', N'Bùi Thị Khánh', N'Ly', N'0901234685', N'BuiThiLy	@gmail.com', N'Vĩnh Phúc', N'007', N'46', N'049')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420632', N'Nguyễn Thị', N'Nga', N'0901234739', N'NguyenThiNga	@gmail.com', N'Tây Ninh', N'005', N'52', N'019')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420760', N'Nguyễn Hữu', N'Quỳnh', N'0901234647', N'NguyenHuuQuynh	@gmail.com', N'Đồng Tháp', N'004', N'40', N'011')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420797', N'Phạm Văn', N'Sơn', N'0901234690', N'PhamVanSon	@gmail.com', N'Hải Phòng', N'005', N'51', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420846', N'Phạm Trung', N'Thành', N'0901234747', N'PhamTrungThanh	@gmail.com', N'Vĩnh Long', N'006', N'44', N'041')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420873', N'Hồ Hữu', N'Thăng', N'0901234597', N'HoHuuThang	@gmail.com', N'Lâm Đồng', N'003', N'54', N'031')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420926', N'Nguyễn Thị', N'Thuật', N'0901234695', N'NguyenThiThuat	@gmail.com', N'Bắc Giang', N'003', N'40', N'059')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420946', N'Hồ Sỹ', N'Thức', N'0901234750', N'HoSyThuc	@gmail.com', N'Phú Yên', N'002', N'47', N'044')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420960', N'Phan Sỹ Mạnh', N'Tiến', N'0901234603', N'PhanSyTien	@gmail.com', N'Ninh Bình', N'002', N'44', N'037')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1420987', N'Nguyễn Thị', N'Trang', N'0901234656', N'NguyenThiTrang	@gmail.com', N'Khánh Hòa', N'006', N'49', N'020')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1428186', N'Trần Trọng', N'Khoa', N'0901234584', N'TranTrongKhoa	@gmail.com', N'Đồng Tháp', N'004', N'41', N'018')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'1428405', N'Trần Quang', N'Vũ', N'0901234762', N'TranQuangVu	@gmail.com', N'Bến Tre', N'007', N'45', N'056')
INSERT [dbo].[SinhVien] ([MaSV], [Ho], [Ten], [SDT], [emailSV], [NoiO], [MaKhoa], [NienKhoa], [MaLop]) VALUES (N'8814029', N'Hoàng Thị', N'Giang', N'0901234624', N'HoangThiGiang	@gmail.com', N'Phú Yên', N'002', N'49', N'058')
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400330', N'000001', CAST(N'2016-01-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400521', N'000002', CAST(N'2016-01-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400588', N'000003', CAST(N'2016-01-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401162', N'000004', CAST(N'2016-01-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401492', N'000005', CAST(N'2016-01-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401294', N'000006', CAST(N'2016-01-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401352', N'000007', CAST(N'2016-01-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401746', N'000008', CAST(N'2016-01-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401885', N'000009', CAST(N'2016-01-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402009', N'000010', CAST(N'2016-01-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1203164', N'000011', CAST(N'2016-01-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402826', N'000001', CAST(N'2016-01-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402959', N'000002', CAST(N'2016-01-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403192', N'000003', CAST(N'2016-01-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420375', N'000004', CAST(N'2016-01-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403468', N'000005', CAST(N'2016-01-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404102', N'000006', CAST(N'2016-01-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1428186', N'000007', CAST(N'2016-01-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404301', N'000008', CAST(N'2016-01-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404465', N'000009', CAST(N'2016-01-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405013', N'000010', CAST(N'2016-01-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405069', N'000011', CAST(N'2016-01-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405632', N'000001', CAST(N'2016-01-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406022', N'000002', CAST(N'2016-01-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406230', N'000003', CAST(N'2016-01-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406542', N'000004', CAST(N'2016-01-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406848', N'000005', CAST(N'2016-01-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406661', N'000006', CAST(N'2016-01-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406968', N'000007', CAST(N'2016-01-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407108', N'000008', CAST(N'2016-01-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420873', N'000009', CAST(N'2016-02-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407356', N'000010', CAST(N'2016-02-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407585', N'000011', CAST(N'2016-02-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407693', N'000001', CAST(N'2016-02-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407855', N'000002', CAST(N'2016-02-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407976', N'000003', CAST(N'2016-02-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420960', N'000004', CAST(N'2016-02-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408182', N'000005', CAST(N'2016-02-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408255', N'000006', CAST(N'2016-02-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408444', N'000007', CAST(N'2016-02-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408698', N'000008', CAST(N'2016-02-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408927', N'000009', CAST(N'2016-02-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409191', N'000010', CAST(N'2016-02-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409288', N'000011', CAST(N'2016-02-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409431', N'000001', CAST(N'2016-02-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400146', N'000002', CAST(N'2016-02-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400239', N'000003', CAST(N'2016-02-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400530', N'000004', CAST(N'2016-02-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400659', N'000005', CAST(N'2016-02-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400760', N'000006', CAST(N'2016-02-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400814', N'000007', CAST(N'2016-02-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400957', N'000008', CAST(N'2016-02-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401198', N'000009', CAST(N'2016-02-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401506', N'000010', CAST(N'2016-02-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401381', N'000011', CAST(N'2016-02-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401777', N'000001', CAST(N'2016-02-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401920', N'000002', CAST(N'2016-02-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'8814029', N'000003', CAST(N'2016-02-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402599', N'000004', CAST(N'2016-02-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402848', N'000005', CAST(N'2016-03-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403380', N'000006', CAST(N'2016-03-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403498', N'000007', CAST(N'2016-03-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420454', N'000008', CAST(N'2016-03-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403912', N'000009', CAST(N'2016-03-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403697', N'000010', CAST(N'2016-03-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404156', N'000011', CAST(N'2016-03-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404470', N'000001', CAST(N'2016-03-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404654', N'000002', CAST(N'2016-03-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404856', N'000003', CAST(N'2016-03-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405057', N'000004', CAST(N'2016-03-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405101', N'000005', CAST(N'2016-03-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405193', N'000006', CAST(N'2016-03-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405292', N'000007', CAST(N'2016-03-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405476', N'000008', CAST(N'2016-03-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405650', N'000009', CAST(N'2016-03-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405829', N'000010', CAST(N'2016-03-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405913', N'000011', CAST(N'2016-03-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406039', N'000001', CAST(N'2016-03-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406257', N'000002', CAST(N'2016-03-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406594', N'000003', CAST(N'2016-03-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420760', N'000004', CAST(N'2016-03-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406693', N'000005', CAST(N'2016-03-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407005', N'000006', CAST(N'2016-03-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407397', N'000007', CAST(N'2016-03-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407505', N'000008', CAST(N'2016-03-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407592', N'000009', CAST(N'2016-03-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407697', N'000010', CAST(N'2016-03-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407860', N'000011', CAST(N'2016-03-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408186', N'000001', CAST(N'2016-03-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420987', N'000002', CAST(N'2016-03-31' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408392', N'000003', CAST(N'2016-04-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408451', N'000004', CAST(N'2016-04-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408613', N'000005', CAST(N'2016-04-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408699', N'000006', CAST(N'2016-04-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409042', N'000007', CAST(N'2016-04-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409208', N'000008', CAST(N'2016-04-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409543', N'000009', CAST(N'2016-04-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400149', N'000010', CAST(N'2016-04-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400379', N'000011', CAST(N'2016-04-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400683', N'000001', CAST(N'2016-04-10' AS Date), NULL)
GO
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400854', N'000002', CAST(N'2016-04-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401008', N'000003', CAST(N'2016-04-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401334', N'000004', CAST(N'2016-04-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401384', N'000005', CAST(N'2016-04-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420194', N'000006', CAST(N'2016-04-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401699', N'000007', CAST(N'2016-04-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401779', N'000008', CAST(N'2016-04-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402080', N'000009', CAST(N'2016-04-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402869', N'000010', CAST(N'2016-04-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403752', N'000011', CAST(N'2016-04-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403394', N'000001', CAST(N'2016-04-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403511', N'000002', CAST(N'2016-04-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403570', N'000003', CAST(N'2016-04-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404097', N'000004', CAST(N'2016-04-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404368', N'000005', CAST(N'2016-04-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404494', N'000006', CAST(N'2016-04-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404672', N'000007', CAST(N'2016-04-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405058', N'000008', CAST(N'2016-04-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420576', N'000009', CAST(N'2016-04-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405110', N'000010', CAST(N'2016-04-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405729', N'000011', CAST(N'2016-05-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405915', N'000001', CAST(N'2016-05-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406454', N'000002', CAST(N'2016-05-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420797', N'000003', CAST(N'2016-05-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407218', N'000004', CAST(N'2016-05-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407634', N'000005', CAST(N'2016-05-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407910', N'000006', CAST(N'2016-05-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407707', N'000007', CAST(N'2016-05-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420926', N'000008', CAST(N'2016-05-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408038', N'000009', CAST(N'2016-05-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408093', N'000010', CAST(N'2016-05-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408261', N'000011', CAST(N'2016-05-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408192', N'000001', CAST(N'2016-05-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1309787', N'000002', CAST(N'2016-05-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409107', N'000003', CAST(N'2016-05-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408671', N'000004', CAST(N'2016-05-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408712', N'000005', CAST(N'2016-05-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408969', N'000006', CAST(N'2016-05-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408829', N'000007', CAST(N'2016-05-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409242', N'000008', CAST(N'2016-05-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409350', N'000009', CAST(N'2016-05-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1320015', N'000010', CAST(N'2016-05-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400196', N'000011', CAST(N'2016-05-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400311', N'000001', CAST(N'2016-05-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400577', N'000002', CAST(N'2016-05-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400702', N'000003', CAST(N'2016-05-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400787', N'000004', CAST(N'2016-05-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400889', N'000005', CAST(N'2016-05-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401144', N'000006', CAST(N'2016-05-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401228', N'000007', CAST(N'2016-05-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401351', N'000008', CAST(N'2016-05-31' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1202020', N'000009', CAST(N'2016-06-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401397', N'000010', CAST(N'2016-06-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1301994', N'000011', CAST(N'2016-06-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401736', N'000001', CAST(N'2016-06-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401853', N'000002', CAST(N'2016-06-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401997', N'000003', CAST(N'2016-06-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402164', N'000004', CAST(N'2016-06-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402349', N'000005', CAST(N'2016-06-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402806', N'000006', CAST(N'2016-06-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403031', N'000007', CAST(N'2016-06-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403163', N'000008', CAST(N'2016-06-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403447', N'000009', CAST(N'2016-06-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403549', N'000010', CAST(N'2016-06-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403593', N'000011', CAST(N'2016-06-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404099', N'000001', CAST(N'2016-06-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404231', N'000002', CAST(N'2016-06-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404512', N'000003', CAST(N'2016-06-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404720', N'000004', CAST(N'2016-06-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405062', N'000005', CAST(N'2016-06-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405229', N'000006', CAST(N'2016-06-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405351', N'000007', CAST(N'2016-06-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420632', N'000008', CAST(N'2016-06-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405759', N'000009', CAST(N'2016-06-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406020', N'000010', CAST(N'2016-06-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406468', N'000011', CAST(N'2016-06-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406843', N'000001', CAST(N'2016-06-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407258', N'000002', CAST(N'2016-06-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406964', N'000003', CAST(N'2016-06-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407059', N'000004', CAST(N'2016-06-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420846', N'000005', CAST(N'2016-06-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407687', N'000006', CAST(N'2016-07-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407829', N'000007', CAST(N'2016-07-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420946', N'000008', CAST(N'2016-07-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407955', N'000009', CAST(N'2016-07-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408149', N'000010', CAST(N'2016-07-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408265', N'000011', CAST(N'2016-07-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408417', N'000001', CAST(N'2016-07-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408539', N'000002', CAST(N'2016-07-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409124', N'000003', CAST(N'2016-07-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408696', N'000004', CAST(N'2016-07-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408715', N'000005', CAST(N'2016-07-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408972', N'000006', CAST(N'2016-07-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408838', N'000007', CAST(N'2016-07-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409399', N'000008', CAST(N'2016-07-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1428405', N'000009', CAST(N'2016-07-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400330', N'000001', CAST(N'2016-01-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400521', N'000002', CAST(N'2016-01-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400588', N'000003', CAST(N'2016-01-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401162', N'000004', CAST(N'2016-01-04' AS Date), NULL)
GO
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401492', N'000005', CAST(N'2016-01-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401294', N'000006', CAST(N'2016-01-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401352', N'000007', CAST(N'2016-01-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401746', N'000008', CAST(N'2016-01-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401885', N'000009', CAST(N'2016-01-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402009', N'000010', CAST(N'2016-01-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1203164', N'000011', CAST(N'2016-01-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402826', N'000001', CAST(N'2016-01-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402959', N'000002', CAST(N'2016-01-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403192', N'000003', CAST(N'2016-01-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420375', N'000004', CAST(N'2016-01-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403468', N'000005', CAST(N'2016-01-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404102', N'000006', CAST(N'2016-01-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1428186', N'000007', CAST(N'2016-01-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404301', N'000008', CAST(N'2016-01-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404465', N'000009', CAST(N'2016-01-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405013', N'000010', CAST(N'2016-01-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405069', N'000011', CAST(N'2016-01-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405632', N'000001', CAST(N'2016-01-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406022', N'000002', CAST(N'2016-01-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406230', N'000003', CAST(N'2016-01-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406542', N'000004', CAST(N'2016-01-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406848', N'000005', CAST(N'2016-01-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406661', N'000006', CAST(N'2016-01-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406968', N'000007', CAST(N'2016-01-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407108', N'000008', CAST(N'2016-01-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420873', N'000009', CAST(N'2016-02-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407356', N'000010', CAST(N'2016-02-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407585', N'000011', CAST(N'2016-02-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407693', N'000001', CAST(N'2016-02-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407855', N'000002', CAST(N'2016-02-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407976', N'000003', CAST(N'2016-02-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420960', N'000004', CAST(N'2016-02-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408182', N'000005', CAST(N'2016-02-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408255', N'000006', CAST(N'2016-02-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408444', N'000007', CAST(N'2016-02-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408698', N'000008', CAST(N'2016-02-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408927', N'000009', CAST(N'2016-02-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409191', N'000010', CAST(N'2016-02-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409288', N'000011', CAST(N'2016-02-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409431', N'000001', CAST(N'2016-02-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400146', N'000002', CAST(N'2016-02-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400239', N'000003', CAST(N'2016-02-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400530', N'000004', CAST(N'2016-02-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400659', N'000005', CAST(N'2016-02-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400760', N'000006', CAST(N'2016-02-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400814', N'000007', CAST(N'2016-02-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400957', N'000008', CAST(N'2016-02-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401198', N'000009', CAST(N'2016-02-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401506', N'000010', CAST(N'2016-02-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401381', N'000011', CAST(N'2016-02-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401777', N'000001', CAST(N'2016-02-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401920', N'000002', CAST(N'2016-02-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'8814029', N'000003', CAST(N'2016-02-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402599', N'000004', CAST(N'2016-02-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402848', N'000005', CAST(N'2016-03-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403380', N'000006', CAST(N'2016-03-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403498', N'000007', CAST(N'2016-03-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420454', N'000008', CAST(N'2016-03-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403912', N'000009', CAST(N'2016-03-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403697', N'000010', CAST(N'2016-03-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404156', N'000011', CAST(N'2016-03-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404470', N'000001', CAST(N'2016-03-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404654', N'000002', CAST(N'2016-03-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404856', N'000003', CAST(N'2016-03-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405057', N'000004', CAST(N'2016-03-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405101', N'000005', CAST(N'2016-03-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405193', N'000006', CAST(N'2016-03-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405292', N'000007', CAST(N'2016-03-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405476', N'000008', CAST(N'2016-03-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405650', N'000009', CAST(N'2016-03-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405829', N'000010', CAST(N'2016-03-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405913', N'000011', CAST(N'2016-03-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406039', N'000001', CAST(N'2016-03-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406257', N'000002', CAST(N'2016-03-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406594', N'000003', CAST(N'2016-03-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420760', N'000004', CAST(N'2016-03-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406693', N'000005', CAST(N'2016-03-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407005', N'000006', CAST(N'2016-03-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407397', N'000007', CAST(N'2016-03-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407505', N'000008', CAST(N'2016-03-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407592', N'000009', CAST(N'2016-03-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407697', N'000010', CAST(N'2016-03-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407860', N'000011', CAST(N'2016-03-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408186', N'000001', CAST(N'2016-03-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420987', N'000002', CAST(N'2016-03-31' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408392', N'000003', CAST(N'2016-04-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408451', N'000004', CAST(N'2016-04-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408613', N'000005', CAST(N'2016-04-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408699', N'000006', CAST(N'2016-04-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409042', N'000007', CAST(N'2016-04-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409208', N'000008', CAST(N'2016-04-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409543', N'000009', CAST(N'2016-04-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400149', N'000010', CAST(N'2016-04-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400379', N'000011', CAST(N'2016-04-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400683', N'000001', CAST(N'2016-04-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400854', N'000002', CAST(N'2016-04-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401008', N'000003', CAST(N'2016-04-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401334', N'000004', CAST(N'2016-04-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401384', N'000005', CAST(N'2016-04-14' AS Date), NULL)
GO
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420194', N'000006', CAST(N'2016-04-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401699', N'000007', CAST(N'2016-04-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401779', N'000008', CAST(N'2016-04-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402080', N'000009', CAST(N'2016-04-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402869', N'000010', CAST(N'2016-04-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403752', N'000011', CAST(N'2016-04-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403394', N'000001', CAST(N'2016-04-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403511', N'000002', CAST(N'2016-04-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403570', N'000003', CAST(N'2016-04-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404097', N'000004', CAST(N'2016-04-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404368', N'000005', CAST(N'2016-04-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404494', N'000006', CAST(N'2016-04-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404672', N'000007', CAST(N'2016-04-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405058', N'000008', CAST(N'2016-04-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420576', N'000009', CAST(N'2016-04-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405110', N'000010', CAST(N'2016-04-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405729', N'000011', CAST(N'2016-05-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405915', N'000001', CAST(N'2016-05-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406454', N'000002', CAST(N'2016-05-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420797', N'000003', CAST(N'2016-05-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407218', N'000004', CAST(N'2016-05-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407634', N'000005', CAST(N'2016-05-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407910', N'000006', CAST(N'2016-05-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407707', N'000007', CAST(N'2016-05-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420926', N'000008', CAST(N'2016-05-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408038', N'000009', CAST(N'2016-05-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408093', N'000010', CAST(N'2016-05-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408261', N'000011', CAST(N'2016-05-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408192', N'000001', CAST(N'2016-05-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1309787', N'000002', CAST(N'2016-05-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409107', N'000003', CAST(N'2016-05-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408671', N'000004', CAST(N'2016-05-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408712', N'000005', CAST(N'2016-05-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408969', N'000006', CAST(N'2016-05-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408829', N'000007', CAST(N'2016-05-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409242', N'000008', CAST(N'2016-05-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409350', N'000009', CAST(N'2016-05-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1320015', N'000010', CAST(N'2016-05-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400196', N'000011', CAST(N'2016-05-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400311', N'000001', CAST(N'2016-05-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400577', N'000002', CAST(N'2016-05-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400702', N'000003', CAST(N'2016-05-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400787', N'000004', CAST(N'2016-05-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1400889', N'000005', CAST(N'2016-05-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401144', N'000006', CAST(N'2016-05-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401228', N'000007', CAST(N'2016-05-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401351', N'000008', CAST(N'2016-05-31' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1202020', N'000009', CAST(N'2016-06-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401397', N'000010', CAST(N'2016-06-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1301994', N'000011', CAST(N'2016-06-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401736', N'000001', CAST(N'2016-06-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401853', N'000002', CAST(N'2016-06-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1401997', N'000003', CAST(N'2016-06-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402164', N'000004', CAST(N'2016-06-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402349', N'000005', CAST(N'2016-06-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1402806', N'000006', CAST(N'2016-06-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403031', N'000007', CAST(N'2016-06-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403163', N'000008', CAST(N'2016-06-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403447', N'000009', CAST(N'2016-06-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403549', N'000010', CAST(N'2016-06-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1403593', N'000011', CAST(N'2016-06-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404099', N'000001', CAST(N'2016-06-15' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404231', N'000002', CAST(N'2016-06-16' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404512', N'000003', CAST(N'2016-06-17' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1404720', N'000004', CAST(N'2016-06-18' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405062', N'000005', CAST(N'2016-06-19' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405229', N'000006', CAST(N'2016-06-20' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405351', N'000007', CAST(N'2016-06-21' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420632', N'000008', CAST(N'2016-06-22' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1405759', N'000009', CAST(N'2016-06-23' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406020', N'000010', CAST(N'2016-06-24' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406468', N'000011', CAST(N'2016-06-25' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406843', N'000001', CAST(N'2016-06-26' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407258', N'000002', CAST(N'2016-06-27' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1406964', N'000003', CAST(N'2016-06-28' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407059', N'000004', CAST(N'2016-06-29' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420846', N'000005', CAST(N'2016-06-30' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407687', N'000006', CAST(N'2016-07-01' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407829', N'000007', CAST(N'2016-07-02' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1420946', N'000008', CAST(N'2016-07-03' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1407955', N'000009', CAST(N'2016-07-04' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408149', N'000010', CAST(N'2016-07-05' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408265', N'000011', CAST(N'2016-07-06' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408417', N'000001', CAST(N'2016-07-07' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408539', N'000002', CAST(N'2016-07-08' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409124', N'000003', CAST(N'2016-07-09' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408696', N'000004', CAST(N'2016-07-10' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408715', N'000005', CAST(N'2016-07-11' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408972', N'000006', CAST(N'2016-07-12' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1408838', N'000007', CAST(N'2016-07-13' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1409399', N'000008', CAST(N'2016-07-14' AS Date), NULL)
INSERT [dbo].[SV-NoiLV] ([MaSV], [MaNLV], [NgayBatDau], [NgayKetThuc]) VALUES (N'1428405', N'000009', CAST(N'2016-07-15' AS Date), NULL)
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Khoa]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Lop]
GO
ALTER TABLE [dbo].[SV-NoiLV]  WITH CHECK ADD  CONSTRAINT [FK_SV-NoiLV_NoiLamViec] FOREIGN KEY([MaNLV])
REFERENCES [dbo].[NoiLamViec] ([MaNLV])
GO
ALTER TABLE [dbo].[SV-NoiLV] CHECK CONSTRAINT [FK_SV-NoiLV_NoiLamViec]
GO
ALTER TABLE [dbo].[SV-NoiLV]  WITH CHECK ADD  CONSTRAINT [FK_SV-NoiLV_SinhVien] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[SV-NoiLV] CHECK CONSTRAINT [FK_SV-NoiLV_SinhVien]
GO
/****** Object:  StoredProcedure [dbo].[dssinhvien]    Script Date: 12/6/2018 9:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dssinhvien] @khoa nvarchar(150),@nienkhoa nvarchar(3)
as begin
	Select MaSV as N'Mã SV', Ho as N'Họ đệm', Ten as N'Tên', SDT, emailSV as email, NoiO as N'Nơi ở', Khoa.MaKhoa as N'Mã Khoa', 
	NienKhoa as N'Niên khóa', Lop.MaLop as N'Mã Lớp'
	from SinhVien join Lop on SinhVien.MaLop= Lop.MaLop join Khoa on SinhVien.MaKhoa= Khoa.MaKhoa
	where Khoa.TenKhoa = @khoa and SinhVien.NienKhoa =@nienkhoa
end
GO
USE [master]
GO
ALTER DATABASE [QLCuuSinhVien_DaoLy_160702233] SET  READ_WRITE 
GO
