SELECT organization.organization_type_id, organization.`year`, user.*
from user
INNER JOIN organization ON user.organization_id = organization.id
where not exists (
    select 1 
    from auth_assignment
    where auth_assignment.	user_id = user.id)