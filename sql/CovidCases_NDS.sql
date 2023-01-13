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
	CONSTRAINT PK_PHU PRIMARY KEY(PHU_ID)
)


CREATE TABLE CovidCases(
	Case_id			Int Not Null Identity(1,1),
	Age_group		VarChar(20),	--WHERE
	Date_id			Date,			--WHERE
	Gender			Char(1),		--WHERE
	Exposure		VarChar(20),	--Exposure + CaseAcquisitionInfo
	Case_status		VarChar(20),	--Fatal = Deceased, Active = Not Resolve, Recover = Resolved, Not Reported (outcome = case status)
	OutbreakRelated Bit,
	PHU_ID			Char(4),		--WHERE
	CONSTRAINT PK_CovidCases PRIMARY KEY(Case_id),
	CONSTRAINT FK_CC_PHU FOREIGN KEY(PHU_ID) REFERENCES PublicHealthUnit
)

create table VaccinesByAge_Ontario
(
	Date date ,
	PHUID char(4),
	Agegroup varchar(30),
	At_least_one_dose_cumulative int,
	Second_dose_cumulative int,
	fully_vaccinated_cumulative int,
	third_dose_cumulative int
)

create table OngoingOutbreaks_Ontario(
	date date,
	phu_num char(4),
	outbreak_group varchar(20),
	number_ongoing_outbreaks int
)