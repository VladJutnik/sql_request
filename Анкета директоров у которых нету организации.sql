select director.*
from director
where not exists (
    select 1 
    from organization
    where organization.id = director.organization_id) 
AND director.`year` = 2023