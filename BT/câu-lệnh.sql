/*1. Số lượng trong bảng DM nội thất được tự động cập nhật khi nhập hàng  */

alter trigger cau1 on ChiTietHoaDonNhap
for insert ,delete,update  
as 
begin
    declare @soluong float ,@manoithat nvarchar(5),@slban int
	select @manoithat = MaNoiThat from inserted 
	select @slban=sum(SoLuong) from ChiTietDonDatHang where MaNoiThat=@manoithat
	select @soluong = sum (SoLuong) from ChiTietHoaDonNhap where MaNoiThat=@manoithat
	if(@slban is null) set @slban = 0
	update DMNoiThat set SoLuong = (@soluong-@slban) where MaNoiThat =@manoithat
end
--Số lượng trong bảng DM nội thất được tự động cập nhật khi  bán hàng
alter trigger cau1_1 on ChiTietDonDatHang
for insert ,delete,update  
as 
begin
    declare @soluong float ,@manoithat nvarchar(5),@slnhap int
	select @manoithat = MaNoiThat from inserted 
	select @slnhap = sum(SoLuong) from ChiTietHoaDonNhap where MaNoiThat=@manoithat
	select @soluong = sum (SoLuong) from ChiTietDonDatHang where MaNoiThat=@manoithat
	update DMNoiThat set SoLuong = (@slnhap-@soluong) where MaNoiThat =@manoithat
end

--só lượng mua phải nhỏ hơn lượng hàng tồn
create trigger cau1_2 on ChiTietDonDatHang
for insert ,update  
as 
begin
    declare @soluong float ,@manoithat nvarchar(5),@slton int
	select @manoithat = MaNoiThat,@soluong=SoLuong from inserted 
	select @slton= SoLuong from DMNoiThat where MaNoiThat=@manoithat
	if(@soluong>@slton)
	begin
		PRINT N' số lượng mua phải nhỏ hơn số lượng tồn '
		rollback transaction
	end
end

/*2. Giá nhập trong bảng DM nội thất được tự động cập nhật khi nhập hàng*/
alter trigger cau2 on ChiTietHoaDonNhap
for insert ,update  
as 
begin
    declare @gianhap float ,@manoithat nvarchar(5)
	select @manoithat = MaNoiThat,@gianhap = DonGia from inserted 
	update DMNoiThat set DonGiaNhap =@gianhap where MaNoiThat=@manoithat
	end
/*3. Giá bán trong bảng DM nội thất được tự động cập nhật = 110%Giá nhập*/
alter trigger cau3 on ChiTietHoaDonNhap
for insert ,update  
as 
begin
    declare @gianhap float ,@manoithat nvarchar(5)
	select @manoithat = MaNoiThat,@gianhap = DonGia from inserted 
	update DMNoiThat set DonGiaBan =@gianhap*1.1 where MaNoiThat=@manoithat
	end

/*trigger xóa bảng 1 bảng nhiều cũng bị xóa*/

create trigger cl on CaLam
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaCa from inserted
	delete from NhanVien where MaCa=@ma
end
------------------------
create trigger clieu on ChatLieu
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaChatLieu from inserted
	delete from DMNoiThat where MaChatLieu=@ma
end

--------------
create trigger cv on CongViec
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaCV from inserted
	delete from NhanVien where MaCV=@ma
end

-------------
create trigger dmnt on DMNoiThat
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaNoiThat from inserted
	delete from ChiTietDonDatHang where MaNoiThat=@ma
	delete from ChiTietHoaDonNhap where MaNoiThat=@ma
end

----------------
create trigger ddh on DonDatHang
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=SoDDH from inserted
	delete from ChiTietDonDatHang where SoDDH=@ma
end

---------------
create trigger hdn on HoaDonNhap
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=SoHDN from inserted
	delete from ChiTietHoaDonNhap where SoHDN=@ma
end

