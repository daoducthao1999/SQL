USE [master]
GO
/****** Object:  Database [QuanLiBanDieuHoa]    Script Date: 10/16/2018 2:53:41 PM ******/
CREATE DATABASE [QuanLiBanDieuHoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLiBanDieuHoa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLiBanDieuHoa.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLiBanDieuHoa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLiBanDieuHoa_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLiBanDieuHoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLiBanDieuHoa]
GO
/****** Object:  UserDefinedFunction [dbo].[SoNV]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[SoNV](@nam int) returns int
as
begin
     select @nam=count(MaNV) from tNhanVien
	 where year(NgaySinh)=@nam 
	 return @nam
end
GO
/****** Object:  Table [dbo].[tChiTietHBN]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHBN](
	[SoHDN] [nchar](10) NOT NULL,
	[MaHang] [nchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_tChiTietHBN] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC,
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tChiTietHDB]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[SoHDB] [nchar](10) NOT NULL,
	[MaHang] [nchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[GiamGia] [nchar](10) NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC,
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tCongViec]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCongViec](
	[MaCV] [nchar](10) NOT NULL,
	[TenCV] [nvarchar](50) NULL,
	[MucLuong] [float] NULL,
 CONSTRAINT [PK_tCongViec] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tDMHangHoa]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDMHangHoa](
	[MaHang] [nchar](10) NOT NULL,
	[TenHangHoa] [nvarchar](50) NULL,
	[Loai] [nvarchar](50) NULL,
	[KichThuoc] [nvarchar](50) NULL,
	[CongSuat] [nvarchar](50) NULL,
	[HangSX] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGiaNhap] [int] NULL,
	[DonGiaBan] [int] NULL,
	[Anh] [ntext] NULL,
	[ThoiGianBH] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tDMHangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tHoaDonBan]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonBan](
	[SoHDB] [nchar](10) NOT NULL,
	[MaNV] [nchar](10) NULL,
	[NgayBan] [date] NULL,
	[MaKhach] [nchar](10) NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tHoaDonNhap]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonNhap](
	[SoHDN] [nchar](10) NOT NULL,
	[MaNV] [nchar](10) NULL,
	[NgayNhap] [date] NULL,
	[MaNCC] [nchar](10) NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_tHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tKhachHang]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhachHang](
	[MaKhach] [nchar](10) NOT NULL,
	[TenKhach] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [int] NULL,
 CONSTRAINT [PK_tKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tNhaCungCap]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhaCungCap](
	[MaNCC] [nchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [int] NULL,
 CONSTRAINT [PK_tNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tNhanVien]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[DienThoai] [int] NULL,
	[DiaChi] [nvarchar](100) NULL,
	[MaCV] [nchar](10) NULL,
	[NgayBD] [date] NULL,
 CONSTRAINT [PK_tNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[ChucVu]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ChucVu](@chucvu nchar(10)) returns table
as
return
      (
	  select MaNV,TenNV,TenCV from tNhanVien,tCongViec
	  where tNhanVien.MaCV=tCongViec.MaCV and tNhanVien.MaCV=@chucvu
	  )
GO
/****** Object:  UserDefinedFunction [dbo].[DSNV]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[DSNV](@nam int) returns table
as
return(
       select MaNV,TenNV from tNhanVien
	   where (year(getdate())-year(NgayBD))=@nam
	   )
GO
/****** Object:  UserDefinedFunction [dbo].[thongtin]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[thongtin](@mahd nchar(10)) returns table
as
return
      (
	  select SoHDB,tCHiTietHDB.MaHang,tCHiTietHDB.SoLuong,DonGiaBan,GiamGia ,((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) as ThanhTien from tCHiTietHDB,tDMHangHoa
	  where tCHiTietHDB.MaHang=tDMHangHoa.MaHang and SoHDB=@mahd
	  )
GO
/****** Object:  View [dbo].[DoanhThu]    Script Date: 10/16/2018 2:53:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[DoanhThu]
as
select
	  SUM(case when month(NgayBan)=1 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang1,
	  SUM(case when month(NgayBan)=2 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang2,
	  SUM(case when month(NgayBan)=3 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang3,
	  SUM(case when month(NgayBan)=4 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang4,
	  SUM(case when month(NgayBan)=05 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang5,
	  SUM(case when month(NgayBan)=6 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang6,
	  SUM(case when month(NgayBan)=7 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang7,
	  SUM(case when month(NgayBan)=8 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang8,
	  SUM(case when month(NgayBan)=9 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang9,
	  SUM(case when month(NgayBan)=10 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang10,
	  SUM(case when month(NgayBan)=11 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang11,
	  SUM(case when month(NgayBan)=12 then ((tCHiTietHDB.SoLuong*DonGiaBan)-(tCHiTietHDB.SoLuong*DonGiaBan*GiamGia)/100) end) as Thang12
from tHoaDonBan,tChiTietHDB,tDMHangHoa
where tHoaDonBan.SoHDB=tChiTietHDB.SoHDB and tChiTietHDB.MaHang=tDMHangHoa.MaHang

GO
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN01     ', N'H01       ', 20, 3500000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN02     ', N'H03       ', 25, 5000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN03     ', N'H02       ', 15, 4000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN04     ', N'H04       ', 35, 7000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN05     ', N'H10       ', 10, 5500000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN06     ', N'H11       ', 9, 10000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN07     ', N'H12       ', 8, 4000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN08     ', N'H13       ', 8, 8000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN09     ', N'H14       ', 13, 5500000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN10     ', N'H15       ', 10, 10000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN11     ', N'H09       ', 15, 6000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN12     ', N'H08       ', 15, 10000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN13     ', N'H07       ', 13, 7500000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN14     ', N'H06       ', 10, 8000000)
INSERT [dbo].[tChiTietHBN] ([SoHDN], [MaHang], [SoLuong], [DonGia]) VALUES (N'HDN15     ', N'H05       ', 28, 5500000)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB01     ', N'H01       ', 2, N'10        ')
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB02     ', N'H02       ', 3, N'20        ')
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB03     ', N'H03       ', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB04     ', N'H04       ', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB05     ', N'H05       ', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB06     ', N'H06       ', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB07     ', N'H07       ', 10, N'5         ')
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB08     ', N'H08       ', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB09     ', N'H09       ', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB10     ', N'H10       ', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB11     ', N'H11       ', 4, N'10        ')
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB12     ', N'H12       ', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB13     ', N'H13       ', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB14     ', N'H14       ', 2, N'5         ')
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaHang], [SoLuong], [GiamGia]) VALUES (N'HDB15     ', N'H15       ', 10, NULL)
INSERT [dbo].[tCongViec] ([MaCV], [TenCV], [MucLuong]) VALUES (N'CV01      ', N'Quản lý', 150000000)
INSERT [dbo].[tCongViec] ([MaCV], [TenCV], [MucLuong]) VALUES (N'CV02      ', N'Bán hàng', 100000000)
INSERT [dbo].[tCongViec] ([MaCV], [TenCV], [MucLuong]) VALUES (N'CV03      ', N'Chăm sóc khách hàng', 80000000)
INSERT [dbo].[tCongViec] ([MaCV], [TenCV], [MucLuong]) VALUES (N'CV04      ', N'Lắp đặt', 100000000)
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H01       ', N'Điều hòa treo tường Panasonic CU/CS-L9SKH-8', N'Panasonic 1 chiều', N'87 x 29 x 20.4 cm', N'9000 BTU', N'Panasonic', 20, 3500000, 5500000, N'Anh1.jpg', N'2 năm', N'Điều hòa mát lạnh, tiết kiệm điện ')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H02       ', N'Điều hòa Panasonic 1 chiều Inverter CU/CS-U18TKH-8', N'Panasonic 1 chiều', N'81 x 25 x 19.8 cm', N'12000 BTU', N'Panasonic', 30, 4000000, 6500000, N'anh5.jpg', N'2 năm', N'Điều hòa 1 chiều tiết kiệm điện,mát dịu')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H03       ', N'Điều hòa Panasonic 2 chiều Inverter CU/CS-E9RKH-8', N'Panasonic 2 chiều', N'85 x 27 x 20,3 cm', N'18000 BTU', N'Panasonic', 50, 5000000, 7500000, N'anh5.jpg', N'3 năm', N'Điều hòa 2 chiều tiện lợi')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H04       ', N'Điều hòa SamSung AS09XLN 1 chiều   ', N'SamSung 1 chiều', N'84 x 28 x 20,1 cm', N'17700 BTU', N'SamSung', 12, 7000000, 10000000, N'anh6.jpg', N'3 năm', N'Điều hòa 1 chiều dễ sử dụng')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H05       ', N'Điều hòa SamSung AS24TULN 2 chiều ', N'SamSung 2 chiều', N'86 x 26,5 x 19 cm', N'24000 BTU', N'SamSung', 45, 5500000, 8000000, N'anh4.jpg', N'2,5 năm', N'Điều hòa 2 chiều nhỏ ,gọn, đẹp,,')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H06       ', N'Điều hòa DaiKin FTHF25RVMV 2 chiều', N'Daikin 2 chiều', N'83 x 27,5 x 20,2 cm', N'13000 BTU', N'Daikin', 10, 8000000, 12000000, N'anh2.jpg', N'3 năm', N'Điều hòa quá tuyệt')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H07       ', N'Điều hòa DaiKin FTKS25GVMV 1 chiều', N'Daikin 1 chiều', N'85 x 27 x 20,3 cm', N'15000 BTU', N'Daikin', 20, 7500000, 10500000, N'anh3.jpg', N'2 năm', N'Điều hòa tiện lợi')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H08       ', N'Điều hòa LG Interver V13ENF', N'LG 2 chiều', N'87 x 29 x 20.4 cm', N'10000 BTU', N'LG', 25, 10000000, 13000000, N'anh7.jpg', N'2,5 năm', N'Điều hòa đa năng')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H09       ', N'Điều hòa Sharp 1 chiều Inverter', N'Sharp 1 chiều', N'86 x 26,5 x 19 cm', N'32000 BTU', N'Sharp', 30, 6000000, 9500000, N'anh8.jpg', N'2 năm', N'Đẹp, bền')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H10       ', N'Điều hòa Sharp 2 chiều', N'Sharp 2 chiều', N'83 x 27,5 x 20,2 cm', N'14000 BTU', N'Sharp', 15, 5500000, 8000000, N'anh9.jpg', N'2 năm', N'Chắc chắn')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H11       ', N'Điều hòa ToShiBa Inverter 1 chiều ', N'Toshiba 1 chiều', N'81 x 25 x 19.8 cm', N'18000 BTU', N'ToShiBa', 13, 10000000, 13500000, N'anh10.jpg', N'3 năm', N'An toàn')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H12       ', N'Điều hòa ToShiBa Inverter 2 chiều', N'Toshiba 2 chiều', N'87 x 29 x 20.4 cm', N'24000 BTU', N'ToShiBa', 17, 4000000, 6500000, N'anh11.jpg', N'3 năm', N'Đẹp')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H13       ', N'Điều hòa Sanyo 1 chiều EX01TKF8 ', N'Sanyo 1 chiều', N'81 x 25 x 19.8 cm', N'9000 BTU', N'Sanyo', 20, 8000000, 10500000, N'anh12.jpg', N'2,5 năm', N'Chất lượng đảm bảo')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H14       ', N'Điều hòa Sanyo 2 chiều LM8HTYU3', N'Sanyo 2 chiều', N'86 x 26,5 x 19 cm', N'12000 BTU', N'Sanyo', 21, 5500000, 10000000, N'anh13.jpg', N'2 năm', N'An toàn, rẻ đẹp')
INSERT [dbo].[tDMHangHoa] ([MaHang], [TenHangHoa], [Loai], [KichThuoc], [CongSuat], [HangSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBH], [GhiChu]) VALUES (N'H15       ', N'Điều hòa Elextrolux 2 chiều', N'Electrolux 2 chiều', N'83 x 27,5 x 20,2 cm', N'14000 BTU', N'Elextrolux', 25, 10000000, 14000000, N'anh14.jpg', N'3 năm', NULL)
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB01     ', N'NV01      ', CAST(N'2018-09-19' AS Date), N'KH01      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB02     ', N'NV05      ', CAST(N'2018-04-02' AS Date), N'KH014     ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB03     ', N'NV05      ', CAST(N'2018-09-20' AS Date), N'KH15      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB04     ', N'NV01      ', CAST(N'2018-09-21' AS Date), N'KH02      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB05     ', N'NV01      ', CAST(N'2018-10-11' AS Date), N'KH03      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB06     ', N'NV05      ', CAST(N'2018-10-13' AS Date), N'KH04      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB07     ', N'NV01      ', CAST(N'2018-04-03' AS Date), N'KH05      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB08     ', N'NV05      ', CAST(N'2018-04-05' AS Date), N'KH06      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB09     ', N'NV01      ', CAST(N'2018-05-15' AS Date), N'KH07      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB10     ', N'NV05      ', CAST(N'2018-05-17' AS Date), N'KH08      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB11     ', N'NV01      ', CAST(N'2018-06-23' AS Date), N'KH09      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB12     ', N'NV01      ', CAST(N'2018-06-12' AS Date), N'KH10      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB13     ', N'NV05      ', CAST(N'2018-07-23' AS Date), N'KH11      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB14     ', N'NV01      ', CAST(N'2018-08-24' AS Date), N'KH12      ')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKhach]) VALUES (N'HDB15     ', N'NV05      ', CAST(N'2018-07-14' AS Date), N'KH13      ')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN01     ', N'NV01      ', CAST(N'2018-01-12' AS Date), N'NCC01     ', 70000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN02     ', N'NV01      ', CAST(N'2018-03-12' AS Date), N'NCC02     ', 125000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN03     ', N'NV01      ', CAST(N'2018-03-12' AS Date), N'NCC01     ', 60000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN04     ', N'NV01      ', CAST(N'2018-01-12' AS Date), N'NCC04     ', 245000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN05     ', N'NV01      ', CAST(N'2018-02-12' AS Date), N'NCC04     ', 55000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN06     ', N'NV01      ', CAST(N'2018-01-12' AS Date), N'NCC01     ', 90000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN07     ', N'NV01      ', CAST(N'2018-02-12' AS Date), N'NCC01     ', 32000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN08     ', N'NV01      ', CAST(N'2018-01-12' AS Date), N'NCC03     ', 64000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN09     ', N'NV01      ', CAST(N'2018-03-12' AS Date), N'NCC01     ', 715000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN10     ', N'NV01      ', CAST(N'2018-02-12' AS Date), N'NCC02     ', 100000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN11     ', N'NV01      ', CAST(N'2018-01-12' AS Date), N'NCC01     ', 90000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN12     ', N'NV01      ', CAST(N'2018-03-12' AS Date), N'NCC03     ', 150000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN13     ', N'NV01      ', CAST(N'2018-01-12' AS Date), N'NCC01     ', 97500000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN14     ', N'NV01      ', CAST(N'2018-02-12' AS Date), N'NCC04     ', 80000000)
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'HDN15     ', N'NV01      ', CAST(N'2018-03-12' AS Date), N'NCC02     ', 154000000)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH01      ', N'Nguyễn Thị Ngọc', N'Ninh Giang  - Hải Dương', 976123456)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH02      ', N'Nguyễn Minh Tuấn', N'Quỳnh Phụ - Thái Bình', 315458845)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH03      ', N'Chu Đặng Mỹ Linh', N'Mỗ Lao - Hà Đông - Hà Nội', 25996525)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH04      ', N'Đặng Trần Bảo Hân', N'Đường Hoàng Văn Thái - Hà Nội', 48656565)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH05      ', N'Nguyễn Duy Hiếu', N'Cầu Giấy - Hà Nội', 5884556)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH06      ', N'Vi Quang Lưu', N'Đường Láng - Hà Nội', 2125568)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH07      ', N'Nguyễn Văn Quân', N'Đường Trần Đại Nghĩa - Hà Nội', 64874698)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH08      ', N'Đào Thị Hải Bình', N'Thanh Xuân - Hà Nội', 15259887)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH09      ', N'Đoàn Quốc Nam', N'Đông Anh - Hà Nội', 2447986)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH10      ', N'Ly Mí Và', N'Giải Phóng - Hà Nội', 2245896)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH11      ', N'Bùi Thanh Nam', N'Kiến Xương - Thái Bình', 45789624)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH12      ', N'Nguyễn Hải Anh', N'Hải Phòng', 369998)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH13      ', N'Hoàng Thị Liên', N'Gia Phong - Ninh Bình', 3585889)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH14      ', N'Phùng Thị An', N'Bắc Ninh', 478933211)
INSERT [dbo].[tKhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'KH15      ', N'Lê Thị Vân', N'Nam Định', 525899988)
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC01     ', N'CTy TNHH Điện Máy Thiên Phú', N'41 Hoàng Diệu, phường 12, quận 4, TPHCM', 1215454545)
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC02     ', N'CTy TNHH Thiết bị và Phụ Tùng bách Khoa', N'790 Sư Vạn Hạnh,phường 12,quận 10,TPHCM', 234567890)
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC03     ', N'CTy TNHH Dịch Vụ Thương Mại Điện Máy Thành Đạt', N'1276 Quang Trung,phường 14,quận Vò Vấp,TPHCM', 987654322)
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC04     ', N'CTy TNHH Hoàng Minh Ánh', N'472 Lê Anh Hiến,phường Khương Mỹ,quận Vũ Hành Sơn,TPĐN', 987654323)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCV], [NgayBD]) VALUES (N'NV01      ', N'Trần Thị Nhẫn', 1, CAST(N'1998-02-04' AS Date), 954321567, N'Quỳnh Phụ - Thái Bình', N'CV02      ', CAST(N'1995-11-02' AS Date))
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCV], [NgayBD]) VALUES (N'NV02      ', N'Phạm Thị Thùy Linh', 1, CAST(N'1998-06-30' AS Date), 123456788, N'Gia Viễn - Ninh Bình', N'CV03      ', CAST(N'1995-12-10' AS Date))
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCV], [NgayBD]) VALUES (N'NV03      ', N'Trần Thị Ngọc', 1, CAST(N'1998-09-27' AS Date), 456789000, N'Quất Lam - Nam Định', N'CV03      ', CAST(N'1995-09-23' AS Date))
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCV], [NgayBD]) VALUES (N'NV04      ', N'Hoàng Minh Hiếu', 0, CAST(N'1998-10-13' AS Date), 234567812, N'Thọ Xuân - Đan Phượng - Hà Nội', N'CV01      ', CAST(N'1994-10-17' AS Date))
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCV], [NgayBD]) VALUES (N'NV05      ', N'Lê Thị Hà', 1, CAST(N'1998-08-24' AS Date), 234567876, N'Hà Nam', N'CV02      ', CAST(N'1994-08-28' AS Date))
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCV], [NgayBD]) VALUES (N'NV06      ', N'Nguyễn Trung Nghĩa', 0, CAST(N'1998-02-16' AS Date), 987651234, N'Đường Trần Đại Nghĩa , Hà Nội', N'CV04      ', CAST(N'1996-05-31' AS Date))
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCV], [NgayBD]) VALUES (N'NV07      ', N'Nguyễn Đăng Thịnh', 0, CAST(N'1998-04-06' AS Date), 982345764, N'Tứ Kì - Hải Dương', N'CV04      ', CAST(N'1996-10-21' AS Date))
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tNhanVien]
GO
ALTER TABLE [dbo].[tNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_tNhanVien_tCongViec] FOREIGN KEY([MaCV])
REFERENCES [dbo].[tCongViec] ([MaCV])
GO
ALTER TABLE [dbo].[tNhanVien] CHECK CONSTRAINT [FK_tNhanVien_tCongViec]
GO
USE [master]
GO
ALTER DATABASE [QuanLiBanDieuHoa] SET  READ_WRITE 
GO
