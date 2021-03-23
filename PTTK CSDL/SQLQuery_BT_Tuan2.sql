								--BAI 1
--cau1:

create trigger tg1 on diem 
for insert,update 
as
begin 
declare @mahs nvarchar(5),@toan float,@ly float, @hoa float, @van float 
select @mahs = mahs,@toan = toan, @ly=ly, @hoa=hoa, @van=van from inserted
update DIEM set toan= @toan, hoa=@hoa, van=@van, ly=@ly where mahs = @mahs
if (@toan <0 or @toan >10 or @ly <0 or @ly >10 or @hoa <0 or @hoa >10 or @van <0 or @van >10)
rollback tran
end 


--cau2, cau3:
create trigger tg2 on diem 
for insert,update 
as
begin 
declare @mahs nvarchar(5),@dtb float,@xl nvarchar(30)
select @mahs = mahs,@dtb = ((toan + van )*2 +ly+hoa)/6 from inserted
update Diem set DTB = @dtb where mahs = @mahs
if @dtb >= 5
	set @xl = 'len lop'
if @dtb <5 
	set @xl = 'luu ban'
update Diem set [XEP LOAI]  = @xl where mahs = @mahs
end

--cau4:
create trigger tg4 on diem 
for insert,update 
as
begin 
declare @mahs nvarchar(5),@dtb float,@dtn float,@toan float,@van float,@ly float,@hoa float,@xl nvarchar(30)
select @mahs = mahs,@dtb = ((toan + van )*2 +ly+hoa)/6, @toan=toan,
		@ly=ly, @hoa=hoa, @van=van from inserted
update Diem set DTB = @dtb where mahs = @mahs
if (@toan<=@van and @toan<=@ly and @toan<=@hoa) set @dtn= @toan
if (@van<=@toan and @van<=@ly and @van<=@hoa) set @dtn=@van
if (@ly<=@toan and @ly<=@van and @ly<=@hoa) set @dtn=@ly
if (@hoa<=@toan and @hoa<=@van and @hoa<=@ly) set @dtn=@hoa
if @dtb >= 5 and @dtn>=4
	set @xl = 'len lop'
else
	set @xl = 'luu ban'
update Diem set [XEP LOAI]  = @xl where mahs = @mahs
end

--cau5:
create trigger tg5 on DSHS
for delete
as
begin
declare @mahs nvarchar(5)
select @mahs=MAHS from deleted
delete from DIEM where MAHS=@mahs
end

--cau6:
create procedure sp6 @mahs nvarchar(5)
as
begin
update DSHS set DSHS.CHUTHICH = 'Chuyen truong tu ngay 5/9/2016' 
where MAHS=@mahs
end
exec sp6 '00002'

--cau7:
create VIEW view7
AS
SELECT DIEM.MAHS, DSHS.HO + DSHS.TEN as HoTen, DSHS.NGAYSINH,DSHS.NU, DIEM.TOAN, 
DIEM.LY, DIEM.HOA, ((TOAN+VAN)*2+LY+HOA)/6 as DTB, DIEM.[XEP LOAI]
FROM DIEM, DSHS
WHERE DIEM.MAHS = DSHS.MAHS

--cau8:
Declare sv8 cursor for select MAHS, DTN from DIEM
Open sv8
Declare @id nvarchar(5), @dtn float
Fetch next from sv8 into @id, @dtn
While (@@fetch_status = 0)
begin
declare @toan float, @ly float, @hoa float, @van float
select @toan = toan, @van = van, @ly=ly, @hoa=hoa from DIEM
where @id = MAHS
if (@toan<=@van and @toan<=@ly and @toan<=@hoa) set @dtn= @toan
if (@van<=@toan and @van<=@ly and @van<=@hoa) set @dtn=@van
if (@ly<=@toan and @ly<=@van and @ly<=@hoa) set @dtn=@ly
if (@hoa<=@toan and @hoa<=@van and @hoa<=@ly) set @dtn=@hoa
update DIEM set DTN=@dtn where MAHS=@id
Fetch next from sv8 into @id,@dtn
end
Close sv8; Deallocate sv8

--cau9:
create trigger tg9 on diem
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