------------
create trigger kh on KhachHang
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaKhach from inserted
	delete from DonDatHang where MaKhach=@ma
end

---------------------
create trigger kd on KieuDang
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaKieu from inserted
	delete from DMNoiThat where MaKieu=@ma
end

---------------
create trigger ms on MauSac
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaMau from inserted
	delete from DMNoiThat where MaMau=@ma
end

-------------------------
create trigger ncc on NhaCungCap
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaNCC from inserted
	delete from HoaDonNhap where MaNCC=@ma
end

----------------
create trigger nv on NhanVien
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaNV from inserted
	delete from HoaDonNhap where MaNV=@ma
	delete from DonDatHang where MaNV=@ma
end

-------------
create trigger nsx on NuocSanXuat
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaNuocSX from inserted
	delete from DMNoiThat where MaNuocSX=@ma
end

-------------
create trigger tl on TheLoai
for delete
as 
begin
	declare @ma nvarchar(5)
	select @ma=MaLoai from inserted
	delete from DMNoiThat where MaLoai=@ma
end
/*trong bảng DonDatHang ngày đặt phải nhỏ hơn ngày giao*/
create trigger ngay on DonDatHang
for insert,update
as
begin
	declare @ngaydat datetime, @ngaygiao datetime
	select @ngaydat = NgayDat,@ngaygiao = NgayDao from inserted
	if(DATEDIFF(DAY,@ngaydat,@ngaygiao)<0)
	begin
		PRINT N' ngày giao phải lớn hơn ngày nhập '
		rollback transaction
	end
end
--trường thành tiền tự cập nhật
alter trigger thanhtien1 on ChiTietHoaDonNhap
for insert,update
as
begin
	declare @gia float, @sl int,@giamgia float,@mant nvarchar(5),@mahdn nvarchar(5)
	select @gia=DonGia,@sl=SoLuong,@giamgia=GiamGia,@mant=MaNoiThat,@mahdn=SoHDN from inserted
	update ChiTietHoaDonNhap set ThanhTien = @gia*@sl*(100-@giamgia)/100 where MaNoiThat=@mant and SoHDN=@mahdn
end

alter trigger thanhtien2 on ChiTietDonDatHang
for insert,update
as
begin
	declare @gia float, @sl int,@giamgia float,@mant nvarchar(5),@mahdn nvarchar(5)
	select @sl=SoLuong,@giamgia=GiamGia,@mant=MaNoiThat,@mahdn=SoDDH from inserted
	select @gia = DonGiaBan from DMNoiThat where MaNoiThat=@mant
	update ChiTietDonDatHang set ThanhTien = @gia*@sl*(100-@giamgia)/100 where MaNoiThat=@mant and SoDDH=@mahdn
end

-- tự cập nhật tổng tiền
create trigger tongtien1 on ChiTietHoaDonNhap
for insert,update
as
begin
	declare @mahdn nvarchar(5),@thanhtien float
	select @mahdn=SoHDN from inserted
	select @thanhtien=sum(ThanhTien) from ChiTietHoaDonNhap where SoHDN=@mahdn
	update HoaDonNhap set TongTien=@thanhtien where SoHDN=@mahdn
end

create trigger tongtien2 on ChiTietDonDatHang
for insert,update
as
begin
	declare @maddh nvarchar(5),@thanhtien float
	select @maddh=SoDDH from inserted
	select @thanhtien=sum(ThanhTien) from ChiTietDonDatHang where SoDDH=@maddh
	update DonDatHang set TongTien=@thanhtien+Thue where SoDDH=@maddh
end


--tạo view
--1. số lượng và tổng số tiền đã bán được của từng hàng hóa(đã tính giảm giá)
--(MaNoiThat,TenNoiThat,SoLuong,Tổng Tiền)
alter view view1 
as
	select dm.MaNoiThat , dm.TenNoiThat , sum(c.SoLuong) as SoLuong , sum (c.ThanhTien) as TongTien
	from DMNoiThat dm join ChiTietDonDatHang c on dm.MaNoiThat  = c.MaNoiThat 
	group by dm.MaNoiThat , dm.TenNoiThat
