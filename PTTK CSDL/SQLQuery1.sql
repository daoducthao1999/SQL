--Các câu l?nh trigger
--Câu 1: T?o trigger t? ??ng c?p nh?t Thành ti?n vào b?ng ChiTietHDB m?i khi thêm m?i hay c?p nh?t s? l??ng bán.

create trigger cau1 on ChiTietHDB
for insert, update 
as
begin
	declare @sohdb nchar(10), @thanhtien float
	select @sohdb= sohdb, @thanhtien= soluong* from inserted 