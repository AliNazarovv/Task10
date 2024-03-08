use[Library]
drop table [dbo].[Books]
create table [dbo].[Books](
[Id] int primary key identity(1,1),
[Name] nvarchar(100) not null,
[Author] nvarchar(100) not null,
[Genre] nvarchar(100) not null,
[Price] decimal(18,2) not null,
[PageCount] int not null,
[Published] datetime not null,
[CreatedDate] datetime not null default getdate()
)
-- Kitabları ən bahadan ən ucuza doğru sıralamaq
select
*
from dbo.Books
order by [Price] desc
--------------------
--Ən ucuz 3 kitabı göstərmək 
select top 3
*
from dbo.Books
order by [Price] asc
-------------------
--Müəllifi "Çingiz Abdullayev" olan kitabları göstərmək
select 
*
from dbo.Books
where Author = 'Cingiz Abdullayev'
------------------------------------
-- Müəllifi "Çingiz Abdullayev" olan kitabların cari qiymətlərini 5% artırmaq üçün 
--script yazmaq(ama hamısını yox sadecə müəllif "Çingiz Abdullayev"-dirsə)
update Books
set Price = Price * 1.05
where Author = 'Cingiz Abdullayev'
------------------------------------
--Qiyməti 10m-dan böyük kitabları silmək
delete 

from dbo.Books
where Price > 10
select * from dbo.Books
-----------------------
--Sonda cədvəl elə silinsin ki yeni sətir insert edəndə Id - yeniden 1`dən başlasın
drop table dbo.Books
----------------------------