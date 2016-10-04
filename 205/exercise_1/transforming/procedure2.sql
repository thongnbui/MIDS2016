drop table procedure2; 
CREATE TABLE procedure2 as select 
       ProviderID,
	MeasureID,
	Gastrointestinal,
	Eye,
	NervousSystem,
	Musculoskeletal,
	Skin,
	Genitourinary,
	Cardiovascular,
	StartDate,
	EndDate
from procedures;