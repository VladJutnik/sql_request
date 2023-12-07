SELECT 
region.name,
count(*) as count
FROM `user` 
INNER join organization on organization.id = `user`.`organization_id` 
INNER join region on region.id = `organization`.`region_id`
WHERE organization.federal_district_id = 5
GROUP by region_id