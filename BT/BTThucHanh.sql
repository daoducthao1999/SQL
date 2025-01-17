USE [BTThucHanh]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[ID] [nvarchar](15) NOT NULL,
	[type] [nvarchar](1) NULL,
	[mark] [int] NULL,
	[explain] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chi Tiet Hang Nhap]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chi Tiet Hang Nhap](
	[ID] [nvarchar](15) NOT NULL,
	[attributes] [nvarchar](30) NOT NULL,
	[value] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chi Tiet Hoa Don]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chi Tiet Hoa Don](
	[BID] [nvarchar](15) NOT NULL,
	[PID] [nvarchar](15) NOT NULL,
	[pname] [nvarchar](255) NULL,
	[quatity] [smallint] NULL,
	[price] [float] NULL,
	[amount] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DS Thuoc Tinh]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DS Thuoc Tinh](
	[attributes] [nvarchar](30) NULL,
	[explain] [nvarchar](150) NULL,
	[type] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[ID] [nvarchar](15) NOT NULL,
	[attributes] [nvarchar](30) NULL,
	[value] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID] [nvarchar](15) NOT NULL,
	[CID] [nvarchar](15) NULL,
	[total] [float] NULL,
	[count] [int] NULL,
	[discount] [float] NULL,
	[CreatID] [nvarchar](15) NULL,
	[Bdate] [nvarchar](10) NULL,
	[Btime] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khach Hang]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khach Hang](
	[ID] [nvarchar](15) NOT NULL,
	[Cname] [nvarchar](35) NULL,
	[tell] [nvarchar](15) NULL,
	[address] [nvarchar](100) NULL,
	[birthday] [datetime] NULL,
	[Card] [nvarchar](20) NULL,
	[mark] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[ID] [nvarchar](15) NOT NULL,
	[sname] [nvarchar](150) NULL,
	[address] [nvarchar](150) NULL,
	[tell] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhan Vien]    Script Date: 29-Oct-19 7:27:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhan Vien](
	[ID] [nvarchar](15) NOT NULL,
	[ename] [nvarchar](35) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](150) NULL,
	[IDCard] [nvarchar](20) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'11', N'Idtype', N'1')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'11', N'menufatory_date', N'22/8/2016')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'11', N'quatity', N'100')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'21', N'Idtype', N'2')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'21', N'menufatory_date', N'23/8/2016')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'21', N'quatity', N'50')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'31', N'Idtype', N'3')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'31', N'menufatory_date', N'22/8/2016')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'31', N'expiration_date', N'24/8/2016')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'31', N'quatity', N'20')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'41', N'Idtype', N'4')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'41', N'menufatory_date', N'22/8/2016')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'41', N'expiration_date', N'3/9/2016')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'41', N'quatity', N'100')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'42', N'Idtype', N'4')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'42', N'menufatory_date', N'25/8/2016')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'42', N'expiration_date', N'6/9/2016')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'42', N'quality', N'50')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'11', N'purchase', N'950000')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'21', N'purchase', N'600000')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'31', N'purchase', N'15000')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'41', N'purchase', N'25000')
