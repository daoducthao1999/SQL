--cau2
create proc cau2_1 @ngayban datetime, @sohang int output 
as
begin
	select @sohang=count(MaSP) from Hoadon,ChiTietHD
	where Hoadon.MaHD=ChiTietHD.MaHD and Ngayban=@ngayban
end

declare @sl int
exec cau2_1 '2015-03-16 00:00:00.000', @sl output
print @sohang
--cau2_nghia
create proc sp1 @ngay datetime, @dem int output
as
begin
select @dem=COUNT(MaSP) from Hoadon, ChiTietHD
where Hoadon.MaHD = ChiTietHD.MaHD
end

--cau3
create function cau3(@maKH nvarchar(5), @nam int)
returns @btap table(maKH nvarchar(5), maHD nvarchar(5), ngaymua datetime)
as
begin
insert into @btap select MaKH,Hoadon.MaHD,Ngayban
from Hoadon
where MaKH=@maKH and year(Ngayban)=@nam
return 
end

drop function cau3
select * from cau3('0003',2015)

--Cau3_nghia
create function f3( @makh nvarchar(5), @nam int)
returns table
as return
(
select MaKH, Hoadon.MaHD, Ngayban,TongTien=SUM(SLBan*GiaSP)  from Hoadon, ChiTietHD, SanPham
where Hoadon.MaHD=ChiTietHD.MaHD and ChiTietHD.MaSP=SanPham.MaSP and MaKH = @makh and YEAR(Ngayban)=@nam
group by MaKH, Hoadon.MaHD, Ngayban
)

drop function f3
select * from f3('0002',2015)

--cau4
create view thongke 
as
select SanPham.MaSP, SanPham.TenSP, Soluongnhap=Sum(ChiTietHDN.SLN), Soluongban=Sum(ChiTietHD.SlBan), Ton=(Sum(ChiTietHDN.SLN)-Sum(ChiTietHD.SlBan)) 
from ChiTietHD, ChiTietHDN,SanPham,Hoadon
where ChiTietHD.MaSP=ChiTietHDN.MaSP and ChiTietHD.MaSP=SanPham.MaSP and Hoadon.MaHD=ChiTietHD.MaHD and YEAR(Hoadon.Ngayban) =2015
group by SanPham.MaSP, SanPham.TenSP

drop view thongke
select * from thongke 

--cau4_nghia
alter view view4
as
select SanPham.MaSP, TenSP, SoLuongNhap= SUM(SLN), SoLuongBan= SUM(SlBan), Ton = SUM(SLN)-SUM(SlBan)
from ChiTietHD, ChiTietHDN, SanPham
where ChiTietHD.MaSP=SanPham.MaSP and SanPham.MaSP=ChiTietHDN.MaSP
group by SanPham.MaSP, TenSP


--cau5_nghia
alter trigger tg5 on ChiTietHD
for insert, update
as
begin
declare @mahd nvarchar(5), @slban int
select @mahd=MaHD from inserted
select @slban=Sum(SLBan) from ChiTietHD
update Hoadon set SoLuongHangMua = @slban where MaHD=@mahd
end
--Cau5
 create trigger them on ChiTietHD
 for insert, update
 as
 begin
 declare @mahd nvarchar(5), @slban int
 select @mahd=MaHD from inserted
 select @slban=sum(SlBan) from ChiTietHD
 update Hoadon set SoLuong =@slban where MaHD=@mahd
 end

