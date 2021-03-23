--Bai7
--Cau3
alter proc thanhtoan @sohd nvarchar(5), @tongtien int output
as
begin
select @tongtien=SUM(soluong*giaban) from [tbl Chi Tiet Hoa Don]
where MaHD=@sohd
group by MaHD
end

declare @tongtien int
exec thanhtoan '10144', @tongtien output
print @tongtien

--cau4
create view QuaTang 
as 
select
      [tbl Chi Tiet Hoa Don].MaHD, MaKH, NgayLapHD, MaSp, Soluong, Giaban,(Soluong*giaban) as ThanhTien,
	  iif((Soluong*giaban)>=500 and soluong>=35, 0.1, 0) as Giamgia, 
	  (cast(cast((Soluong*giaban)as int)/1000 as varchar) +' vé')as Quatang
from [tbl Chi Tiet Hoa Don],[tbl Hoa Don]
where [tbl Chi Tiet Hoa Don].MaHD=[tbl Hoa Don].MaHD

select * from QuaTang

--cau5
create view doanhso as
select MONTH(NgayLapHD) as thang, YEAR(NgayLapHD) as nam,
		sum(SoLuong*GiaBan) as doanhthu
 from [tbl Chi Tiet Hoa Don], [tbl Hoa Don]
 where [tbl Chi Tiet Hoa Don].MaHD=[tbl Hoa Don].MaHD
 group by MONTH(NgayLapHD), YEAR(NgayLapHD)

 select * from doanhso

 --Cau6
create proc tongket @ngay date, @sohd int output, @doanhthu money output
as
begin
select @sohd=COUNT(MaHD) from [tbl Hoa Don]
where DATEDIFF(DAY,@ngay,NgayLapHD)=0
select @doanhthu=sum(SoLuong*GiaBan) from [tbl Hoa Don], [tbl Chi Tiet Hoa Don]
where [tbl Hoa Don].MaHD=[tbl Chi Tiet Hoa Don].MaHD
AND DATEDIFF(DAY,@ngay,NgayLapHD)=0
end

declare @a int, @b money
exec tongket '1997-01-06',@a output, @b output
print @a
print @b
--cau7
create function thongtin(@mahd nvarchar(10))
returns table
as
return(
	select *,
		SoLuong*GiaBan as Thanhtien
	 from [tbl Chi Tiet Hoa Don]
	 where MaHD=@mahd
)

select * from thongtin('10144')

--Bai8

--cau3
create function f3 (@nam int)
returns int
as
begin
declare @sonv int
select @sonv = COUNT(MaNV) from [NHAN VIEN]
where year(NTNS) = @nam
return @sonv
end

--cau4
create view Phucap as
select [NHAN VIEN].MaNV, Ho, Ten, ChucVu,
		DATEDIFF(YEAR,NgayBD,getdate()) as ThamNien,
		HSLuong*250000 as Luong,
		case when DATEDIFF(day,NTNS,'1975-04-30')>0 then 150000
			 else 0 end as TroCap,
		case when DATEDIFF(year,NgayBD,GETDATE())<5 then 0
			 else FLOOR((DATEDIFF(year,NgayBD,GETDATE())-4)*50000) end as PhuCapTN
from [NHAN VIEN],[CHI TIET]
where [NHAN VIEN].MaNV=[CHI TIET].MaNV

select * from Phucap

--Cau 5:
create function f5 (@chuc nvarchar(3))
returns table
as return(
select [NHAN VIEN].MaNV, ho+' '+ten as HoTen from [NHAN VIEN], [CHI TIET]
where [NHAN VIEN].MaNV=[CHI TIET].MaNV and ChucVu=@chuc
)

--Cau 6:
create function f6()
returns table
as return(
select [NHAN VIEN].MaNV, ho+' '+ten as HoTen from [NHAN VIEN], [CHI TIET]
where [NHAN VIEN].MaNV=[CHI TIET].MaNV and DATEDIFF(year,NgayBD,GETDATE())/3=0
)

--cau7
create function chuc(@chucvu nvarchar(3)) returns table
as
return(
select [NHAN VIEN].MaNV, HO, TEN, PHAI, NTNS,NgayBD, MaPB from [NHAN VIEN], [CHI TIET]
where ChucVu=@chucvu
and [NHAN VIEN].MaNV=[CHI TIET].MaNV
)

select * from chuc('NV')

--Cau8
create function tangluong(@ngay date) returns table
as
return(
select * from [NHAN VIEN]
where DATEDIFF(year,NgayBD,@ngay)%3=0
and DATEDIFF(day,NgayBD,@ngay)=0
)

select * from tangluong(getdate())