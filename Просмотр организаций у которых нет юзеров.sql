select organization.*
from organization
where not EXISTS (
    select 1 
    from user
    where user.organization_id = organization.id) 
AND organization.`year` = 2023