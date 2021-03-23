--Bài1
--câu1
create trigger Bai1_ex1 on DIEM
for insert , update as
begin
	declare @toan float, @ly float, @hoa float, @van float
	select @toan= toan, @ly=ly, @hoa= hoa, @van= van from inserted
	if ((@toan not between 0 and 10) or 
		(@ly not between 0 and 10) or
		(@hoa not between 0 and 10)or
		(@van not between 0 and 10))
		begin 
			raiserror('Ban phai nhap gia tri trong khoang tu 0 den 10',16,1)
			rollback transaction
		end
end

drop trigger Bai1_ex1

--cau2

create trigger Bai1_ex2 on DIEM
for insert, update as
begin
	declare @mahs nvarchar(5), @dtb float
	select @mahs = mahs, @dtb=((toan+van)*2 +ly+hoa)/6 from inserted
	update DIEM set dtb = @dtb where MAHS = @mahs
end

drop trigger Bai1_ex2

--cau3

create trigger Bai1_ex3 on DIEM
for insert, update as
begin
	declare @mahs nvarchar(5), @dtb float, @xeploai nvarchar(50)
	select @mahs = mahs, @dtb=((toan+van)*2 +ly+hoa)/6 from inserted
	if(@dtb <5) set @xeploai=N'Luu ban'
	else set @xeploai=N'Len lop'
	update DIEM set DTB= @dtb, XEPLOAI=@xeploai where MAHS=@mahs
end

drop trigger Bai1_ex3

--cau4

create trigger Bai1_ex4 on DIEM
for insert, update as
begin
	declare @mahs nvarchar(5), @toan float, @ly float, @hoa float, @van float, @dtb float, @xeploai nvarchar(50), @dtn float
	select @mahs = mahs, @toan = toan, @ly=ly, @hoa=hoa, @van=van from inserted
	if( @toan <= @hoa and @toan <= @ly and @toan <= @van)	 set @dtn = @toan
	else if(@van <= @toan and @van <= @ly and @van <= @hoa)  set @dtn = @van
	else if(@hoa <= @toan and @hoa <= @ly and @hoa <= @van)  set @dtn = @hoa 
	else													 set @dtn = @ly
	set @dtb = ((@toan+@van)*2+@ly+@hoa)/6
	if (@dtn>=4 and @dtb >=5) set @xeploai=N'Len lop'
	else set @xeploai=N'Luu ban'
	update DIEM set DTB = @dtb, XEPLOAI = @xeploai where MAHS=@mahs
end

drop trigger Bai1_ex4

--cau5

create trigger Bai1_ex5 on DSHS
for delete as 
begin
	declare @mahs nvarchar(5)
	select @mahs = mahs from deleted
	delete from DIEM where MAHS= @mahs
end

drop trigger Bai1_ex5

--cau6
create proc Bai1_ex6 @mahs nvarchar(5)
as
begin
	update DSHS set GhiChu = N'Chuyển trường từ ngày 5/9/2016'
	where MAHS = @mahs
end

exec Bai1_ex6 '00031'

drop proc Bai1_ex6

--cau7
create view Bai1_ex7
as
select DIEM.MAHS, ho + ten as hoten, NGAYSINH,
				case when NU = 'true'
					then N'Nam'
					else N'Nu'
				end as GioiTinh, TOAN, LY, HOA, VAN, DTB, XEPLOAI
from DIEM, DSHS where DIEM.MAHS=DSHS.MAHS

select * from Bai1_ex7

drop view Bai1_ex7

--cau8

create procedure Bai1_ex8 as
begin
	declare contro cursor for select MAHS, TOAN, LY, HOA, VAN from DIEM
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

exec Bai1_ex8

drop proc Bai1_ex8

--cau9
create trigger Bai1_ex9 on diem
for insert, update
as
begin
	declare @mahs nvarchar(5), @dtn float,@toan float,@van float,@ly float,@hoa float
	select @mahs = mahs, @toan=toan,@ly=ly, @hoa=hoa, @van=van from inserted
	if (@toan<=@van and @toan<=@ly and @toan<=@hoa) set @dtn= @toan
	if (@van<=@toan and @van<=@ly and @van<=@hoa) set @dtn=@van
	if (@ly<=@toan and @ly<=@van and @ly<=@hoa) set @dtn=@ly
	if (@hoa<=@toan and @hoa<=@van and @hoa<=@ly) set @dtn=@hoa
	update DIEM set DTN = @dtn where MAHS = @mahs
end

drop trigger Bai1_ex9

--cau10

create view Bai1_ex10 as
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

select * from Bai1_ex10

drop view Bai1_ex10

