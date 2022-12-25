create database CovidCases_NDS
go
use CovidCases_NDS

create table PublicHealthUnit(
	PHU_ID char(4),
	PHU varchar(60),
	PHU_Address varchar(50),
	PHU_City varchar(50),
	PHU_Postal_Code varchar(10),
	PHU_Group varchar(50),
	PHU_Website varchar(60),
	PHU_Latitude float,
	PHU_Longitude float,
	
)
