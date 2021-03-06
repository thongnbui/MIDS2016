drop table survey_response2;
create table survey_response2 as select
       ProviderID,
       CommunicationwithNursesAchievementPoints,
       CommunicationwithNursesImprovementPoints,
       CommunicationwithNursesDimensionScore,
       CommunicationwithDoctorsAchievementPoints,
       CommunicationwithDoctorsImprovementPoints,
       CommunicationwithDoctorsDimensionScore,
       ResponsivenessofHospitalStaffAchievementPoints,
       ResponsivenessofHospitalStaffImprovementPoints,
       ResponsivenessofHospitalStaffDimensionScore,
       PainManagementAchievementPoints,
       PainManagementImprovementPoints,
       PainManagementDimensionScore,
       CommunicationaboutMedicinesAchievementPoints,
       CommunicationaboutMedicinesImprovementPoints,
       CommunicationaboutMedicinesDimensionScore,
       CleanlinessandQuietnessofHospitalEnvironmentAchievementPoints,
       CleanlinessandQuietnessofHospitalEnvironmentImprovementPoints,
       CleanlinessandQuietnessofHospitalEnvironmentDimensionScore,
       DischargeInformationAchievementPoints,
       DischargeInformationImprovementPoints,
       DischargeInformationDimensionScore,
       OverallRatingofHospitalAchievementPoints,
       OverallRatingofHospitalImprovementPoints,
       OverallRatingofHospitalDimensionScore,
       HCAHPSBaseScore,
       HCAHPSConsistencyScore
from survey_response;

