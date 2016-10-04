drop table effective_care2; 
CREATE TABLE effective_care2 as select 
       ProviderID,
	Condition,
	MeasureID,
	Score,
	Sample,
	Footnote,
	MeasureStartDate,
	MeasureEndDate
from effective_care;