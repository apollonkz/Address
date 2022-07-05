--актуализация справочника Адресов БиТТЛ
select r.rdt_id,
       r.name rdt_name,
	   d.department_id,
       d.name department_name,
	   s.server_id,
       s.name server_name,
	   sd.id state_district_id,
       sd.rus_name state_district_name, 
       ts.id town_state_id,
	   ts.rus_name town_state_name,
	   ad.address_id ,
	   ad.street_type_name , 
	   ad.street_name , 
	   ad.house, 
	   ad.sub_house, 
	   ad.flat, 
	   ad.sub_flat, 
	   ad.full_address 
  from dataw.dataw_nsi_rdt r 
 inner join dataw.dataw_nsi_department d
    on r.rdt_id =d.rdt_id 
 inner join dataw.dataw_nsi_server s
    on d.department_id =s.department_id 
 inner join asr_union.ASR_UNION_DB_STATE_DISTRICT sd
    on s.server_id =sd.server_id 
 inner join asr_union.asr_union_db_town_state ts 
    on sd.id = ts.state_district_id 
 inner join asr_union.asr_union_db_address_full ad
    on ts.id=ad.town_state_id 
