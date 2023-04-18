
define from_date="to_date('1-12-22', 'dd/mm/yy')";
define to_date_exclude="to_date('1-01-23', 'dd/mm/yy')";

select REGEXP_SUBSTR(res.NSO,  '[^:]+' , 1, 2) rangeStr, res.ADSL_SL_HSI_CNT+res.ADSL_SL_PRISM_CNT+ res.VDSL_SL_HSI_CNT+ res.VDSL_SL_PRISM_CNT total_SL_Count, 
res.ADSL_SL_HSI_CNT+res.ADSL_SL_PRISM_CNT total_ADSL_SL,res.ADSL_SL_HSI_CNT, res.ADSL_SL_PRISM_CNT, 
res.VDSL_SL_HSI_CNT+ res.VDSL_SL_PRISM_CNT total_VDSL_SL, res.VDSL_SL_HSI_CNT, res.VDSL_SL_PRISM_CNT, 

res.ADSL_BG_HSI_CNT+res.ADSL_BG_PRISM_CNT+ res.VDSL_BG_HSI_CNT+ res.VDSL_BG_PRISM_CNT total_BG_Count, 
res.ADSL_BG_HSI_CNT+res.ADSL_BG_PRISM_CNT total_ADSL_BG,res.ADSL_BG_HSI_CNT, res.ADSL_BG_PRISM_CNT, 
res.VDSL_BG_HSI_CNT+ res.VDSL_BG_PRISM_CNT total_VDSL_BG, res.VDSL_BG_HSI_CNT, res.VDSL_BG_PRISM_CNT 
from (SELECT  al.NSO, 
count(CASE
      WHEN al.technology in ('ADSL2_ATM_SL_HSI','ADSL2_SL_FALLBACK_HSI','ADSL2_SL_HSI','ADSL_ETH_SL_HSI')
      THEN 'x'
    END) ADSL_SL_HSI_CNT,

count(CASE
      WHEN al.technology in ('ADSL2_SingleLinePRISM')
      THEN 'x'
    END) ADSL_SL_PRISM_CNT,
    
count(CASE
      WHEN al.technology in ('VDSL2_SL_HSI','VDSL2_ATM_SL_HSI')
      THEN 'x'
    END) VDSL_SL_HSI_CNT,

count(CASE
      WHEN al.technology in ('VDSL2_SL_PRISM')
      THEN 'x'
    END) VDSL_SL_PRISM_CNT,

count(CASE
      WHEN al.technology in ('ADSL2_ATM_BONDED_HSI','ADSL2_BONDED_HSI','ADSL2_BONDED_FALLBACK_HSI','ADSL_ETH_BONDED_HSI','ADSL2_ATM_BONDED_FALLBACK_HSI')
      THEN 'x'
    END) ADSL_BG_HSI_CNT,

count(CASE
      WHEN al.technology in ('ADSL2_BONDED_FALLBACK_PRISM','ADSL2_BONDED_PRISM')
      THEN 'x'
    END) ADSL_BG_PRISM_CNT,    

count(CASE
      WHEN al.technology in ('VDSL2_BONDED_HSI')
      THEN 'x'
    END) VDSL_BG_HSI_CNT,
    
count(CASE
      WHEN al.technology in ('VDSL2_BONDED_PRISM')
      THEN 'x'
    END) VDSL_BG_PRISM_CNT
   -- ,    count(CASE      WHEN al.technology in ('GPON_HSI','GPON_PRISM','GPON_VOICE')      THEN 'x'    END) GPON_CNT

 
FROM
(SELECT distinct x.id, x.technology, x.NSO
 FROM SPAUDITLOG x where concat(x.id,x.subscriberid) in 
 (    SELECT  distinct concat(max(alx.id),alx.subscriberid)
  from SPAUDITLOG alx where 
 alx.REQUESTTIME >= &from_date AND alx.REQUESTTIME < &to_date_exclude    
  --and alx.application in 'NPCA' 
  and alx.subscriberid is not null and alx.technology is not null and alx.portproifle is not null
  and alx.OPERATION not in ( 'LOGIN','CLI DIRECT') 
  -- and alx.operation not like 'ORDER:%'
    group by alx.subscriberid )  and x.status != 'INVENTORY_ERROR'
    
   ) al
     

  where al.technology not like '%GPON%' 
  --and al.portproifle not like '%ONT%' and  al.portproifle not in('null','UNKNOWN','defaultProfile','defaultVDSL2Profile') and al.portproifle not like '%HD%' 
  --and al.portproifle not like '%ond%' 
group by al.NSO  ) res where  res.NSO  like 'SPEED:%' order by REGEXP_SUBSTR(rangeStr,  '[^-]+' , 1, 1)