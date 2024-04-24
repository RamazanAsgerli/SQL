--create database Movies
--use Movies

create table Directors(
Id int Primary key Identity,
Name nvarchar(50) Not null
)
create table Moviess(
Id int Primary key Identity,
Name nvarchar(50) Not null,
DirectorId int references Directors(Id)
)
create table Genre(
Id int Primary key Identity,
Name nvarchar(50) Not null
)
create table MovieGenre(
Id int Primary key Identity,
MovieId int references Moviess(Id),
GenreId int references Genre(Id)
)
create table Award(
Id int Primary key Identity,
Name nvarchar(50)
)
create table MovieAward(
Id int Primary key Identity,
MovieId int references Moviess(Id),
AwardId int references Award(Id)
)

insert into Directors values('Gore Verbinski'),('Martin Scorsese'),('Louis Leterrier')
Select * from Directors
insert into Moviess values('Fast X',3),('Shutter Island',2),('Pirates of the Caribbean',1),('Rango',1)
select * from Moviess

select m.Id,m.Name,d.Name as [Director Name] from Moviess as m
inner join Directors as d
On
m.DirectorId=d.Id

insert into Genre values('Comedy'),('Action'),('Mystery'),('Fantasy')
select * from Genre

insert into MovieGenre values(1,2),(2,3),(3,4),(4,1)

select g.Id,g. Name as [Genre Name],m.Name,d.Name as [Director Name] from Genre as g
inner join MovieGenre 
On
g.Id=MovieGenre.GenreId
inner join Moviess as m 
On
MovieGenre.MovieId=m.Id
inner join Directors as d 
On
m.DirectorId=d.Id

insert into Award values ('Favorite Movie'),('Favorite Action Movie'),('Best Animated Film'),('The Best Movie')
select * from Award

insert into MovieAward values(3,1),(1,2),(4,3),(2,4)

select a.Id,a.Name as [Award Name],m.Name,d.Name as [Director Name] from Award as a
inner join MovieAward
On
a.Id=MovieAward.AwardId
inner join Moviess as m
On
MovieAward.MovieId=m.Id
inner join Directors as d
On
m.DirectorId=d.Id