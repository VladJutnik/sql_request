select deti_anket.*
from deti_anket
where exists (
    select 1 
    from organization
    where organization.id = deti_anket.organization_id AND ((organization.municipality_id <> deti_anket.municipality_id) OR (organization.region_id <> deti_anket.region_id))) 
AND deti_anket.`year` = 2023 ORDER BY `field1_1`  DESC