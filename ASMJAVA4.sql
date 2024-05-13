use master
go 

create database [ASMJAVA4]
go

use ASMJAVA4
go

create table [user]
(
	id			int				primary key identity,
	username	varchar(50)		unique not null,
	[password]  varchar(50)		not null,
	email		varchar(50)		unique not null,
	isAdmin		bit				not null default 0,
	isActive	bit				not null default 1
)
go

create table video
(
	id				int				primary key identity,
	title			nvarchar(500)	not null,
	href			varchar(50)		unique not null,
	poster			varchar(250)	null,
	[views]			int				not null default 0,
	share			int				not null default 0,
	[description]	nvarchar(255)	not null,
	isActive		bit				not null default 1
)
create table history
(
	id			int				primary key identity,
	userId		int				foreign key references [user](id),
	videoId		int				foreign key references video(id),
	viewsDate	datetime		not null default getDate(),
	isLiked		bit				not null default 0,
	likedDate	datetime		null
)
go

insert into [user](username, [password],email,isAdmin) 
values ('linhnn'	, '123', 'linh@gmail.com', 1),
		('ngocpnd'	, '123', 'ngoc@gmail.com' , 0)
go


insert into video(title, href, [description])
values (N'Bảo Tàng (prod. Maiki) | Low G |',			'iKVLAXwVLYE'	, 'Low G'),
		(N'Simp Gái 808 (Maiki Remix) | Low G |',		'YOAeo2w53Jw'	, 'Low G'),
		(N'MUỘN PHIỀN – PHƯƠNG LY ft. LOW G ',			'h4WX3B3hj4k'	, 'Low G')
go

insert into history (userId, videoId, isLiked, likedDate)
values (1, 1, 1, GETDATE()),
		(1, 2, 0, null)
go


