--USE MASTER
--DROP DATABASE CovidCases_DDS

CREATE DATABASE CovidCases_DDS COLLATE Latin1_General_100_CS_AS
GO
USE CovidCases_DDS

CREATE TABLE DimDate(
	DateKey			INT NOT NULL IDENTITY(1,1),
	DayKey			INT,
	MonthKey		INT,
	YearKey			INT,
	CONSTRAINT PK_Date PRIMARY KEY (DateKey)
)

CREATE TABLE DimGender(
	GenderKey		INT NOT NULL Identity(0,1),
	GenderName		VARCHAR(10),
	CONSTRAINT PK_Gender PRIMARY KEY (GenderKey)
)

CREATE TABLE DimAgeGroup(
	AgeGroupKey		INT NOT NULL Identity(1,1),
	AgeGroupDetail	VARCHAR(10),
	CONSTRAINT PK_AgeGroup PRIMARY KEY (AgeGroupKey)
)

CREATE TABLE DimSeverity(
	SeverityKey		INT NOT NULL Identity(0,1),
	SeverityDetail	VARCHAR(10),
	CONSTRAINT PK_Severity PRIMARY KEY (SeverityKey)
)

CREATE TABLE DimPublicHealthUnit(
	PHUKey			INT NOT NULL IDENTITY(1,1),
	PHU_ID			CHAR(4),
	PHU				VARCHAR(60),
	PHU_Address		VARCHAR(50),
	PHU_City		VARCHAR(50),
	PHU_Postal_Code VARCHAR(10),
	PHU_Group		VARCHAR(50),
	PHU_Website		VARCHAR(60),
	PHU_Latitude	FLOAT,
	PHU_Longitude	FLOAT,
	CONSTRAINT PK_PHU PRIMARY KEY(PHUKey)
)

CREATE TABLE DimCaseStatus(
	CaseStatusID	INT NOT NULL Identity(1,1),
	CaseStatus		VARCHAR(50),
	CONSTRAINT PK_CaseStatus PRIMARY KEY(CaseStatusID)
)

CREATE TABLE DimOutBreakGroup(
	GroupID			INT NOT NULL Identity(1,1),
	OutbreakGroup	varchar(20),
	CONSTRAINT PK_OutbreakGroup PRIMARY KEY(GroupID)
)

CREATE TABLE DimOutBreak(
	OubreakID		INT NOT NULL Identity(1,1),
	DateKey			INT,
	PHUKey			INT,
	OutbreakGroup	INT,
	OngoingOutbreak	INT,
	CONSTRAINT PK_Outbreak PRIMARY KEY(OubreakID),
	CONSTRAINT FK_Outbreak_PHU FOREIGN KEY(PHUKey) REFERENCES DimPublicHealthUnit,
	CONSTRAINT FK_Outbreak_Date FOREIGN KEY(DateKey) REFERENCES DimDate,
	CONSTRAINT FK_Outbreak_Group FOREIGN KEY(OutbreakGroup) REFERENCES DimOutBreakGroup
)

CREATE TABLE FactVaccinated(
	ROW_ID			INT NOT NULL Identity(1,1),
	PHUKey			INT,
	DateKey			INT,
	SeverityKey		INT,
	VaccinatedCount INT,
	CONSTRAINT PK_FactVaccinated PRIMARY KEY(ROW_ID),
	CONSTRAINT FK_FactVaccinated_PHU FOREIGN KEY(PHUKey) REFERENCES DimPublicHealthUnit,
	CONSTRAINT FK_FactVaccinated_Date FOREIGN KEY(DateKey) REFERENCES DimDate(DateKey),
	CONSTRAINT FK_FactVaccinated_Severity FOREIGN KEY(SeverityKey) REFERENCES DimSeverity(SeverityKey)
)

CREATE TABLE FactInfected(
	Row_ID			INT NOT NULL Identity(1,1),
	DateKey			INT,
	SeverityKey		INT,
	PHUKey			INT,
	CaseCount		INT,
	CONSTRAINT PK_FactInfected PRIMARY KEY(Row_ID),
	CONSTRAINT FK_DimDate FOREIGN KEY(DateKey) REFERENCES DimDate,
	CONSTRAINT FK_Severity FOREIGN KEY(SeverityKey) REFERENCES DimSeverity,
	CONSTRAINT FK_PublicHealthUnit FOREIGN KEY(PHUKey) REFERENCES DimPublicHealthUnit,
)

INSERT INTO DimGender(GenderName) VALUES('Female')
INSERT INTO DimGender(GenderName) VALUES('Male')


INSERT INTO DimSeverity(SeverityDetail) VALUES('Unknown')
INSERT INTO DimSeverity(SeverityDetail) VALUES('Low')
INSERT INTO DimSeverity(SeverityDetail) VALUES('Medium')
INSERT INTO DimSeverity(SeverityDetail) VALUES('High')
INSERT INTO DimSeverity(SeverityDetail) VALUES('Very High')

INSERT INTO DimCaseStatus(CaseStatus) VALUES('Recovered')
INSERT INTO DimCaseStatus(CaseStatus) VALUES('Deceased')
INSERT INTO DimCaseStatus(CaseStatus) VALUES('Active')
INSERT INTO DimCaseStatus(CaseStatus) VALUES('Not Reported')


