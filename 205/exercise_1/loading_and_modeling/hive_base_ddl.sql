drop table effective_care;
CREATE EXTERNAL TABLE effective_care (
       Provider_ID varchar(11),
       Hospital_Name varchar(45),
       Address varchar(45),
	City varchar(45),
	State varchar(45),
	ZIP_Code varchar(45),
	County_Name varchar(45),
	Phone_Number varchar(45),
	Condition varchar(45),
	Measure_ID varchar(45),
	Measure_Name varchar(45),
	Score varchar(45),
	Sample varchar(45),
	Footnote varchar(45),
	Measure_Start_Date varchar(45),
	Measure_End_Date  varchar(45)
) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';


drop table hospital; 
CREATE EXTERNAL TABLE hospital(
       ProviderID varchar(11),
	   HospitalName varchar(45),
	   Address varchar(45),
	   City varchar(45),
	   State varchar(45),
	   ZIPCode varchar(45),
	   CountyName varchar(45),
	   PhoneNumber varchar(45),
	   HospitalType varchar(45),
	   HospitalOwnership varchar(45),
	   EmergencyServices varchar(45)) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';


drop table measure; 
CREATE EXTERNAL TABLE measure(
       MeasureName varchar(45),
	    MeasureID varchar(45),
	    MeasureStartQuarter varchar(45),
	    MeasureStartDate varchar(45),
	    MeasureEndQuarter varchar(45),
	    MeasureEndDate varchar(45)
) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

drop table readmission; 
CREATE EXTERNAL TABLE readmission(
       ProviderID varchar(11),
	   HospitalName varchar(45),
	   Address varchar(45),
	   City varchar(45),
	   State varchar(45),
	   ZIPCode varchar(45),
	   CountyName varchar(45),
	   PhoneNumber varchar(45),
	   MeasureName varchar(45),
	   MeasureID varchar(45),
	   ComparedtoNational varchar(45),
	   Denominator varchar(45),
	   Score varchar(45),
	   LowerEstimate varchar(45),
	   HigherEstimate varchar(45),
	   Footnote varchar(45),
	   MeasureStartDate varchar(45),
	   MeasureEndDate
 varchar(45)) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

drop table survey_response; 
CREATE EXTERNAL TABLE survey_response(
       ProviderID varchar(11),
	       HospitalName varchar(45),
	       Address varchar(45),
	       City varchar(45),
	       State varchar(45),
	       ZIPCode varchar(45),
	       CountyName varchar(45),
	       CommunicationwithNursesAchievementPoints varchar(45),
	       CommunicationwithNursesImprovementPoints varchar(45),
	       CommunicationwithNursesDimensionScore varchar(45),
	       CommunicationwithDoctorsAchievementPoints varchar(45),
	       CommunicationwithDoctorsImprovementPoints varchar(45),
	       CommunicationwithDoctorsDimensionScore varchar(45),
	       ResponsivenessofHospitalStaffAchievementPoints varchar(45),
	       ResponsivenessofHospitalStaffImprovementPoints varchar(45),
	       ResponsivenessofHospitalStaffDimensionScore varchar(45),
	       PainManagementAchievementPoints varchar(45),
	       PainManagementImprovementPoints varchar(45),
	       PainManagementDimensionScore varchar(45),
	       CommunicationaboutMedicinesAchievementPoints varchar(45),
	       CommunicationaboutMedicinesImprovementPoints varchar(45),
	       CommunicationaboutMedicinesDimensionScore varchar(45),
	       CleanlinessandQuietnessofHospitalEnvironmentAchievementPoints varchar(45),
	       CleanlinessandQuietnessofHospitalEnvironmentImprovementPoints varchar(45),
	       CleanlinessandQuietnessofHospitalEnvironmentDimensionScore varchar(45),
	       DischargeInformationAchievementPoints varchar(45),
	       DischargeInformationImprovementPoints varchar(45),
	       DischargeInformationDimensionScore varchar(45),
	       OverallRatingofHospitalAchievementPoints varchar(45),
	       OverallRatingofHospitalImprovementPoints varchar(45),
	       OverallRatingofHospitalDimensionScore varchar(45),
	       HCAHPSBaseScore varchar(45),
	       HCAHPSConsistencyScore
 varchar(45)) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"',"escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';