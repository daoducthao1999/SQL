--C�c c�u l?nh trigger
--C�u 1: T?o trigger t? ??ng c?p nh?t Th�nh ti?n v�o b?ng ChiTietHDB m?i khi th�m m?i hay c?p nh?t s? l??ng b�n.

create trigger cau1 on ChiTietHDB
for insert, update 
as
begin
	declare @sohdb nchar(10), @thanhtien float
	select @sohdb= sohdb, @thanhtien= soluong* from inserted 