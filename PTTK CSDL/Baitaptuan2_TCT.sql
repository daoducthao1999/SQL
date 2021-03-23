--Bai 1
--cau 1
create trigger cau1 on DIEM
for insert, update as
begin
	declare @toan float, @ly float, @hoa float, @van float
	select @toan = toan, @ly = ly, @hoa = hoa, @van = van from inserted
	if((@toan not between 0 and 10) or 
		(@ly not between 0 and 10) or
		(@hoa not between 0 and 10) or
		(@van not between 0 and 10)) 
		begin
			raiserror('Ban phai nhap gia tri trong khoang tu 0 den 10',16,1)
			rollback transaction
		end
end

drop trigger cau1

--cau 2

create trigger cau2 on DIEM
for insert, update as
begin
	declare @mahs nvarchar(5), @dtb float
	select @mahs = mahs, @dtb = ((toan + van)*2+ly+hoa)/6 from inserted
	update DIEM set dtb = @dtb where MAHS = @mahs
end

drop trigger cau2

--cau 3

create trigger cau3 on DIEM
for insert, update as
begin
	declare @mahs nvarchar(5), @dtb float, @xeploai nvarchar(50)
	select @mahs = mahs, @dtb = ((toan+van)*2+ly+hoa)/6 from inserted
	if(@dtb < 5) set @xeploai = N'Lưu ban'
	else set @xeploai = N'Lên lớp'
	update DIEM set DTB = @dtb, XepLoai = @xeploai where MAHS = @mahs
end

drop trigger cau3

--cau 4

create trigger cau4 on DIEM
for insert, update as 
begin
	declare @mahs nvarchar(5), @toan float, @ly float, @hoa float,
			@van float, @dtb float, @xeploai nvarchar(50), @dtn float
	select @mahs = mahs, @toan = toan, @ly = ly, @hoa = hoa, @van = van from inserted
	if( @toan <= @hoa and @toan <= @ly and @toan <= @van)	 set @dtn = @toan
	else if(@van <= @toan and @van <= @ly and @van <= @hoa)  set @dtn = @van
	else if(@hoa <= @toan and @hoa <= @ly and @hoa <= @van)  set @dtn = @hoa 
	else													 set @dtn = @ly

	set @dtb = ((@toan+@van)*2+@ly+@hoa)/6

	if(@dtn >= 4 and @dtb >=5) set @xeploai = N'Lên lớp'
	else set @xeploai = N'Lưu ban'
	update DIEM set DTB= @dtb, XepLoai = @xeploai where MAHS=@mahs
end

drop trigger cau4

--cau 5
create trigger cau5 on dshs
for delete as
begin
	declare @mahs nvarchar(5)
	select @mahs = mahs from deleted
	delete from DIEM where MAHS = @mahs
end

drop trigger cau5

--cau 6
create proc cau6 @mahs nvarchar(5)
as
begin
	update DSHS set GhiChu = N'Chuyển trường từ ngày 5/9/2016'
	where MAHS = @mahs
end

exec cau6 '00031'

drop proc cau6

--cau 7
create view cau7
as
select DIEM.MAHS,ho + ten as hoten,NGAYSINH,
		case when NU = 'true'
			then N'Nam'
			else N'Nữ'
		end as GioiTinh,TOAN,LY,HOA,VAN,DTB,XepLoai
from DIEM,DSHS where DIEM.MAHS = DSHS.MAHS

select * from cau7

drop view cau7

--cau 8

create procedure cau8 as
begin
	declare contro cursor for select MAHS, TOAN, LY, HOA, VAN  from DIEM
	open contro
	declare @mahs nvarchar(5), @dtn float, @toan float, @ly float, @hoa float, @van float
	fetch next from contro into @mahs, @toan, @ly, @hoa, @van
	while(@@FETCH_STATUS = 0)
	begin
		if( @toan <= @hoa and @toan <= @ly and @toan <= @van)	 set @dtn = @toan
		else if(@van <= @toan and @van <= @ly and @van <= @hoa)  set @dtn = @van
		else if(@hoa <= @toan and @hoa <= @ly and @hoa <= @van)  set @dtn = @hoa
		else													 set @dtn = @ly

		update DIEM set DTN = @dtn where MAHS = @mahs
		fetch next from contro into @mahs, @toan, @ly, @hoa, @van
	end
	close contro
	deallocate contro