--cau11:
create view Bai1_ex11
as
	select DIEM.MAHS, DSHS.HO + DSHS.TEN as HoTen, DSHS.NGAYSINH,DSHS.NU, DIEM.TOAN, 
	DIEM.LY, DIEM.HOA, ((TOAN+VAN)*2+LY+HOA)/6 as DTB
	from DIEM, DSHS
	where DIEM.MAHS = DSHS.MAHS and DTB= (select MAX(DTB) from DIEM)

select * from Bai1_ex11

drop view Bai1_ex11
							------------------------------------------
--Bai2
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
create trigger tg44 on tDangKy
for insert, update
as
begin
declare @madk nvarchar(3), @loaiphong nvarchar(1),
@ngayo int, @ngayvao datetime, @ngayra datetime, @dongia int, @thucthu int, @dem int
select @madk = MaDK, @loaiphong= tLoaiPhong.LoaiPhong, @ngayvao=NgayVao, @ngayra=NgayRa,
@ngayo= cast ((@ngayra-@ngayvao) as int), @dongia=DonGia from inserted, tLoaiPhong

if @ngayo=0 
set @ngayo=1

if @ngayo<10
	set @thucthu = @ngayo*@dongia
else if @ngayo>=30
	set @thucthu = @ngayo*@dongia*0.9
else
	set @thucthu = @ngayo*@dongia*0.95

select @dem=count(MaDK) from tDoanhThu group by MaDK having madk=@madk
IF @dem>=1
update tDoanhThu set loaiphong=@loaiphong, songayo=@ngayo,ThucThu= @thucthu where madk=@madk
else
insert tDoanhThu (MaDk, LoaiPhong, SoNgayO, ThucThu) values (@madk, @loaiphong, @ngayo, @thucthu)
end
							------------------------------------------
--Bai3
--cau2
create view view2
as
select SoXe,LoTrinh.MaLoTrinh, SoLuongVT, NgayDi, NgayDen,
iif(datediff(dd,ngaydi, ngayden)=0, 1,datediff(dd,ngaydi, ngayden)) as thoigianvt,
iif(soluongvt>trongtaiqd, SoLuongVT*dongia*105/100, soluongvt*dongia) as cuocphi,
iif(iif(datediff(dd,ngaydi, ngayden)=0, 1,datediff(dd,ngaydi, ngayden)) >thoigianqd, 
iif(soluongvt>trongtaiqd, SoLuongVT*dongia*105/100, soluongvt*dongia)*5/100, 0) as thuong
from ChiTietVanTai, LoTrinh, TrongTai
where ChiTietVanTai.MaLoTrinh= LoTrinh.MaLoTrinh and TrongTai.MaTrongTai= ChiTietVanTai.MaTrongTai

select * from view2

drop view view2
--cau3
create view cau3 as
	select SoXe, TenLoTrinh, SoLuongVT, NgayDi, NgayDen, 
		case when SoLuongVT > TrongTaiQD then SoLuongVT *DonGia*1.05
			else SoLuongVT * DonGia end as CuocPhi
	from ChiTietVanTai, LoTrinh, TrongTai
	where ChiTietVanTai.MaLoTrinh=LoTrinh.MaLoTrinh 
	and ChiTietVanTai.MaTrongTai= TrongTai.MaTrongTai

select * from cau3
drop view cau3

--cau4
create view cau4 as
	select SoXe, ChiTietVanTai.MaTrongTai, SoLuongVT, TrongTaiQD,NgayDi, NgayDen
	from ChiTietVanTai, LoTrinh, TrongTai
	where ChiTietVanTai.MaLoTrinh=LoTrinh.MaLoTrinh 
	and ChiTietVanTai.MaTrongTai= TrongTai.MaTrongTai
	and SoLuongVT>TrongTaiQD

select *from cau4

drop view cau4

--cau5
create procedure sp5 @lotrinh nvarchar(255)
as
begin
select SoXe, MaTrongTai, SoLuongVT, NgayDi, NgayDen from ChiTietVanTai
where MaLoTrinh = @lotrinh
end

--cau6:
create function f6(@soxe nvarchar(255))
returns Table
as
return
(select MaVT, MaTrongTai, MaLoTrinh, SoLuongVT, NgayDi, NgayDen from ChiTietVanTai
	where SoXe = @soxe
)

--cau7:
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

create procedure sp888 @malotrinh nvarchar(255), @namvt int
as
begin
select MaLoTrinh, SUM(ThanhTien) as Tong from ChiTietVanTai
where MaLoTrinh=@malotrinh and year (NgayDi) = @namvt
group by MaLoTrinh
end

exec sp888 'PK', 2014


--cau 9
create procedure cau9 @soXe nvarchar(255), @namVanTai int, @soTien float output
as begin	
		select @soTien = SUM(ThanhTien)
		from ChiTietVanTai
		where SoXe = @soXe and YEAR(NgayDi) = @namVanTai
end


