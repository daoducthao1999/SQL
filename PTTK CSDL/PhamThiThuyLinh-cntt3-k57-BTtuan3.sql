							--------------------------------------------------------------------------------
--Bai4
--Cau1
create view Ketqua as
select DanhSach.SoBD, ho + ' '+ten as hoten, Phai, DATEDIFF(year, NTNS,GETDATE()) as Tuoi, Toan, Van, AnhVan, 
(Toan+Van+AnhVan+DiemUT) as TongDiem,
	case when (Toan+Van+AnhVan+DiemUT)>=24 and Toan>=7 and Van>=7 and AnhVan>=7 then N'Gioi'
		when (Toan+Van+AnhVan+DiemUT)>=21 and Toan>=6 and Van>=6 and AnhVan>=6 then N'Kha'
		when (Toan+Van+AnhVan+DiemUT)>=15 and Toan>=4 and Van>=4 and AnhVan>=4 then N'Trung Binh'
		else N'Truot'
	end as XepLoai, DanhSach.DTDuThi
 from DanhSach, DiemThi, ChiTietDT 
 where DanhSach.SoBD=DiemThi.SoBD and DanhSach.DTDuThi=ChiTietDT.DTDuThi

 select * from Ketqua
 drop view Ketqua

--Cau2
create view Gioi as
select DanhSach.SoBD, ho + ' '+ten as hoten, Phai, year(GETDATE()) - year(NTNS) as Tuoi, Toan, Van, AnhVan, 
(Toan+Van+AnhVan+DiemUT) as TongDiem, DienGiaiDT
from DanhSach, DiemThi, ChiTietDT 
 where DanhSach.SoBD=DiemThi.SoBD and DanhSach.DTDuThi=ChiTietDT.DTDuThi
 and Toan=10 or Van=10 or AnhVan=10 and (Toan+Van+AnhVan+DiemUT)>=25

 select * from Gioi
 drop view Gioi

 --Cau3
 create view DSDau as
 select DanhSach.SoBD, ho + ' '+ten as hoten, Phai, DATEDIFF(year, NTNS,GETDATE()) as Tuoi, Toan, Van, AnhVan, 
(Toan+Van+AnhVan+DiemUT) as TongDiem,
	case when (Toan+Van+AnhVan+DiemUT)>=24 and Toan>=7 and Van>=7 and AnhVan>=7 then N'Gioi'
		when (Toan+Van+AnhVan+DiemUT)>=21 and Toan>=6 and Van>=6 and AnhVan>=6 then N'Kha'
		when (Toan+Van+AnhVan+DiemUT)>=15 and Toan>=4 and Van>=4 and AnhVan>=4 then N'Trung Binh'
		else N'Truot'
	end as XepLoai, DanhSach.DTDuThi
 from DanhSach, DiemThi, ChiTietDT 
 where DanhSach.SoBD=DiemThi.SoBD and DanhSach.DTDuThi=ChiTietDT.DTDuThi
 and (Toan+Van+AnhVan+DiemUT)>=15 and Toan>=4 and Van>=4 and AnhVan>=4

 select * from DSDau
 drop view DSDau

 --Cau4
 create view HS_ThuKhoa as
 select DiemThi.SoBD, ho + ' '+ten as hoten, Phai, DATEDIFF(year, NTNS,GETDATE()) as Tuoi, Toan, Van, AnhVan,
  (Toan+Van+AnhVan+DiemUT) as TongDiem,
	case when (Toan+Van+AnhVan+DiemUT)>=24 and Toan>=7 and Van>=7 and AnhVan>=7 then N'Gioi'
		when (Toan+Van+AnhVan+DiemUT)>=21 and Toan>=6 and Van>=6 and AnhVan>=6 then N'Kha'
		when (Toan+Van+AnhVan+DiemUT)>=15 and Toan>=4 and Van>=4 and AnhVan>=4 then N'Trung Binh'
		else N'Truot'
	end as XepLoai, DienGiaiDT
 from DanhSach, DiemThi, ChiTietDT
 where DanhSach.SoBD=DiemThi.SoBD and DanhSach.DTDuThi=ChiTietDT.DTDuThi and Toan+Van+AnhVan+DiemUT= (select Max(TongDiem) from DSDau)

 select *from HS_ThuKhoa
 drop view HS_ThuKhoa

 --Cau5
 create procedure ex05 @soBD int, @toan real output, @van real output, @anhvan real output,@diemut int output, @tongdiem real output
 as begin