INSERT [dbo].[Chi Tiet Hang Nhap] ([ID], [attributes], [value]) VALUES (N'42', N'purchase', N'27000')
INSERT [dbo].[Chi Tiet Hoa Don] ([BID], [PID], [pname], [quatity], [price], [amount]) VALUES (N'1', N'1', NULL, 2, 0, 0)
INSERT [dbo].[Chi Tiet Hoa Don] ([BID], [PID], [pname], [quatity], [price], [amount]) VALUES (N'1', N'2', NULL, 1, 0, 0)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'ID', N'Mã', N'sort text (15)')
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'pname', N'Tên sản phẩm', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'supplier', N'Nhà cung cấp', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'manufatory', N'Nhà sản xuất', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'national', N'Nước sản xuất', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'unit', N'Đơn vị tính', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'barcode', N'Mã vạch', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'size', N'cỡ', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'color', N'màu sắc', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'waist', N'vòng eo', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'inseam', N'đường may', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'shoulder', N'vai', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'material', N'chất liệu', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'buttock', N'vòng mông', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'chest', N'vòng ngược', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'neck', N'vòng cổ', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'necktype', N'kiểu cổ', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'sleeve', N'độ dài tay', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'length', N'độ dài', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'button', N'số cúc', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'collection', N'tên bộ sưu tập', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'manufactory_date', N'ngày sản xuất', N'sort text (dd/mm/yyyy)')
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'expiration_date', N'ngày hết hạn', N'sort text (dd/mm/yyyy)')
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'weight', N'trọng lượng', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'vegetarian', N'thực phẩm cho người ăn chay hay không', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'ages', N'lứa tuổi sử dụng', N'number')
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'image', N'hình ảnh', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'ptype', N'Loại hàng hóa: fa: đồ may mặc, fo: thực phẩm khô, fr: hoa quả, rau, fi: cá, tôm, hải sản, me: thịt các loại', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'Idtype', N'Mã hàng chứa', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'quatity', N'Số lượng', N'number')
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'purchase', N'Giá nhập', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'price', N'Giá bán', NULL)
INSERT [dbo].[DS Thuoc Tinh] ([attributes], [explain], [type]) VALUES (N'tax', N'thuế', NULL)
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'name', N'Áo hè họa tiết')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'manufatory', N'1')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'national', N'Việt Nam')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'unit', N'chiếc')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'size', N'M')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'barcode', N'456231')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'2', N'name', N'Quần dài công sở')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'2', N'manufatory', N'2')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'2', N'national', N'Việt Nam')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'2', N'barcode', N'897645')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'ptype', N'fa')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'2', N'ptype', N'fa')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'name', N'Rau cải ngọt Mộc Châu')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'supplier', N'4')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'manufatory', N'5')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'national', N'Việt Nam')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'unit', N'kg')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'barcode', N'234123')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'vegetarian', N'1')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'name', N'Dưa hấu Tiền Giang')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'supplier', N'4')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'national', N'Việt Nam')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'unit', N'kg')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'barcode', N'234543')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'vegetarian', N'1')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'name', N'Dầu ăn Simply')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'supplier', N'3')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'manufatory', N'3')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'national', N'Việt Nam')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'unit', N'5l')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'barcode', N'309859')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'ptype', N'fo')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'ptype', N'fa')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'2', N'ptype', N'fa')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'ptype', N'fr')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'ptype', N'fr')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'tax', N'0.1')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'2', N'tax', N'0.1')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'tax', N'0.05')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'tax', N'0.05')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'tax', N'0.05')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'1', N'price', N'1050000')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'2', N'price', N'750000')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'3', N'price', N'35000')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'4', N'price', N'30000')
INSERT [dbo].[HangHoa] ([ID], [attributes], [value]) VALUES (N'5', N'price', N'250000')
INSERT [dbo].[HoaDon] ([ID], [CID], [total], [count], [discount], [CreatID], [Bdate], [Btime]) VALUES (N'1', N'1', NULL, NULL, NULL, N'1', N'12/02/2016', N'10:12')
INSERT [dbo].[HoaDon] ([ID], [CID], [total], [count], [discount], [CreatID], [Bdate], [Btime]) VALUES (N'2', N'2', NULL, NULL, NULL, N'1', N'12/02/2016', N'11:00')
INSERT [dbo].[HoaDon] ([ID], [CID], [total], [count], [discount], [CreatID], [Bdate], [Btime]) VALUES (N'3', N'2', 0, 0, 0, N'2', N'15/3/2016', N'1200')
INSERT [dbo].[HoaDon] ([ID], [CID], [total], [count], [discount], [CreatID], [Bdate], [Btime]) VALUES (N'4', N'1', 0, 0, 0, N'2', N'23022016', N'1003')
INSERT [dbo].[Khach Hang] ([ID], [Cname], [tell], [address], [birthday], [Card], [mark]) VALUES (N'1', N'Nguyễn Kim Sao', N'0905883993', N'HN', CAST(N'2011-01-01T00:00:00.000' AS DateTime), N'125', NULL)
INSERT [dbo].[Khach Hang] ([ID], [Cname], [tell], [address], [birthday], [Card], [mark]) VALUES (N'2', N'Hoàng Văn Ánh', N'0900009999', N'HN', CAST(N'2010-02-02T00:00:00.000' AS DateTime), N'126', NULL)
INSERT [dbo].[NhaCungCap] ([ID], [sname], [address], [tell], [email]) VALUES (N'1', N'Nem', N'Hà Nội', N'0902233222', N'abc@abc')
INSERT [dbo].[NhaCungCap] ([ID], [sname], [address], [tell], [email]) VALUES (N'2', N'Việt Tiến', N'Hà Nội', N'043256323', N'abd@abc')
INSERT [dbo].[NhaCungCap] ([ID], [sname], [address], [tell], [email]) VALUES (N'3', N'Simply', N'TP HCM', N'043234224', N'abe@abc')
INSERT [dbo].[NhaCungCap] ([ID], [sname], [address], [tell], [email]) VALUES (N'4', N'VietGAP', N'TP HCM', N'089093248', N'abf@abc')
INSERT [dbo].[NhaCungCap] ([ID], [sname], [address], [tell], [email]) VALUES (N'5', N'Công ty thực vật Mộc Châu', N'Mộc Châu', N'035689203', N'abg@abc')
INSERT [dbo].[Nhan Vien] ([ID], [ename], [phone], [address], [IDCard]) VALUES (N'1', N'Nguyễn Thị Nhung', N'12345678', N'Hà Nội', N'0987890')
INSERT [dbo].[Nhan Vien] ([ID], [ename], [phone], [address], [IDCard]) VALUES (N'2', N'Trần Văn Hùng', N'98079876', N'Thái Nguyên', N'0863975')
