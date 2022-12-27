--USE MASTER
--DROP DATABASE CovidCases_DDS

CREATE DATABASE CovidCases_DDS
GO
USE CovidCases_DDS

CREATE TABLE DimDate(
	DateKey			DATE,
	DayKey			INT,
	MonthKey		INT,
	YearKey			INT,
	CONSTRAINT PK_Date PRIMARY KEY (DateKey)
)

CREATE TABLE DimGender(
	GenderKey		INT NOT NULL Identity(1,1),
	GenderName		VARCHAR(10),
	CONSTRAINT PK_Gender PRIMARY KEY (GenderKey)
)

CREATE TABLE DimAgeGroup(
	AgeGroupKey		INT NOT NULL Identity(1,1),
	AgeGroupDetail	VARCHAR(10),
	CONSTRAINT PK_AgeGroup PRIMARY KEY (AgeGroupKey)
)

CREATE TABLE DimSeverity(
	SeverityKey		INT NOT NULL Identity(1,1),
	SeverityDetail	VARCHAR(10),
	CONSTRAINT PK_Severity PRIMARY KEY (SeverityKey)
)

CREATE TABLE DimPublicHealthUnit(
	PHU_ID			CHAR(4),
	PHU				VARCHAR(60),
	PHU_Address		VARCHAR(50),
	PHU_City		VARCHAR(50),
	PHU_Postal_Code VARCHAR(10),
	PHU_Group		VARCHAR(50),
	PHU_Website		VARCHAR(60),
	PHU_Latitude	FLOAT,
	PHU_Longitude	FLOAT,
	CONSTRAINT PK_PHU PRIMARY KEY(PHU_ID)
)

CREATE TABLE DimCaseStatus(
	CaseStatusID	INT NOT NULL Identity(1,1),
	CaseStatus		VARCHAR(50),
	CONSTRAINT PK_CaseStatus PRIMARY KEY(CaseStatusID)
)
CREATE TABLE DimOutBreak(
	OubreakID		INT NOT NULL Identity(1,1),
	OutbreakGroup	VARCHAR(50),
	CONSTRAINT PK_Outbreak PRIMARY KEY(OubreakID)
)

CREATE TABLE FactVaccinated(
	ROW_ID			INT NOT NULL Identity(1,1),
	PHU_ID			CHAR(4),
	DateKey			Date,
	SeverityKey		INT,
	VaccinatedCount INT,
	CONSTRAINT PK_FactVaccinated PRIMARY KEY(ROW_ID),
	CONSTRAINT FK_FactVaccinated_PHU FOREIGN KEY(PHU_ID) REFERENCES DimPublicHealthUnit(PHU_ID),
	CONSTRAINT FK_FactVaccinated_Date FOREIGN KEY(DateKey) REFERENCES DimDate(DateKey),
	CONSTRAINT FK_FactVaccinated_Severity FOREIGN KEY(SeverityKey) REFERENCES DimSeverity(SeverityKey)
)

CREATE TABLE FactInfected(
	Row_ID			INT,
	DateKey			DATE,
	GenderKey		INT,
	AgeGroupKey		INT,
	SeverityKey		INT,
	PHU_ID			CHAR(4),
	CaseStatusID	INT,
	CaseCount		INT,
	CONSTRAINT PK_FactInfected PRIMARY KEY(Row_ID),
	CONSTRAINT FK_DimDate FOREIGN KEY(DateKey) REFERENCES DimDate,
	CONSTRAINT FK_DimGender FOREIGN KEY(GenderKey) REFERENCES DimGender,
	CONSTRAINT FK_DimAgeGroup FOREIGN KEY(AgeGroupKey) REFERENCES DimAgeGroup,
	CONSTRAINT FK_Severity FOREIGN KEY(SeverityKey) REFERENCES DimSeverity,
	CONSTRAINT FK_PublicHealthUnit FOREIGN KEY(PHU_ID) REFERENCES DimPublicHealthUnit,
	CONSTRAINT FK_CaseStatus FOREIGN KEY(CaseStatusID) REFERENCES DimCaseStatus,
)
