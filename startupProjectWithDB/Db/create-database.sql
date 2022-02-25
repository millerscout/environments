CREATE DATABASE Demo;
GO
USE Demo;
GO
CREATE TABLE Client (ID int Identity, Name nvarchar(150));
GO
insert into Client (Name)
Values 
('Marcos'), ('Paulo'), ('Icaro'), ('Nelson')