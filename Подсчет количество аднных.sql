SELECT COUNT(*) AS `total_organizations`, 
(SELECT COUNT(*) FROM `organization` WHERE federal_district_id = 6 and region_id = 59 and organization_type_id = 5 and id not in (1, 3, 4, 5, 6, 7, 10, 11) and year = 2023) AS `organization_2023`, 
(
SELECT COUNT(DISTINCT organization.title) FROM `organization`
left join user on user.organization_id = organization.id
WHERE organization.federal_district_id = 6
and organization.region_id = 59
and organization_type_id = 3
and organization.id <> 3
and organization.year = 2023
limit 1
) AS `food_organizer1`
, (SELECT COUNT(DISTINCT user.name) FROM `organization`
left join user on user.organization_id = organization.id
left join user_autorization_statistic on user.id = user_autorization_statistic.user_id
WHERE organization.federal_district_id = 6
and organization.region_id = 59
and organization_type_id = 3
and organization.id <> 3
and organization.year = 2022
and user_autorization_statistic.created_at > "2023-01-01"
order by user_autorization_statistic.created_at desc
limit 1) AS `food_organizer2`, 
(SELECT COUNT(*) FROM `deti_anket` 
WHERE federal_district_id = 6 and region_id = 59 and year in (2023)) AS `count_anket_deti`, (SELECT COUNT(*) FROM `v2_deti_anket` WHERE federal_district_id = 6 and region_id = 59 and year in (2023)) AS `count_v2_deti_anket`, (SELECT COUNT(*) FROM `director` WHERE federal_district_id = 6 and region_id = 59 and year in (2023)) AS `count_anket_director`, (SELECT COUNT(*) FROM `food` WHERE federal_district_id = 6 and region_id = 59 and year in (2023)) AS `count_anket_food` FROM `organization` WHERE ((`organization_type_id`=5) AND (`federal_district_id`=6) AND (`region_id`=59) AND (`registration_status`='3') AND (`year`='2023')) AND (`id` NOT IN (1, 3, 4, 5, 6, 7, 10, 11))