select @toan = Toan, @van=Van, @anhvan=AnhVan, @diemut= DiemUT, @tongdiem = Toan + Van + AnhVan + DiemUT
 from DanhSach
		inner join DiemThi on DanhSach.SoBD = DiemThi.SoBD
		inner join ChiTietDT on DanhSach.DTDuThi = ChiTietDT.DTDuThi
	where DanhSach.SoBD = @soBD
end

--Cau6 trigger kiểm tra xem việc nhập mã đối tượng dự thi trong bảng danh sách có đúng với bảng đối tượng dự thi không 
create trigger kiemtra on DanhSach
for insert, update
as begin
declare @dtDuThi tinyint
	select @dtDuThi = DTDuThi from inserted

	if( @dtDuThi not in (select DTDuThi from ChiTietDT))
		begin
			raiserror(N'Đối tượng dự thi không tồn tại',16,1)
			rollback transaction
		end
end

drop trigger kiemtra

--Cau7
create trigger capnhat on DiemThi
for insert, update
as begin
	declare @soBD int, @diemUT int, @toan int, @van int, @anhvan int, @tongdiem int
	select @soBD= inserted.SoBD, @diemUT= ChiTietDT.DiemUT, @toan=Toan, @van=Van, @anhvan=AnhVan
	 from DanhSach
	 inner join inserted on DanhSach.SoBD=inserted.SoBD
	 inner join ChiTietDT on DanhSach.DTDuThi=ChiTietDT.DTDuThi

	 set @tongdiem= @toan + @van +@anhvan + @diemUT

	 update DiemThi set DiemUT= @diemUT, TongDiem= @tongdiem
	 where SoBD=@soBD
end

drop trigger capnhat

--Cau8
create trigger xoatudong on DanhSach
for delete 
as begin
	declare @soBD int
	select @soBD=SoBD from deleted
	delete from DiemThi where SoBD=@soBD
end

drop trigger xoatudong


									-----------------------------------------------------------------------------------

--Bai5
--cau1
create procedure thongtin @mahs nvarchar(5), @ho nvarchar(255) output, @ten nvarchar(255) output, @truong nvarchar(255) output,
											 @ns datetime output, @phai bit output
as
begin
select @ho=HO, @ten =TEN, @phai=PHAI, @truong=TENTRUONG , @ns=NGAYSINH
from DANHSACH, TRUONG
where DANHSACH.MATRUONG=TRUONG.MATRUONG
and DANHSACH.MAHS=@mahs
end

declare @b nvarchar(255)
declare @c nvarchar(255)
declare @d nvarchar(255)
declare @e datetime
declare @f bit
exec thongtin '0002', @b output, @c output, @d output, @e output, @f output
print @b
print @c
print @d
print @e
print @f

--Cau2
create function cau2(@hoTenHS nvarchar(255))
returns table
as return
	(
		select DANHSACH.MAHS, HO + ' ' + TEN as Hoten, PHAI, NGAYSINH, DANHSACH.MATRUONG, TENTRUONG,
			tableTemp.Toan, tableTemp.Van
		from DANHSACH
			inner join TRUONG on DANHSACH.MATRUONG = TRUONG.MATRUONG
			inner join (select d1.MAHS, d1.DIEM as Toan, d2.DIEM as Van
						from DIEM d1 inner join DIEM d2 on d1.MAHS = d2.MAHS
						where d1.MON = 'Toan' and d2.MON = 'Van') as tableTemp on DANHSACH.MAHS = tableTemp.MAHS
		where HO + ' ' + TEN = @hoTenHS
	)

--Cau3
create trigger cau3 on DanhSach
for insert, update
as begin
	declare @mahs nvarchar(5), @hoten nvarchar(255), @gioitinh nvarchar(255), @tentruong nvarchar(150)
	select @mahs = MAHS, @hoten = HO + ' ' + TEN,
		@gioitinh = (case when PHAI = 'False' then N'Nam'
							else N'Nữ'
					 end), @tentruong = TENTRUONG
	from inserted inner join TRUONG on inserted.MATRUONG = TRUONG.MATRUONG

	if(@mahs in (select MAHS from BangDiemHS))
		update BangDiemHS set HoTen = @hoten, GioiTinh = @gioitinh, TenTruong = @tentruong where MAHS = @mahs
	else
		insert into BangDiemHS(MAHS, Hoten, GioiTinh, TenTruong) values(@mahs, @hoten, @gioitinh, @tentruong)
end

--Cau4
create trigger tggg on BangDiemHS for insert, update
as
set nocount on
begin
declare @mhs nvarchar(5), @toan float, @van float
select @mhs=MAHS, @toan=Toan, @van=Van from inserted
update DIEM set DIEM=@toan where MAHS=@mhs and MON='Toan'
update DIEM set DIEM=@van where MAHS=@mhs and MON='Van'
end

