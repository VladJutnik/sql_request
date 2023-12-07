select director.*
from director
where exists (
    select 1 
    from organization
    where organization.id = director.organization_id AND organization.municipality_id <> director.municipality_id) 
AND director.`year` = 2023