end

exec cau8

drop proc cau8

--cau 9

create trigger cau9 on DIEM
for insert,update as
begin
	declare @mahs nvarchar(5), @toan float, @ly float, @hoa float, @van float,@dtn float
	select @mahs = MAHS, @toan = TOAN, @ly = LY, @hoa = HOA, @van = VAN from inserted

	if( @toan <= @hoa and @toan <= @ly and @toan <= @van)	 set @dtn = @toan
	else if(@van <= @toan and @van <= @ly and @van <= @hoa)  set @dtn = @van
	else if(@hoa <= @toan and @hoa <= @ly and @hoa <= @van)  set @dtn = @hoa 
	else													 set @dtn = @ly

	update DIEM set DTN = @dtn where MAHS = @mahs
end

drop trigger cau9

--cau 10
create view cau10 as
select Lop,DIEM.MaHS,ho + ten as HoTen,YEAR(ngaysinh) as NamSinh,
	case when NU = 'true'
			 then N'Nữ'
			 else N'Nam'
	end as GioiTinh,
	TOAN,LY,HOA,VAN,
	case when TOAN <= LY and TOAN <= HOA and TOAN <= VAN then TOAN
		 when HOA <= TOAN and HOA <= LY and HOA <= VAN then HOA
		 when LY <= TOAN and LY <= HOA and LY <= VAN then LY
		 when VAN <= TOAN and VAN <= HOA and VAN <= LY then VAN
	end as DTN,
	DTB 
from DIEM,DSHS where DIEM.MAHS = DSHS.MAHS and DTB >= 8.5 
					and TOAN >= 8 and LY >= 8 and HOA >= 8 and VAN >= 8

select * from cau10

drop view cau10

--cau 11

create view cau11 as
select LOP, DSHS.MAHS, HO + TEN as HoTen, YEAR(NGAYSINH) as NamSinh, NU, TOAN, LY, HOA, VAN, DTB
from DSHS, DIEM 
where DSHS.MAHS = DIEM.MAHS and DTB in (select MAX(DTB) from DIEM)

select * from cau11

drop view cau11
--------------------------------------------------------------------------------------------------

--bai 2
--cau 1

create view cau1 as
select tChiTietKH.MaDK, LoaiKH, TenKH, NgaySinh, Phai, DiaChi, DienThoai, SoPhong,
		LoaiPhong, NgayVao, DATEDIFF(DD, NgayVao, NgayRa) as SoNgayO
from tChiTietKH, tDangKy
where tChiTietKH.MaDK = tDangKy.MaDK

select * from cau1

drop view cau1

--cau2

create function cau2(@ngayvao datetime)
returns table
as
return 
	(
		select tChiTietKH.MaDK, LoaiKH, TenKH, NgaySinh, Phai, DiaChi, DienThoai, SoPhong,
		LoaiPhong, NgayVao, DATEDIFF(DD, NgayVao, NgayRa) as SoNgayO
		from tChiTietKH, tDangKy
		where tChiTietKH.MaDK = tDangKy.MaDK and @ngayvao = NgayVao
	)

select * from cau2(cast('1998-04-26T00:00:00.000' as datetime))

drop function cau2

--cau 3

select MaDK, tDangKy.LoaiPhong, DATEDIFF(DD, NgayVao, NgayRa) as SoNgayO,
	case when DATEDIFF(DD, NgayVao, NgayRa) < 10 then DonGia * DATEDIFF(DD, NgayVao, NgayRa)
		 when DATEDIFF(DD, NgayVao, NgayRa) >= 30 then DonGia * DATEDIFF(DD, NgayVao, NgayRa) * 0.9
		 else DonGia * DATEDIFF(DD, NgayVao, NgayRa) * 0.95
	end as ThucThu
from tDangKy, tLoaiPhong
where tDangKy.LoaiPhong = tLoaiPhong.LoaiPhong

--cau 4