--Cau5
create function cau5(@matruong nvarchar(4))
returns table
as return
	(
		select DANHSACH.MAHS, HO + ' ' + TEN as HoTen, tableTemp.Toan, tableTemp.Van
		from DANHSACH
			inner join TRUONG on DANHSACH.MATRUONG = TRUONG.MATRUONG
			inner join (select d1.MAHS, d1.DIEM as Toan, d2.DIEM as Van
						from DIEM d1 inner join DIEM d2 on d1.MAHS = d2.MAHS
						where d1.MON = 'Toan' and d2.MON = 'Van') as tableTemp on DANHSACH.MAHS = tableTemp.MAHS
		where TRUONG.MATRUONG = @matruong
	)

										-----------------------------------------------------------------------------------
--Bai6
--Cau1
create trigger tg1 on tSach for insert, update
as
set nocount on
begin
declare @msach nvarchar(255), @gia money
select @msach=MaSach, @gia=convert(money,DonGiaBan) from inserted

update tChiTietHDB
set GiaBan=@gia where MaSach=@msach
end

--Cau2
create trigger tg2 on tSach for insert, update
as
set nocount on
begin
declare @msach nvarchar(255), @gia money
select @msach=MaSach, @gia=convert(money,DonGiaBan) from inserted

update tChiTietHDB
set GiaBan=@gia, ThanhTien=SLBan*@gia where MaSach=@msach
end
--Cau3
create trigger cau3 on tHoaDonBan
for delete
as begin
	declare @soHDB nvarchar(50)
	select @soHDB = SoHDB from deleted
	delete from tChiTietHDB where SoHDB = @soHDB
end

--Cau4
create proc cau4 @maKH nvarchar(255), @tongtien nvarchar(255) output
as begin
	if(@maKH not in (select MaKH from tHoaDonBan)) print N'Mã bạn nhập không tồn tại!'
	else begin
		select @tongtien = (case when SUM(cast(RIGHT(ThanhTien, LEN(ThanhTien)-1) as decimal)) is null then 0
								else SUM(cast(RIGHT(ThanhTien, LEN(ThanhTien)-1) as decimal))
							end)
		from tChiTietHDB
			inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
		where YEAR(NgayBan) = 2014 and MaKH = @maKH
	end
end

--Cau5
create view cau5 as
select tHoaDonBan.MaKH, TenKH, DienThoai,
	case when SUM(cast(RIGHT(ThanhTien, LEN(ThanhTien)-1) as decimal)) is null then 0
		else SUM(cast(RIGHT(ThanhTien, LEN(ThanhTien)-1) as decimal))
	end as MucTien
from tHoaDonBan
	inner join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
	inner join tKhachHang on tHoaDonBan.MaKH = tKhachHang.MaKH
where YEAR(NgayBan) = 2013
group by tHoaDonBan.MaKH, TenKH, DienThoai

--Cau6
create proc cau6 @thang int, @doanhthu decimal output
as begin
	select @doanhthu = (case when SUM(cast(RIGHT(ThanhTien, LEN(ThanhTien)-1) as decimal)) is null then 0
							else SUM(cast(RIGHT(ThanhTien, LEN(ThanhTien)-1) as decimal))
						end)
	from tChiTietHDB inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	where MONTH(NgayBan) = @thang
end

--Cau7
create proc cau7 @sohdb nvarchar(50), @masach1 nvarchar(50), @slban1 int, @khuyenmai1 nvarchar(255),
				@masach2 nvarchar(50), @slban2 int, @khuyenmai2 nvarchar(255),
				@masach3 nvarchar(50), @slban3 int, @khuyenmai3 nvarchar(255),
				@manv nvarchar(50), @ngayban datetime, @makh nvarchar(50)
as begin
	begin tran
	begin try
		insert into tHoaDonBan values(@sohdb, @manv, @ngayban, @makh)
		insert into tChiTietHDB(SoHDB, MaSach, SLBan, KhuyenMai) values(@sohdb, @masach1, @slban1, @khuyenmai1)
		insert into tChiTietHDB(SoHDB, MaSach, SLBan, KhuyenMai) values(@sohdb, @masach2, @slban2, @khuyenmai2)
		insert into tChiTietHDB(SoHDB, MaSach, SLBan, KhuyenMai) values(@sohdb, @masach3, @slban3, @khuyenmai3)
		commit tran
	end try
	begin catch
		rollback tran
		print N'Lối: ' + error_message();
	end catch
end