--2.Tính tổng số lượng và tổng số tiền đã nhập của từng hàng hóa(đã tính giảm giá)
--(MaNoiThat,TenNoiThat,SoLuong,Tổng Tiền)
alter view view2
as 
	select dm.MaNoiThat , dm.TenNoiThat , sum(n.SoLuong) as SoLuong , sum (n.ThanhTien) as TongTien
	from DMNoiThat dm join ChiTietHoaDonNhap n on dm.MaNoiThat  = n.MaNoiThat 
	group by dm.MaNoiThat , dm.TenNoiThat
	select *from view2
--3.	Tạo view cho biết mã khách hàng, tên khách hàng, số điện thoại mức tiền khách hàng đã mua 
alter view view3
as 
	select kh.MaKhach  , kh.TenKhach  , kh.DienThoai , sum(h.TongTien) as TongTien
	from KhachHang kh join DonDatHang h on kh.MaKhach = h.MaKhach 
	group by kh.MaKhach,kh.TenKhach,kh.DienThoai
	select *from view3
--4.	Tạo view cho biết mã NV, tên NV,tổng số hóa đơn nhập của nv đó
alter view view4
as
	select nv.MaNV , nv.TenNV  , count (n.SoHDN) as SoHDN 
	from NhanVien nv join HoaDonNhap n on nv.MaNV = n.MaNV
	
	group by nv.MaNV , nv.TenNV
--5.	Tạo view cho biết mã NV, tên NV,tổng số tiền nhân viên đó bán được của nv đó
alter view view5
as 
	select nv.MaNV  , nv.TenNV  , sum (h.TongTien) as TongTien
	from NhanVien nv  join DonDatHang h on h.MaNV = nv.MaNV 
	group by nv.MaNV , nv.TenNV

--6.	Tạo view cho biết mã NCC,Tên Ncc,tổng số mặt hàng của ncc.
alter view view6 
as 
	select ncc.MaNCC , ncc.TenNCC , count (DISTINCT ct.MaNoiThat) as TongMatHang
	from NhaCungCap ncc join HoaDonNhap n on ncc.MaNCC = n.MaNCC join ChiTietHoaDonNhap ct on ct.SoHDN = n.SoHDN 
	group by ncc.MaNCC , ncc.TenNCC

--Tạo funcion
--1.	Tạo hàm lấy danh sách nhân viên theo quê quán
alter function fun1(@quequan nvarchar(250))
returns table
return(
	select *
	from NhanVien nv
	where nv.DiaChi = @quequan
	
)
select *from fun1(N'Hà Nội')
--2	Tạo hàm lấy danh sách hóa đơn nhập theo nhân viên và ngày (ngày/tháng/năm)
alter function fun2 (@ngay datetime ,@ma nvarchar(5))
returns table
return(
	select *
	from HoaDonNhap n
	where n.MaNV=@ma and n.NgayNhap = @ngay
)
select *from fun2('2018-09-09','01')
--3.Tạo hàm lấy danh sách nhà cung cấp theo mã hàng
alter function fun3 (@ma nvarchar(5))
returns table 
return(
	select @ma as MaHang ,ncc.MaNCC , ncc.TenNCC , ncc.DiaChi , ncc.DienThoai 
	from ChiTietHoaDonNhap ct join HoaDonNhap n on n.SoHDN = ct.SoHDN join NhaCungCap ncc on n.MaNCC=ncc.MaNCC
	where ct.MaNoiThat =@ma
)
select *from fun3('15')
--4.Tạo hàm lấy danh sách các mặt hàng theo mã nhà cung cấp
alter function fun4 (@ma nvarchar(5))
returns table
return(
	select @ma as MaNCC , dm.MaNoiThat,dm.TenNoiThat
	from HoaDonNhap n join ChiTietHoaDonNhap ct on n.SoHDN = ct.SoHDN join DMNoiThat dm on dm.MaNoiThat = ct.MaNoiThat 
	where n.MaNCC = @ma
)
select *from fun4('01')
--5.	Tạo hàm với đầu vào là năm, đầu ra là số nhân viên sinh vào năm đó
create function fun5 (@nam int )
returns table
return (
	select *
	from NhanVien nv
	where year(nv.NgaySinh) = @nam
)
select *from fun5('1999')

