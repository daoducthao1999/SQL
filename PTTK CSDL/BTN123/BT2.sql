
CREATE DATABASE [BT2]

USE [BT2]
GO
/****** Object:  Table [dbo].[tChiTietKH]    Script Date: 23/02/2017 11:55:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietKH](
	[MaDK] [nvarchar](3) NULL,
	[LoaiKH] [nvarchar](1) NULL,
	[TenKH] [nvarchar](25) NULL,
	[NgaySinh] [datetime] NULL,
	[Phai] [bit] NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tDangKy]    Script Date: 23/02/2017 11:55:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDangKy](
	[MaDK] [nvarchar](3) NOT NULL,
	[SoPhong] [nvarchar](50) NULL,
	[LoaiPhong] [nvarchar](2) NULL,
	[NgayVao] [datetime] NULL,
	[NgayRa] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tKhachHang]    Script Date: 23/02/2017 11:55:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhachHang](
	[LoaiKH] [nvarchar](1) NULL,
	[DienGiai] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tLoaiPhong]    Script Date: 23/02/2017 11:55:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tLoaiPhong](
	[LoaiPhong] [nvarchar](1) NULL,
	[GiaiThich] [nvarchar](50) NULL,
	[DonGia] [int] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'001', N'1', N'Trần Hồng Hà', CAST(N'1980-12-12T00:00:00.000' AS DateTime), 0, N'34A Trần phú', NULL)
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'002', N'1', N'Nguyễn Thế Anh', CAST(N'1968-03-22T00:00:00.000' AS DateTime), 0, N'123 Trần Hưng Đạo', NULL)
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'003', N'1', N'Lê Gia Linh', CAST(N'1981-04-12T00:00:00.000' AS DateTime), 1, N'564 Nguyễn Trãi', N'8445563')
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'004', N'3', N'Nguyễn Thị Minh tâm', CAST(N'1975-05-23T00:00:00.000' AS DateTime), 1, N'56/12 Đặng văn Ngữ', NULL)
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'005', N'1', N'Nguyễn Kim Sơn', CAST(N'1969-09-12T00:00:00.000' AS DateTime), 0, N'78/9 Nguyễn Thị Minh Khai', N'8355647')
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'006', N'1', N'Trần Hạnh Dung', CAST(N'1952-12-15T00:00:00.000' AS DateTime), 1, N'34 Lê Duẩn', NULL)
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'007', N'2', N'Lý Mỹ Lệ', CAST(N'1980-01-16T00:00:00.000' AS DateTime), 1, N'14/2 Vũ Trọng Phụng', N'8679456')
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'008', N'2', N'Nguyễn Kim An', CAST(N'1963-03-12T00:00:00.000' AS DateTime), 0, N'23 Trần Bình Trọng', NULL)
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'009', N'1', N'Nguyễn Phương Dung', CAST(N'1982-06-10T00:00:00.000' AS DateTime), 1, N'67 Hoàng Hoa Thám', N'8767752')
INSERT [dbo].[tChiTietKH] ([MaDK], [LoaiKH], [TenKH], [NgaySinh], [Phai], [DiaChi], [DienThoai]) VALUES (N'010', N'1', N'Lê Thị Kim thảo', CAST(N'1969-09-03T00:00:00.000' AS DateTime), 1, N'56 Nguyễn Tuân', NULL)
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'001', N'201', N'A', CAST(N'1998-04-26T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'002', N'202', N'B', CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'003', N'101', N'A', CAST(N'1998-05-01T00:00:00.000' AS DateTime), CAST(N'1998-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'004', N'102', N'A', CAST(N'1998-05-02T00:00:00.000' AS DateTime), CAST(N'1998-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'005', N'405', N'B', CAST(N'1998-05-03T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'006', N'608', N'C', CAST(N'1998-06-01T00:00:00.000' AS DateTime), CAST(N'1998-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'007', N'304', N'C', CAST(N'1998-06-05T00:00:00.000' AS DateTime), CAST(N'1998-06-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'008', N'201', N'B', CAST(N'1998-06-30T00:00:00.000' AS DateTime), CAST(N'1998-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'009', N'205', N'A', CAST(N'1999-07-01T00:00:00.000' AS DateTime), CAST(N'1999-07-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tDangKy] ([MaDK], [SoPhong], [LoaiPhong], [NgayVao], [NgayRa]) VALUES (N'010', N'601', N'B', CAST(N'1999-01-01T00:00:00.000' AS DateTime), CAST(N'1999-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tKhachHang] ([LoaiKH], [DienGiai]) VALUES (N'1', N'Khách vãng lai')
INSERT [dbo].[tKhachHang] ([LoaiKH], [DienGiai]) VALUES (N'2', N'Khách hàng thân thiết')
INSERT [dbo].[tKhachHang] ([LoaiKH], [DienGiai]) VALUES (N'3', N'Khách có thẻ của công ty Bảo hiểm')
INSERT [dbo].[tLoaiPhong] ([LoaiPhong], [GiaiThich], [DonGia]) VALUES (N'A', N'Máy Lạnh, Nước nóng, Ti Vi,Tủ lạnh, Đ.Thoại', 200000)
INSERT [dbo].[tLoaiPhong] ([LoaiPhong], [GiaiThich], [DonGia]) VALUES (N'B', N'Máy Lạnh, Nươc Nóng, Điện Thoại', 150000)
INSERT [dbo].[tLoaiPhong] ([LoaiPhong], [GiaiThich], [DonGia]) VALUES (N'C', N'Điện Thoại', 100000)
USE [master]
GO
ALTER DATABASE [BT2] SET  READ_WRITE 
GO
