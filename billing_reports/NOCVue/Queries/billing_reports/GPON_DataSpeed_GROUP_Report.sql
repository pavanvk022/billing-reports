
define from_date="to_date('1-12-22', 'dd/mm/yy')";
define to_date_exclude="to_date('1-01-23', 'dd/mm/yy')";

select REGEXP_SUBSTR(res.NSO,  '[^:]+' , 1, 2) rangeStr, 
res.GPON_HSI_CNT+res.GPON_PRISM_CNT+res.GPON_VOICE_CNT total,
res.GPON_HSI_CNT,
res.GPON_PRISM_CNT,
res.GPON_VOICE_CNT

from (SELECT  al.NSO
   ,     count(CASE
      WHEN al.technology in ('GPON_HSI')
      THEN 'x'
    END) GPON_HSI_CNT,
     count(CASE
      WHEN al.technology in ('GPON_PRISM')
      THEN 'x'
    END) GPON_PRISM_CNT,
     count(CASE
      WHEN al.technology in ('GPON_VOICE')
      THEN 'x'
    END) GPON_VOICE_CNT

 
FROM
(SELECT distinct x.id, x.technology, x.NSO
 FROM SPAUDITLOG x where concat(x.id,x.subscriberid) in 
 (    SELECT  distinct concat(max(alx.id),alx.subscriberid)
  from SPAUDITLOG alx where 
 alx.REQUESTTIME >= &from_date AND alx.REQUESTTIME < &to_date_exclude    
 -- and alx.application in 'NPCA' 
  and alx.subscriberid is not null and alx.technology is not null and alx.portproifle is not null
  and alx.OPERATION not in ( 'LOGIN','CLI DIRECT') 
  -- and alx.operation not like 'ORDER:%'
    group by alx.subscriberid )  and x.status != 'INVENTORY_ERROR'
    
   ) al
     

  where al.technology  like '%GPON%' 
  --and al.portproifle not like '%ONT%' and  al.portproifle not in('null','UNKNOWN','defaultProfile','defaultVDSL2Profile') and al.portproifle not like '%HD%' 
  --and al.portproifle not like '%ond%' 
group by al.NSO  ) res where  res.NSO  like 'SPEED:%' order by REGEXP_SUBSTR(rangeStr,  '[^-]+' , 1, 1)