--6.	Tạo hàm đầu vào là công việc đầu ra là những nhân viên cùng công việc đó
create function fun6(@macv nvarchar(55))
returns table
return(
	select *
	from NhanVien 
	where MaCV=@macv
)

select * from fun6('01')

--tạo proc 
--1.Tạo thủ tục đầu vào là mã nv đầu ra là số đơn đặt hàng của nhân viên đó
create proc proc1 @ma nvarchar(5), @count float output
as 
begin
	select @count=count(h.SoDDH) 
	from DonDatHang h 
	where @ma = h.MaNV

end
declare @manv nvarchar(5), @so float
exec proc1 '05' ,@so output 
print @so
--2.Tạo thủ tục với đầu vào là ngày, đầu ra là số đơn đặt hàng, doanh thu của ngày đó
alter proc proc2 @ngay datetime , @count float output , @dt float output 
as 
begin
	select  @count =count (h.SoDDH) , @dt=sum(h.TongTien)
	from DonDatHang h 
	where h.NgayDat =@ngay
end
declare @ngayy datetime , @so float , @tien float 
exec proc2 '2019-09-09' , @so output ,@tien output
print 'So hoa Don ' + cast(@so as char) +'Doanh THU '+cast(@tien as nvarchar(50))
--3.	Tạo thủ tục với đầu vào là mã khách hàng đầu ra là tổng số lượng đồ nội thất đã mua của khách hàng đó
alter proc proc3 @ma nvarchar(5),@count float output 
as 
begin
	select @count = sum(ct.SoLuong)
	from KhachHang kh join DonDatHang h on kh.MaKhach = h.MaKhach join ChiTietDonDatHang ct on ct.SoDDH = h.SoDDH
	where kh.MaKhach =@ma
end
declare @manv nvarchar(5) , @so float 
exec proc3 '05' , @so  output
print cast(@so as char)
--4.	Tạo thủ tục với đầu vào là mã loại đầu ra là tổng số tiền đã bán của những đồ nội thất thuộc loại đó
alter proc proc4 @ma nvarchar(5),@tongtien float output
as 
begin
	select @tongtien = sum(ct.SoLuong*dm.DonGiaBan)
	from DMNoiThat dm join ChiTietDonDatHang ct on dm.MaNoiThat = ct.MaNoiThat 
	where dm.MaLoai=@ma
end
declare @maloai nvarchar(5) , @tien float 
exec proc4 '01' , @tien output 
print cast(@tien as char)
--5.	Tạo thủ tục với đầu vào là mã ca đầu ra là số nhân viên làm trong ca đó.
create proc proc5 @ma nvarchar(5),@count float output 
as 
begin
	select @count = count(cl.MaCa)
	from CaLam cl join NhanVien nv on nv.MaCa=cl.MaCa
	where cl.MaCa =@ma
end 
declare @maca nvarchar(5), @so float
exec proc5 '01' , @so output
print cast(@so as char)

--Tạo thủ tục chèn là các thông tin hóa đơn nhập và chi tiết hóa đơn nhập, hãy đảm bảo việc cập nhật là
--đồng thời thành công hoặc không thành công (transaction)*/
create proc nhap @mahd nvarchar(5), @manv nvarchar(10), @ngaylaphd
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





