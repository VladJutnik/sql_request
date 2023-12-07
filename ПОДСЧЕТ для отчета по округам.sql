SELECT (
		SELECT count(*)
		from `director`
		INNER JOIN `organization` as organization4 ON director.organization_id = organization4.id
		where
		`director`.`year` = 2023 AND
		`director`.federal_district_id = `organization`.federal_district_id AND
		`director`.region_id = `organization`.region_id AND
		`organization4`.`year` = 2023 AND
		`organization4`.registration_status = 1
	) as factDirector, 
	(
		SELECT count(*) from `organization` as organization2
		where
		`organization2`.federal_district_id = `organization`.federal_district_id AND
		`organization2`.region_id = `organization`.region_id AND
		`organization2`.organization_type_id = 5 AND
		`organization2`.registration_status = 1 AND
		`organization2`.`year` = 2023
	) as planDirector,
	(
		SELECT count(*)
		from `food`
		where
		`food`.`year` = 2023 AND
		`food`.federal_district_id = `organization`.federal_district_id AND
		`food`.region_id = `organization`.region_id
	) as factFood, 
	(
		SELECT count(*)
		from `deti_anket`
		where
		`deti_anket`.`year` = 2023 AND
		`deti_anket`.federal_district_id = `organization`.federal_district_id AND
		`deti_anket`.region_id = `organization`.region_id
	) as factDetiAnket,

	
	sum(sch2_again) AS `plan2Kl`, 
	sum(sch5_again) AS `plan5Kl`, 
	(
		SELECT count(*)
		from `v2_deti_anket`
		where
		`v2_deti_anket`.federal_district_id = `organization`.federal_district_id AND
		`v2_deti_anket`.region_id = `organization`.region_id and
		`v2_deti_anket`.field1_1 = 3 and
		`v2_deti_anket`.year = 2023
	) as fackt2Kl, 
	(
		SELECT count(*)
		from `v2_deti_anket`
		where
		`v2_deti_anket`.federal_district_id = `organization`.federal_district_id AND
		`v2_deti_anket`.region_id = `organization`.region_id and
		`v2_deti_anket`.field1_1 = 6 and
		`v2_deti_anket`.year = 2023
	) as fackt5Kl, 
`organization`.federal_district_id AS `federal_district_id`, 
`organization`.region_id AS `region_id`, 
sum(sch2) AS `sch2`, 
sum(sch5) AS `sch5`, 
sum(sch10) AS `sch10` 
FROM `organization` 
WHERE ((`organization_type_id`=5) AND (`federal_district_id`='5') AND (`organization`.`year`=2023)) AND (`organization`.`registration_status`=1) AND (`organization`.`year`=2023) AND (`organization`.`id` NOT IN (1, 3, 4, 5, 6, 7, 10, 11)) GROUP BY `region_id` ORDER BY `organization`.`federal_district_id`, `organization`.`region_id`