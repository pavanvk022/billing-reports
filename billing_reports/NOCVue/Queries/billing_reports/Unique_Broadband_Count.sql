          define from_date="to_date('1-12-22', 'dd/mm/yy')";
define to_date_exclude="to_date('1-01-23', 'dd/mm/yy')";
              SELECT  
              count(distinct concat(max(alx.id),alx.subscriberid))
                     --    distinct  alx.subscriberid

  from SPAUDITLOG alx where 
 alx.REQUESTTIME >= &from_date AND alx.REQUESTTIME < &to_date_exclude    
 -- and alx.application in 'NPCA' 
  and alx.subscriberid is not null 
  and alx.technology is not null 
  --and alx.portproifle is not null
  and alx.status != 'INVENTORY_ERROR'
  -- and alx.operation not like 'ORDER:%'
    group by alx.subscriberid 
    order by rownum 