--cau10toan>=8 and ly>=8 and hoa>=8 and van>=8
create VIEW view10
AS
SELECT DSHS.LOP,DSHS.MAHS, DSHS.HO + DSHS.TEN as HoTen, DSHS.NGAYSINH,DSHS.NU, DIEM.TOAN, 
DIEM.LY, DIEM.HOA, ((TOAN+VAN)*2+LY+HOA)/6 as DTB, DTN
FROM DIEM, DSHS
WHERE DIEM.MAHS = DSHS.MAHS and DTN>=8

--cau11:
create VIEW view11
AS
SELECT DIEM.MAHS, DSHS.HO + DSHS.TEN as HoTen, DSHS.NGAYSINH,DSHS.NU, DIEM.TOAN, 
DIEM.LY, DIEM.HOA, ((TOAN+VAN)*2+LY+HOA)/6 as DTB
FROM DIEM, DSHS
WHERE DIEM.MAHS = DSHS.MAHS and DTB= (select MAX(DTB) from DIEM)

select * from view11
								--BAI 2

-- cau1:
create view view1 
as 
select tChiTietKH.madk,loaikh, TenKH, NgaySinh, Phai, DiaChi, DienThoai, sophong, loaiphong, ngayvao, NgayO = cast ((ngayra-ngayvao) as int)
from tChiTietKH, tDangKy
where tChiTietKH.madk = tDangKy.MaDK

--cau2:
create procedure sp2 @ngayvao datetime
as
begin
select tChiTietKH.madk,loaikh, TenKH, NgaySinh, Phai, DiaChi, DienThoai, sophong, loaiphong, ngayvao, NgayO = cast ((ngayra-ngayvao) as int)
from tChiTietKH, tDangKy
where tChiTietKH.madk = tDangKy.MaDK and year (@ngayvao) =1999 and NgayVao=@ngayvao
end

exec sp2 '01-01-1999'

--cau3:

use BT2
create table tDoanhThu
(
	MaDK nvarchar(3),
	LoaiPhong nvarchar(2),
	SoNgayO int,
	ThucThu int,
)

--cau4:
create trigger tg44 on tDangKy
for insert, update
as
begin
declare @madk nvarchar(3), @loaiphong nvarchar(1),
@ngayo int, @ngayvao datetime, @ngayra datetime, @dongia int, @thucthu int

select @madk = MaDK, @loaiphong= tLoaiPhong.LoaiPhong, @ngayvao=NgayVao, @ngayra=NgayRa,
@ngayo= cast ((@ngayra-@ngayvao) as int), @dongia=DonGia from inserted, tLoaiPhong
if @ngayo<10
	set @thucthu = @ngayo*@dongia
else if @ngayo>=30
	set @thucthu = @ngayo*@dongia*0.9
else
	set @thucthu = @ngayo*@dongia*0.95
update tDoanhThu set MaDK= @madk, LoaiPhong= @loaiphong, NgayO= @ngayo, ThucThu=@thucthu
end
								--BAI 3

--cau2: thieu
create view view2
as
select SoXe, MaLoTrinh, SoLuongVT, NgayDi, NgayDen , ThoiGianVanTai= cast ((NgayDen-NgayDi) as int)
from ChiTietVanTai

select * from view2


--cau3: thieu
create view view3
as
select SoXe, TenLoTrinh, SoLuongVT, NgayDi, NgayDen
from ChiTietVanTai, LoTrinh
where ChiTietVanTai.MaLoTrinh= LoTrinh.MaLoTrinh

select * from view3

--cau4
create view view4
as
select SoXe, TenLoTrinh, SoLuongVT,TrongTaiQD, NgayDi, NgayDen
from ChiTietVanTai, LoTrinh, TrongTai
where ChiTietVanTai.MaLoTrinh= LoTrinh.MaLoTrinh and ChiTietVanTai.MaTrongTai=TrongTai.MaTrongTai
and SoLuongVT> TrongTaiQD

select * from view4

--cau5:
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
create trigger tg77 on ChiTietVanTai
for insert, update
as
begin
declare @mavt int, @slvt int, @dongia int, @taitrongQD int, @thanhTien money
select @mavt = MaVT,@slvt=SoLuongVT, @dongia=DonGia, @taitrongQD=TrongTaiQD from inserted, LoTrinh, TrongTai
if @slvt> @taitrongQD
	set @thanhTien=@slvt*@dongia*105/100
else
	set @thanhTien=@slvt*@dongia

update ChiTietVanTai set ThanhTien=@thanhTien where MaVT=@mavt
end

--cau8:
--cau9: