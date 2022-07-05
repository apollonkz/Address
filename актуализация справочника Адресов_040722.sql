SELECT 
       r.name rdt_name,
       d.name department_name,
	   s.server_id,
       s.name server_name,
	   sd.id state_district_id,
       sd.rus_name state_district_name, 
       ts.id town_state_id,
	   ts.rus_name town_state_name,
	   ad.town_id ,
	   ad.street_town_name,
	   ad.address_id ,
	   ad.street_type_name , 
	   ad.street_name , 
	   ad.house, 
	   ad.sub_house, 
	   ad.flat, 
	   ad.sub_flat, 
	   ad.full_address 
  FROM asr_isb.asr_nsi_rdt r 
 INNER JOIN dataw.dataw_nsi_department d
    on r.rdt_id =d.rdt_id 
 INNER JOIN dataw.dataw_nsi_server s
    on d.department_id =s.department_id 
 INNER JOIN asr_union.ASR_UNION_DB_STATE_DISTRICT sd
    on s.server_id =sd.server_id 
 INNER JOIN asr_union.asr_union_db_town_state ts 
    on sd.id = ts.state_district_id 
 INNER JOIN asr_union.asr_union_db_address_full ad
    on ts.id=ad.town_state_id 
 UNION ALL     
SELECT s.name , 
	   s.name ,	
	   ad.server_id ,
	   s.name ,
	   null, 
	   null,
	   null,
	   null,
 	   tn.id , 
 	   tn.name ,
 	   ad.address_id , 
 	   stt.name , 
 	   st.name , 
 	   ad.house , 
 	   ad.sub_house , 
 	   ad.flat,
 	   ad.sub_flat,
	   concat(CASE WHEN st.street_id > 0 		 THEN concat(stt.NAME,st.NAME) end,
		      CASE WHEN ad.HOUSE>= 0 			 THEN concat(', д.',cast(ad.HOUSE as string)) END,
			  CASE WHEN ad.SUB_HOUSE is not null THEN concat('/',ad.SUB_HOUSE) else '' END,
			  CASE WHEN ad.flat is not null 	 THEN concat(',кв.',cast(ad.flat as string)) else '' END,
			  CASE WHEN ad.SUB_FLAT IS NOT NULL  THEN concat('/',cast(ad.SUB_FLAT as string)) else '' END) full_address
  FROM dataw.dataw_nsi_server s
 INNER JOIN asrd.asr_dkb_db_town tn
 	ON s.server_id =tn.server_id 
 INNER JOIN asrd.asr_dkb_db_address ad 
    ON s.server_id =ad.server_id 
 INNER JOIN asrd.asr_dkb_db_street st 
    ON ad.street_id =st.street_id 
 INNER JOIN asrd.asr_dkb_db_street_type stt
	ON st.street_type_id =stt.street_type_id 
 UNION ALL
SELECT s.name , 
	   s.name ,	
	   ad.server_id ,
	   s.name ,
	   null, 
	   null,
	   null,
	   null,
 	   tn.id , 
 	   tn.name ,
 	   ad.address_id , 
 	   stt.name , 
 	   st.name , 
 	   ad.house , 
 	   ad.sub_house , 
 	   ad.flat,
 	   ad.sub_flat,
	   concat(CASE WHEN st.street_id > 0 		 THEN concat(stt.NAME,st.NAME) end,
		      CASE WHEN ad.HOUSE>= 0 			 THEN concat(', д.',cast(ad.HOUSE as string)) END,
			  CASE WHEN ad.SUB_HOUSE is not null THEN concat('/',ad.SUB_HOUSE) else '' END,
			  CASE WHEN ad.flat is not null 	 THEN concat(',кв.',cast(ad.flat as string)) else '' END,
			  CASE WHEN ad.SUB_FLAT IS NOT NULL  THEN concat('/',cast(ad.SUB_FLAT as string)) else '' END) full_address
  FROM dataw.dataw_nsi_server s
 INNER JOIN asrd.asr_dis_db_town tn
 	ON s.server_id =tn.server_id 
 INNER JOIN asrd.asr_dis_db_address ad 
    ON s.server_id =ad.server_id 
 INNER JOIN asrd.asr_dis_db_street st 
    ON ad.street_id =st.street_id 
 INNER JOIN asrd.asr_dis_db_street_type stt
	ON st.street_type_id =stt.street_type_id  