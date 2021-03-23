create trigger ex0001 on DIEM
for insert, update
as 
begin
	declare @mahs nvarchar(5),
			@dt float
	select @mahs = MAHS, @dt = TOAN from inserted 
	if @dt < 0 or @dt >10
	rollback tran
end


create trigger Cau4Bai2 on tDangKy
for insert , update
as
begin
declare @madk nvarchar(3), @songayo int, @loaiphong nvarchar(2), @thucthu float, @dongia int, @demxem int
select @madk=MaDK, @songayo=DATEDIFF(dd, ngayvao, ngayra), @loaiphong=LoaiPhong from inserted

if @songayo=0 
set @songayo=1
select @dongia=DonGia from tLoaiPhong where LoaiPhong=@loaiphong

if @songayo<10
set @thucthu=@dongia*@songayo
else if @songayo<30
set @thucthu=@dongia*@songayo*0.95
else set @thucthu=@dongia*@songayo*0.9
select @demxem=count(MaDK) from tDoanhThu group by MaDK having madk=@madk

IF @demxem>=1
update tDoanhThu set loaiphong=@loaiphong, songayo=@songayo,ThucThu= @thucthu where madk=@madk
else
insert tDoanhThu (MaDk, LoaiPhong, SoNgayO, ThucThu) values (@madk, @loaiphong, @songayo, @thucthu)
end


select * from dbo.tDangKy
