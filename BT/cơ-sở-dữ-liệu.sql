USE [QUANLYCUAHANGNOITHAT]
GO
/****** Object:  Table [dbo].[ChiTietDonDatHang]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[SoDDH] [nvarchar](5) NOT NULL,
	[MaNoiThat] [nvarchar](5) NOT NULL,
	[SoLuong] [float] NULL,
	[GiamGia] [float] NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [PK_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDDH] ASC,
	[MaNoiThat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMNoiThat]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMNoiThat](
	[MaNoiThat] [nvarchar](5) NOT NULL,
	[TenNoiThat] [nvarchar](50) NULL,
	[MaLoai] [nvarchar](5) NULL,
	[MaKieu] [nvarchar](5) NULL,
	[MaMau] [nvarchar](5) NULL,
	[MaChatLieu] [nvarchar](5) NULL,
	[MaNuocSX] [nvarchar](5) NULL,
	[SoLuong] [float] NULL,
	[DonGiaNhap] [float] NULL,
	[DonGiaBan] [float] NULL,
	[Anh] [nvarchar](50) NULL,
	[ThoiGianBaoHanh] [float] NULL,
 CONSTRAINT [PK_DMNoiThat] PRIMARY KEY CLUSTERED 
(
	[MaNoiThat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view1]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view1] 
as
	select dm.MaNoiThat , dm.TenNoiThat , sum(c.SoLuong) as SoLuong , sum (c.ThanhTien) as TongTien
	from DMNoiThat dm join ChiTietDonDatHang c on dm.MaNoiThat  = c.MaNoiThat 
	group by dm.MaNoiThat , dm.TenNoiThat
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[SoHDN] [nvarchar](5) NOT NULL,
	[MaNoiThat] [nvarchar](5) NOT NULL,
	[SoLuong] [float] NULL,
	[DonGia] [float] NULL,
	[GiamGia] [float] NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [PK_ChiTietHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC,
	[MaNoiThat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view2]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view2]
as 
	select dm.MaNoiThat , dm.TenNoiThat , sum(n.SoLuong) as SoLuong , sum (n.ThanhTien) as TongTien
	from DMNoiThat dm join ChiTietHoaDonNhap n on dm.MaNoiThat  = n.MaNoiThat 
	group by dm.MaNoiThat , dm.TenNoiThat
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[SoDDH] [nvarchar](5) NOT NULL,
	[MaNV] [nvarchar](5) NULL,
	[MaKhach] [nvarchar](5) NULL,
	[NgayDat] [date] NULL,
	[NgayDao] [date] NULL,
	[DatCoc] [int] NULL,
	[Thue] [float] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhach] [nvarchar](5) NOT NULL,
	[TenKhach] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [float] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view3]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view3]
as 
	select kh.MaKhach  , kh.TenKhach  , kh.DienThoai , sum(h.TongTien) as TongTien
	from KhachHang kh join DonDatHang h on kh.MaKhach = h.MaKhach 
	group by kh.MaKhach,kh.TenKhach,kh.DienThoai
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[SoHDN] [nvarchar](5) NOT NULL,
	[MaNV] [nvarchar](5) NULL,
	[NgayNhap] [date] NULL,
	[MaNCC] [nvarchar](5) NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](5) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [date] NULL,
	[DienThoai] [float] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MaCa] [nvarchar](5) NULL,
	[MaCV] [nvarchar](5) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view4]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view4]
as
	select nv.MaNV , nv.TenNV  , count (n.SoHDN) as SoHDN 
	from NhanVien nv join HoaDonNhap n on nv.MaNV = n.MaNV
	
	group by nv.MaNV , nv.TenNV
GO
/****** Object:  View [dbo].[view5]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view5]
as 
	select nv.MaNV  , nv.TenNV  , sum (h.TongTien) as TongTien
	from NhanVien nv  join DonDatHang h on h.MaNV = nv.MaNV 
	group by nv.MaNV , nv.TenNV
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](5) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [float] NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view6]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view6] 
as 
	select ncc.MaNCC , ncc.TenNCC , count (DISTINCT ct.MaNoiThat) as TongMatHang
	from NhaCungCap ncc join HoaDonNhap n on ncc.MaNCC = n.MaNCC join ChiTietHoaDonNhap ct on ct.SoHDN = n.SoHDN 
	group by ncc.MaNCC , ncc.TenNCC
GO
/****** Object:  UserDefinedFunction [dbo].[fun1]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun1](@quequan nvarchar(250))
returns table
return(
	select *
	from NhanVien nv
	where nv.DiaChi = @quequan
	
)
GO
/****** Object:  UserDefinedFunction [dbo].[fun2]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun2] (@ngay datetime ,@ma nvarchar(5))
returns table
return(
	select *
	from HoaDonNhap n
	where n.MaNV=@ma and n.NgayNhap = @ngay
)
GO
/****** Object:  UserDefinedFunction [dbo].[fun3]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun3] (@ma nvarchar(5))
returns table 
return(
	select @ma as MaHang ,ncc.MaNCC , ncc.TenNCC , ncc.DiaChi , ncc.DienThoai 
	from ChiTietHoaDonNhap ct join HoaDonNhap n on n.SoHDN = ct.SoHDN join NhaCungCap ncc on n.MaNCC=ncc.MaNCC
	where ct.MaNoiThat =@ma
)
GO
/****** Object:  UserDefinedFunction [dbo].[fun4]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fun4] (@ma nvarchar(5))
returns table
return(
	select @ma as MaNCC , dm.MaNoiThat,dm.TenNoiThat
	from HoaDonNhap n join ChiTietHoaDonNhap ct on n.SoHDN = ct.SoHDN join DMNoiThat dm on dm.MaNoiThat = ct.MaNoiThat 
	where n.MaNCC = @ma
)
GO
/****** Object:  UserDefinedFunction [dbo].[fun5]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun5] (@nam int )
returns table
return (
	select *
	from NhanVien nv
	where year(nv.NgaySinh) = @nam
)
GO
/****** Object:  UserDefinedFunction [dbo].[fun6]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fun6](@macv nvarchar(55))
returns table
return(
	select *
	from NhanVien 
	where MaCV=@macv
)
GO
/****** Object:  Table [dbo].[CaLam]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaLam](
	[MaCa] [nvarchar](5) NOT NULL,
	[TenCa] [nvarchar](50) NULL,
 CONSTRAINT [PK_CaLam] PRIMARY KEY CLUSTERED 
(
	[MaCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatLieu](
	[MaChatLieu] [nvarchar](5) NOT NULL,
	[TenChatLieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChatLieu] PRIMARY KEY CLUSTERED 
(
	[MaChatLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[MaCV] [nvarchar](5) NOT NULL,
	[TenCV] [nvarchar](50) NULL,
 CONSTRAINT [PK_CongViec] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KieuDang]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KieuDang](
	[MaKieu] [nvarchar](5) NOT NULL,
	[TenKieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_KieuDang] PRIMARY KEY CLUSTERED 
(
	[MaKieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [nvarchar](5) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
 CONSTRAINT [PK_MauSac] PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NuocSanXuat]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NuocSanXuat](
	[MaNuocSX] [nvarchar](5) NOT NULL,
	[TenNuocSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_NuocSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNuocSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [nvarchar](5) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CaLam] ([MaCa], [TenCa]) VALUES (N'01', N'Ca 1')
INSERT [dbo].[CaLam] ([MaCa], [TenCa]) VALUES (N'02', N'Ca 2')
INSERT [dbo].[CaLam] ([MaCa], [TenCa]) VALUES (N'03', N'Ca 3')
INSERT [dbo].[CaLam] ([MaCa], [TenCa]) VALUES (N'04', N'Ca 4')
INSERT [dbo].[CaLam] ([MaCa], [TenCa]) VALUES (N'05', N'Ca 5')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'01', N'Vàng')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'02', N'Bạc')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'03', N'Đồng')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'04', N'Nhựa')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'05', N'Vải')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'06', N'Nhôm')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'07', N'Sắt')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu]) VALUES (N'08', N'Sứs')
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'01', N'01', 10, 10, 8799991.2)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'01', N'02', 10, 10, 6534000.0000000009)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'01', N'03', 11, 20, 1355200)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'01', N'04', 10, 6, 1034000.0000000001)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'02', N'05', 13, 7, 1994850)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'02', N'06', 14, 8, 2266880)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'02', N'07', 15, 9, 1501500.0000000002)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'02', N'08', 16, 5, 16719983.280000003)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'03', N'09', 17, 0, 3366000.0000000005)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'03', N'10', 8, 1, 1655280.0000000002)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'03', N'11', 19, 2, 4096400.0000000005)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'03', N'12', 1, 16, 914760)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'04', N'01', 5, 4, 4693328.64)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'04', N'13', 2, 14, 208120.00000000003)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'04', N'14', 3, 18, 2647875.12)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'04', N'15', 4, 8, 4452800)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'05', N'02', 6, 9, 3963960.0000000005)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'05', N'03', 7, 11, 959420)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'05', N'09', 8, 12, 1393920.0000000002)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'05', N'11', 9, 13, 1722600.0000000002)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'06', N'02', 2, 17, 1205160.0000000002)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'06', N'12', 10, 14, 9365400)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'06', N'13', 1, 15, 102850.00000000002)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'06', N'14', 1, 16, 904152.48)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'07', N'07', 7, 19, 623700.00000000012)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'07', N'08', 5, 20, 4399995.6000000006)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'07', N'09', 5, 18, 811800.00000000012)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'08', N'01', 3, 4, 2815997.1840000004)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'08', N'02', 6, 5, 4138200.0000000005)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'08', N'05', 10, 0, 1650000)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'08', N'06', 8, 1, 1393920)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'08', N'09', 7, 6, 1302840.0000000002)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'08', N'13', 11, 2, 1304380.0000000002)
INSERT [dbo].[ChiTietDonDatHang] ([SoDDH], [MaNoiThat], [SoLuong], [GiamGia], [ThanhTien]) VALUES (N'08', N'14', 2, 3, 2088161.68)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'01', N'01', 10, 100000, 10, 900000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'01', N'02', 15, 200000, 5, 2850000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'01', N'05', 77, 200000, 5, 14630000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'02', N'01', 66, 220000, 6, 13648800)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'02', N'02', 22, 540000, 5, 11286000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'02', N'03', 55, 120000, 6, 6204000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'03', N'02', 11, 660000, 5, 6897000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'03', N'04', 19, 240000, 4, 4377600)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'03', N'06', 88, 50000, 10, 3960000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'04', N'01', 12, 770000, 5, 8778000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'04', N'07', 99, 230000, 6, 21403800)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'04', N'08', 154, 120000, 4, 17740800)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'04', N'09', 101, 460000, 5, 44137000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'05', N'10', 10, 440000, 2, 4312000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'05', N'15', 15, 800000, 3, 11640000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'06', N'11', 100, 450000, 1, 44550000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'06', N'12', 220, 320000, 2, 68992000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'06', N'13', 210, 110000, 3, 22407000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07', N'03', 64, 140000, 1, 8870400)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'08', N'05', 5, 150000, 6, 705000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'08', N'06', 7, 160000, 7, 1041600)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'08', N'07', 9, 170000, 8, 1407600)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'09', N'08', 8, 999999, 0, 7999992)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'09', N'09', 7, 180000, 9, 1146600)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'09', N'10', 8, 190000, 10, 1368000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'09', N'11', 9, 200000, 11, 1602000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'09', N'12', 8, 990000, 0, 7920000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'10', N'01', 9, 888888, 6, 7519992.48)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'10', N'04', 5, 100000, 5, 475000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'10', N'14', 8, 978520, 4, 7515033.6)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'11', N'07', 11, 100000, 6, 1034000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'11', N'14', 12, 1000000, 9, 10920000)
INSERT [dbo].[ChiTietHoaDonNhap] ([SoHDN], [MaNoiThat], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'11', N'15', 15, 1100000, 11, 14685000)
INSERT [dbo].[CongViec] ([MaCV], [TenCV]) VALUES (N'01', N'CV1')
INSERT [dbo].[CongViec] ([MaCV], [TenCV]) VALUES (N'02', N'Cv2')
INSERT [dbo].[CongViec] ([MaCV], [TenCV]) VALUES (N'03', N'CV3')
INSERT [dbo].[CongViec] ([MaCV], [TenCV]) VALUES (N'04', N'CV4')
INSERT [dbo].[CongViec] ([MaCV], [TenCV]) VALUES (N'05', N'CV5')
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'01', N'Ghế', N'01', N'01', N'01', N'01', N'01', 79, 888888, 977776.8, NULL, 12)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'02', N'Giường', N'02', N'02', N'02', N'02', N'02', 24, 660000, 726000.00000000012, NULL, 12)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'03', N'Tủ', N'03', N'03', N'03', N'03', N'03', 101, 140000, 154000, NULL, 12)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'04', N'Bàn', N'04', N'04', N'04', N'04', N'04', 14, 100000, 110000.00000000002, NULL, 12)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'05', N'Sofa', N'05', N'05', N'05', N'05', N'05', 59, 150000, 165000, NULL, 12)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'06', N'Tủ đựng giày', N'01', N'02', N'03', N'04', N'05', 73, 160000, 176000, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'07', N'Bàn máy tính', N'05', N'02', N'04', N'03', N'01', 97, 100000, 110000.00000000002, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'08', N'Bàn Ăn', N'05', N'02', N'03', N'01', N'05', 141, 999999, 1099998.9000000001, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'09', N'Bàn học', N'03', N'02', N'01', N'02', N'02', 71, 180000, 198000.00000000003, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'10', N'Tủ sách', N'01', N'02', N'03', N'02', N'01', 10, 190000, 209000.00000000003, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'11', N'Giường đơn', N'02', N'01', N'01', N'01', N'02', 81, 200000, 220000.00000000003, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'12', N'Giường đôi', N'02', N'03', N'01', N'05', N'02', 217, 990000, 1089000, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'13', N'Tủ ti vi', N'03', N'03', N'05', N'04', N'03', 196, 110000, 121000.00000000002, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'14', N'Gương', N'02', N'01', N'02', N'03', N'01', 14, 978520, 1076372, NULL, 6)
INSERT [dbo].[DMNoiThat] ([MaNoiThat], [TenNoiThat], [MaLoai], [MaKieu], [MaMau], [MaChatLieu], [MaNuocSX], [SoLuong], [DonGiaNhap], [DonGiaBan], [Anh], [ThoiGianBaoHanh]) VALUES (N'15', N'Bàn trang điểm', N'05', N'02', N'02', N'03', N'01', 26, 1100000, 1210000, NULL, 12)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'01', N'01', N'01', CAST(N'2019-09-11' AS Date), CAST(N'2019-09-12' AS Date), 10000, 10000, 17733191)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'02', N'02', N'02', CAST(N'2019-09-09' AS Date), CAST(N'2019-09-12' AS Date), 10000, 20000, 22503213)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'03', N'03', N'03', CAST(N'2019-09-09' AS Date), CAST(N'2019-09-15' AS Date), 20000, 5000, 10037440)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'04', N'04', N'04', CAST(N'2019-09-08' AS Date), CAST(N'2019-09-17' AS Date), 30000, 6000, 12008123)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'05', N'05', N'05', CAST(N'2019-09-07' AS Date), CAST(N'2019-09-19' AS Date), 15000, 2000, 8041900)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'06', N'01', N'03', CAST(N'2019-09-06' AS Date), CAST(N'2019-09-15' AS Date), 17000, 0, 11577562)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'07', N'02', N'01', CAST(N'2019-09-06' AS Date), CAST(N'2019-09-16' AS Date), 22000, 7000, 5842495)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'08', N'05', N'04', CAST(N'2019-09-04' AS Date), CAST(N'2019-09-11' AS Date), 22000, 12000, 14705498)
INSERT [dbo].[DonDatHang] ([SoDDH], [MaNV], [MaKhach], [NgayDat], [NgayDao], [DatCoc], [Thue], [TongTien]) VALUES (N'09', N'05', N'02', CAST(N'2019-09-04' AS Date), CAST(N'2019-09-22' AS Date), 11000, 13000, NULL)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'01', N'01', CAST(N'2018-09-09' AS Date), N'01', 18380000)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'02', N'02', CAST(N'2018-07-09' AS Date), N'02', 31138800)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'03', N'03', CAST(N'2017-09-09' AS Date), N'03', 15234600)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'04', N'04', CAST(N'2018-12-12' AS Date), N'04', 92059600)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'05', N'05', CAST(N'2018-02-01' AS Date), N'05', 15952000)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'06', N'02', CAST(N'2018-05-09' AS Date), N'01', 135949000)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'07', N'02', CAST(N'2018-08-09' AS Date), N'02', 8870400)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'08', N'03', CAST(N'2018-12-05' AS Date), N'02', 3154200)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'09', N'04', CAST(N'2018-01-01' AS Date), N'01', 20036592)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'10', N'01', CAST(N'2018-09-05' AS Date), N'03', 15510026.08)
INSERT [dbo].[HoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (N'11', N'05', CAST(N'2018-09-12' AS Date), N'02', 26639000)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'01', N'Trịnh Xuân Tùng', N'Thanh Hóa', 365646)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'02', N'Nguyễn Tiến Đạt', N'Hà Nội', 216465)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'03', N'Trần Quốc Việt', N'Ninh Bình', 15896)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'04', N'Vũ Thị Hoa', N'Ninh Thuận', 1546565)
INSERT [dbo].[KhachHang] ([MaKhach], [TenKhach], [DiaChi], [DienThoai]) VALUES (N'05', N'Ninh Thị Thủy', N'Quảng Nam', 165646)
INSERT [dbo].[KieuDang] ([MaKieu], [TenKieu]) VALUES (N'01', N'Kiểu 1')
INSERT [dbo].[KieuDang] ([MaKieu], [TenKieu]) VALUES (N'02', N'Kiểu 2')
INSERT [dbo].[KieuDang] ([MaKieu], [TenKieu]) VALUES (N'03', N'Kiểu 3')
INSERT [dbo].[KieuDang] ([MaKieu], [TenKieu]) VALUES (N'04', N'Kiểu 4')
INSERT [dbo].[KieuDang] ([MaKieu], [TenKieu]) VALUES (N'05', N'Kiểu 5')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'01', N'Vàng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'02', N'Đen')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'03', N'Đỏ')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'04', N'Nâu')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'05', N'Cam')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'06', N'Tím')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'01', N'Nhà Cung Cấp 1', N'Hà Nội', 123456789)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'02', N'Nhà Cung Cấp 2', N'Ninh Bình', 987654321)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'03', N'Nhà Cung Cấp 3', N'Hà Nam', 55555555)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'04', N'Nhà Cung Cấp 4', N'Thái bình', 326465)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'05', N'Nhà Cung Cấp 5', N'Quảng Ninh', 4659784)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'01', N'Trịnh thị nở', N'Nữ', CAST(N'1999-06-22' AS Date), 3266465, N'Ninh Bình', N'01', N'01')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'02', N'Trần Văn b', N'Nam', CAST(N'1999-05-21' AS Date), 1659464, N'Hòa Bình', N'02', N'02')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'03', N'Vũ Văn c', N'Nam', CAST(N'2000-06-12' AS Date), 325656, N'Thái Bình', N'03', N'03')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'04', N'nguyễn thị d', N'Nữ', CAST(N'2003-06-10' AS Date), 16656, N'Ninh Bình', N'04', N'04')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'05', N'vũ thị e', N'Nữ', CAST(N'2002-12-22' AS Date), 65656, N'Quảng Ninh', N'05', N'05')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'06', N'Ninh văn f', N'Nam', CAST(N'2001-01-01' AS Date), 26666, N'Hà Nội', N'01', N'02')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'07', N'Nguyễ Văn c', N'Nam', CAST(N'1995-02-02' AS Date), 3265664, N'Hà Nội', N'01', N'03')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'08', N'Trần thị d', N'Nữ', CAST(N'1999-02-02' AS Date), 262652, N'Ninh Bình', N'01', N'04')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'09', N'Ninh thị c', N'Nữ', CAST(N'1995-03-02' AS Date), 326565, N'Hà Nam', N'02', N'05')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [MaCa], [MaCV]) VALUES (N'10', N'Vũ Vương', N'Nam', CAST(N'1997-06-12' AS Date), 2656232, N'Hà Nam', N'03', N'05')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'01', N'Việt Nam')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'02', N'Mỹ')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'03', N'Anh')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'04', N'Pháp')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'05', N'Đức')
INSERT [dbo].[NuocSanXuat] ([MaNuocSX], [TenNuocSX]) VALUES (N'06', N'Nhật Bản')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'01', N'Loại 1')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'02', N'Loại 2')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'03', N'Loại 3')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'04', N'Loại 4')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'05', N'Loại 5')
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DMNoiThat] FOREIGN KEY([MaNoiThat])
REFERENCES [dbo].[DMNoiThat] ([MaNoiThat])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DMNoiThat]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([SoDDH])
REFERENCES [dbo].[DonDatHang] ([SoDDH])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_DMNoiThat] FOREIGN KEY([MaNoiThat])
REFERENCES [dbo].[DMNoiThat] ([MaNoiThat])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_DMNoiThat]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap] FOREIGN KEY([SoHDN])
REFERENCES [dbo].[HoaDonNhap] ([SoHDN])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap]
GO
ALTER TABLE [dbo].[DMNoiThat]  WITH CHECK ADD  CONSTRAINT [FK_DMNoiThat_ChatLieu] FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[ChatLieu] ([MaChatLieu])
GO
ALTER TABLE [dbo].[DMNoiThat] CHECK CONSTRAINT [FK_DMNoiThat_ChatLieu]
GO
ALTER TABLE [dbo].[DMNoiThat]  WITH CHECK ADD  CONSTRAINT [FK_DMNoiThat_KieuDang] FOREIGN KEY([MaKieu])
REFERENCES [dbo].[KieuDang] ([MaKieu])
GO
ALTER TABLE [dbo].[DMNoiThat] CHECK CONSTRAINT [FK_DMNoiThat_KieuDang]
GO
ALTER TABLE [dbo].[DMNoiThat]  WITH CHECK ADD  CONSTRAINT [FK_DMNoiThat_MauSac] FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[DMNoiThat] CHECK CONSTRAINT [FK_DMNoiThat_MauSac]
GO
ALTER TABLE [dbo].[DMNoiThat]  WITH CHECK ADD  CONSTRAINT [FK_DMNoiThat_NuocSanXuat] FOREIGN KEY([MaNuocSX])
REFERENCES [dbo].[NuocSanXuat] ([MaNuocSX])
GO
ALTER TABLE [dbo].[DMNoiThat] CHECK CONSTRAINT [FK_DMNoiThat_NuocSanXuat]
GO
ALTER TABLE [dbo].[DMNoiThat]  WITH CHECK ADD  CONSTRAINT [FK_DMNoiThat_TheLoai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[DMNoiThat] CHECK CONSTRAINT [FK_DMNoiThat_TheLoai]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKhach])
REFERENCES [dbo].[KhachHang] ([MaKhach])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_NhanVien]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_CaLam] FOREIGN KEY([MaCa])
REFERENCES [dbo].[CaLam] ([MaCa])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_CaLam]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_CongViec] FOREIGN KEY([MaCV])
REFERENCES [dbo].[CongViec] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_CongViec]
GO
/****** Object:  StoredProcedure [dbo].[nhap]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[nhap] @mahd nvarchar(5), @manv nvarchar(10), @ngaylaphd
	datetime,@ncc nvarchar(5), @masp nvarchar(5), @sl int, @gia float,@giamgia float, @mahd1 nvarchar(5)
	as begin
	begin try
	begin tran
		insert into HoaDonNhap values (@mahd,@manv,@ngaylaphd,@ncc,null)
		insert into ChiTietHoaDonNhap values (@mahd1,@masp,@sl,@gia,@giamgia,null)
		commit tran
		end try
		begin catch
			print N'Loi'
			rollback tran
		end catch
end
GO
/****** Object:  StoredProcedure [dbo].[proc1]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc1] @ma nvarchar(5), @count float output
as 
begin
	select @count=count(h.SoDDH) 
	from DonDatHang h 
	where @ma = h.MaNV

end
GO
/****** Object:  StoredProcedure [dbo].[proc2]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc2] @ngay datetime , @count float output , @dt float output 
as 
begin
	select  @count =count (h.SoDDH) , @dt=sum(h.TongTien)
	from DonDatHang h 
	where h.NgayDat =@ngay
end
GO
/****** Object:  StoredProcedure [dbo].[proc3]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc3] @ma nvarchar(5),@count float output 
as 
begin
	select @count = sum(ct.SoLuong)
	from KhachHang kh join DonDatHang h on kh.MaKhach = h.MaKhach join ChiTietDonDatHang ct on ct.SoDDH = h.SoDDH
	where kh.MaKhach =@ma
end
GO
/****** Object:  StoredProcedure [dbo].[proc4]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc4] @ma nvarchar(5),@tongtien float output
as 
begin
	select @tongtien = sum(ct.SoLuong*dm.DonGiaBan)
	from DMNoiThat dm join ChiTietDonDatHang ct on dm.MaNoiThat = ct.MaNoiThat 
	where dm.MaLoai=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[proc5]    Script Date: 11/9/2019 9:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc5] @ma nvarchar(5),@count float output 
as 
begin
	select @count = count(cl.MaCa)
	from CaLam cl join NhanVien nv on nv.MaCa=cl.MaCa
	where cl.MaCa =@ma
end 
GO
