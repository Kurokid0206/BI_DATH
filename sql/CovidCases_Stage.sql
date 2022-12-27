create database CovidCases
go
use CovidCases

create table CaseDetails_Canada(
	ObjectId int,
	row_id int,
	date_reported date,
	health_region varchar(50),
	age_group varchar(10),
	gender varchar(6),
	exposure varchar(20),
	case_status varchar(20),
	province varchar(50)
)

create table CasesReport_Ontario
(
	Outcome varchar(20),
	Age char(3),
	Gender varchar(6),
	ReportingPHU varchar(60),
	SpecimenDate date,
	CaseReportedDate date,
	PHUCity varchar(50),
	TestReportedDate date,
	CaseAcquisitionInfo varchar(20),
	AccurateEpisodeDt date,
	PHUAddress varchar(50),
	PHUWebsite varchar(60),
	OutbreakRelated varchar(3),
	PHULatitude float,
	PHULongitude float,
	PHUPostalCode varchar(10)
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

create table PublicHealthUnit_Ontario(
	PHU_ID char(4),
	Reporting_PHU varchar(60),
	Reporting_PHU_Address varchar(50),
	Reporting_PHU_City varchar(50),
	Reporting_PHU_Postal_Code varchar(10),
	Reporting_PHU_Website varchar(60),
	Reporting_PHU_Latitude float,
	Reporting_PHU_Longitude float,
)

create table OngoingOutbreaks_Ontario(
	date date,
	phu_num char(4),
	outbreak_group varchar(20),
	number_ongoing_outbreaks int
)

create table PHUGroups(
	PHU_Group varchar(50),
	PHU_City varchar(50),
	PHU_region varchar(60)
)