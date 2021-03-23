create trigger ex002 on DIEM
for insert, update
as
begin
	declare @mahs nvarchar(5), @dtb float
	declare @x1 nvarchar(50)
	select @mahs=MAHS, @dtb=((TOAN + VAN)*2 + Ly + Hoa)/6 from inserted
	update DIEM set DTB = @dtb
	where MAHS=@mahs
	if(@dtb>=5)
		set @x1='lên l?p'
	else
		set @x1='l?u ban'
	update DIEM set Xeploai = @x1 where MAHS=@mahs
end 