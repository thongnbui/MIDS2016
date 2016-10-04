drop table readmissions2; 
CREATE TABLE readmissions2 as select 
       ProviderID,
	MeasureID,
	ComparedtoNational,
	Denominator,
	Score,
	LowerEstimate,
	HigherEstimate,
	Footnote,
	MeasureStartDate,
	MeasureEndDate
from readmission;