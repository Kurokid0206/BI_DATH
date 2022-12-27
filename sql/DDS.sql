CREATE TABLE DimDate(
	DateKey Date,
	DayKey INT,
	MonthKey INT,
	YearKey INT,
	CONSTRAINT PK_Date PRIMARY KEY (DateKey)
)

CREATE TABLE DimGender(
	GenderKey INT NOT NULL Identity(1,1),
	GenderName varchar(10),
	CONSTRAINT PK_Gender PRIMARY KEY (GenderKey)
)

CREATE TABLE DimAgeGroup(
	AgeGroupKey INT NOT NULL Identity(1,1),
	AgeGroupDetail varchar(10),
	CONSTRAINT PK_AgeGroup PRIMARY KEY (AgeGroupKey)

)

CREATE TABLE Severity(
	SeverityKey INT NOT NULL Identity(1,1),
	SeverityDetail varchar(10),
	CONSTRAINT PK_Severity PRIMARY KEY (SeverityKey)

)

CREATE TABLE PublicHealthUnit(
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

CREATE TABLE CaseStatus(
	CaseStatusID INT NOT NULL Identity(1,1),
	CaseStatus varchar(50),
	CONSTRAINT PK_CaseStatus PRIMARY KEY(CaseStatusID)
)
CREATE TABLE OutBreak(
	OubreakID INT NOT NULL Identity(1,1),
	OutbreakGroup varchar(50),
	CONSTRAINT PK_Outbreak PRIMARY KEY(OubreakID)
)

CREATE TABLE FactVaccinated(
	ROW_ID INT NOT NULL Identity(1,1),
	PHU_ID char(4),
	DateKey Date,
	SeverityKey INT,
	CONSTRAINT PK_FactVaccinated PRIMARY KEY(ROW_ID),
	CONSTRAINT FK_FactVaccinated_PHU FOREIGN KEY(PHU_ID) REFERENCES PublicHealthUnit(PHU_ID),
	CONSTRAINT FK_FactVaccinated_Date FOREIGN KEY(DateKey) REFERENCES DimDate(DateKey),
	CONSTRAINT FK_FactVaccinated_Severity FOREIGN KEY(SeverityKey) REFERENCES Severity(SeverityKey)
)