-------------------------------
--bai 3
--cau 2

create view cau2 as
select SoXe, ChiTietVanTai.MaLoTrinh, SoLuongVT, NgayDi, NgayDen,
	case when DATEDIFF(DD, NgayDi, NgayDen) = 0 then 1
		 else DATEDIFF(DD, NgayDi, NgayDen)
	end as ThoiGianVT,
	case when SoLuongVT > TrongTaiQD then SoLuongVT * DonGia * 1.05
		 else SoLuongVT * DonGia
	end as CuocPhi,
	case when DATEDIFF(DD, NgayDi, NgayDen) > ThoiGianQD
			and SoLuongVT > TrongTaiQD then 0.05 * SoLuongVT * DonGia * 1.05
		 when DATEDIFF(DD, NgayDi, NgayDen) > ThoiGianQD
			and SoLuongVT <= TrongTaiQD then  0.05 * SoLuongVT * DonGia
		 else 0
	end as Thuong	 
from ChiTietVanTai, LoTrinh, TrongTai
where ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
	and ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai

select * from cau2

drop view cau2

--cau 3

create view cau3 as
select SoXe, TenLoTrinh, SoLuongVT, NgayDi, NgayDen,
	case when SoLuongVT > TrongTaiQD then SoLuongVT * DonGia * 1.05
		 else SoLuongVT * DonGia
	end as CuocPhi
from ChiTietVanTai, LoTrinh, TrongTai
where ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
	and ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai

select * from cau3

drop view cau3

--cau 4

create view cau4 as
select SoXe, ChiTietVanTai.MaTrongTai, SoLuongVT, TrongTaiQD, NgayDi, NgayDen
from ChiTietVanTai, LoTrinh, TrongTai
where ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
	and ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
	and SoLuongVT > TrongTaiQD

select * from cau4 

drop view cau4

--cau 5

create function cau5(@maLoTrinh nvarchar(255))
returns table
as
return 
	(
		select SoXe, TenLoTrinh, SoLuongVT, TrongTaiQD, NgayDi, NgayDen
		from ChiTietVanTai, LoTrinh, TrongTai
		where ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
			and ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
			and LoTrinh.MaLoTrinh = @maLoTrinh
	)

select * from cau5('HN')

drop function cau5

--cau 6

create function cau6(@soXe nvarchar(255))
returns table
as
return
	(
		select LoTrinh.MaLoTrinh, TenLoTrinh, DonGia, ThoiGianQD
		from LoTrinh, ChiTietVanTai
		where LoTrinh.MaLoTrinh = ChiTietVanTai.MaLoTrinh
			and @soXe = ChiTietVanTai.SoXe
	)

select * from cau6('333')

drop function cau6

--cau 7

create trigger cau7 on ChiTietVanTai
for insert, update as
begin
	declare @maVT int, @soLuongVanTai int, @donGia int, @trongTaiQD int, @thanhTien float
	select @maVT = MaVT, @soLuongVanTai = SoLuongVT, @donGia = DonGia, @trongTaiQD = TrongTaiQD
	from inserted, LoTrinh, TrongTai
	where inserted.MaLoTrinh = LoTrinh.MaLoTrinh
		and inserted.MaTrongTai = TrongTai.MaTrongTai

	if(@soLuongVanTai > @trongTaiQD) set @thanhTien = @soLuongVanTai * @donGia * 1.05
	else set @thanhTien = @soLuongVanTai * @donGia

	update ChiTietVanTai set ThanhTien = @thanhTien where MaVT = @maVT
end

drop trigger cau7

--cau 8

create procedure cau8 @maLoTrinh nvarchar(255), @namVanTai int, @soTien float output
as begin	
		select @soTien = SUM(ThanhTien)
		from ChiTietVanTai
		where MaLoTrinh = @maLoTrinh and YEAR(NgayDi) = @namVanTai
end

--cau 9
create procedure cau9 @soXe nvarchar(255), @namVanTai int, @soTien float output
as begin	
		select @soTien = SUM(ThanhTien)
		from ChiTietVanTai
		where SoXe = @soXe and YEAR(NgayDi) = @namVanTai
end
