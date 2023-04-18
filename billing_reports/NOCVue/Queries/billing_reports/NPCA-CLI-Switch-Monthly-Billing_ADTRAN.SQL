
  define from_date      ="to_date('01-02-22', 'dd/mm/yy')";
define to_date_exclude="to_date('01-03-23', 'dd/mm/yy')";
define cliDevices="'TA5000','TA3000', 'TA5004','TA1200F','TA1100F','TA5006', 'TAHDX','TA1148A','TA1148V','TA1248A','TA1248V','TA1148VX','TA1108VP','TA1100D'";
define ceStat="'Communication Error'";


select 
    t2Result.dateStr, t2Result.TCount totalOrders, t1Result.CECount tl1CECount ,
    cResult.Scount,  t1Result.CECount -  cResult.Scount totalFailures,
    NVL(case when cResult.SCount <> 0 and t1Result.CECount <> 0 then round((cResult.SCount/t1Result.CECount)*100) end, '0')|| '%' SuccessPercent,
    t2Result.dateStr,cResult.CECount, cResult.DECount, 
    t1Result.CECount -  cResult.Scount-cResult.CECount-cResult.DECount genError, t1Result.CECount -  cResult.Scount totalFailures
    from 
    (
    select 
      TO_CHAR(rs1.requesttime, 'MON/DD/YYYY') dateStr,
      count(case when rs1.status = 'Success' then 'x' end) SCount,
      count(case when rs1.status = &ceStat then 'x' end) CECount,
      count(case when rs1.status = 'Data Error' then 'x' end) DECount,
      count(case when rs1.status = 'Failure' then 'x' end) FCount 
    from
    (
      SELECT 
        CLI.TRANSACTIONID, CLI.status, 
        CLI.operation, CLI.requesttime
      from
      (
            SELECT 
              x.TRANSACTIONID, x.status, x.operation, 
              x.requesttime,x.protocoltype
            FROM SPAUDITLOG x 
            where concat(concat(x.id,x.TRANSACTIONID),x.protocoltype) in 
            (    
              SELECT  
                distinct concat(concat(max(alx.id),alx.TRANSACTIONID),alx.protocoltype)
                from SPAUDITLOG alx   
                where alx.REQUESTTIME >= &from_date AND 
                      alx.REQUESTTIME < &to_date_exclude
                group by alx.TRANSACTIONID,alx.protocoltype 
            )  and x.application = 'NPCA' and x.vendor like '%dtran'
        ) CLI 
        where CLI.protocoltype='CLI' 
      ) rs1,
        
        (SELECT al2.TRANSACTIONID, al2.vendor, al2.requesttime, al2.operation, al2.status from (
    SELECT  x.TRANSACTIONID, x.vendor, x.requesttime,
            x.operation, x.status
     FROM SPAUDITLOG x where concat(concat(x.id,x.TRANSACTIONID),x.protocoltype) in 
     ( SELECT  distinct concat(concat(max(alx.id),alx.TRANSACTIONID),alx.protocoltype)
      from SPAUDITLOG alx    
         where 
         alx.REQUESTTIME >= &from_date AND 
         alx.REQUESTTIME < &to_date_exclude and 
         alx.protocoltype !='CLI'
       group by alx.TRANSACTIONID,alx.protocoltype 
       ) and x.application = 'NPCA'
      and x.OPERATION not in ( 'LOGIN', 'CLI DIRECT') and x.TRANSACTIONID is not null and x.vendor like '%dtran'
      and x.model is not null and x.vendor is not null) al2 
        where al2.status = &ceStat
     --   and         al2.model in(&cliDevices)  -- or al2.model like 'TA3%'
        ) rs2 where 
        rs1.TRANSACTIONID=rs2.TRANSACTIONID group by TO_CHAR(rs1.requesttime, 'MON/DD/YYYY')
        
        ) cResult, 
    
        (
          SELECT   
          TO_CHAR(al2.requesttime, 'MON/DD/YYYY') dateStr,
          count((case when al2.status = &ceStat then al2.transactionid end)) CECount 
          from 
          (
            SELECT  
              x.TRANSACTIONID, x.vendor, x.requesttime,x.respondtime,
              x.TOTALDURATION,x.operation, x.status,x.model
            FROM SPAUDITLOG x 
            where 
              concat(concat(x.id,x.TRANSACTIONID),x.protocoltype)in 
            ( 
              SELECT  
                distinct concat(concat(max(alx.id),alx.TRANSACTIONID),alx.protocoltype)
              from SPAUDITLOG alx    
              where 
                alx.REQUESTTIME >= &from_date AND 
                alx.REQUESTTIME < &to_date_exclude and 
                alx.protocoltype !='CLI'
              group by alx.TRANSACTIONID,alx.protocoltype 
            ) and  x.application = 'NPCA' and x.OPERATION not in ( 'LOGIN', 'CLI DIRECT') and 
            x.TRANSACTIONID is not null  and x.model is not null and x.vendor is not null and x.vendor like '%dtran'
          ) al2 
		   where al2.model in(&cliDevices)
           group by  TO_CHAR(al2.requesttime, 'MON/DD/YYYY')
        ) t1Result,
        (
          SELECT   
          TO_CHAR(x.requesttime, 'MON/DD/YYYY') dateStr, 
          count(x.TRANSACTIONID) TCount
         
          from 
          ( select y.username,y.TRANSACTIONID,y.operation,y.model,y.vendor, y.status, y.respondtime, y.requesttime from SPAUDITLOG y   
 where concat(y.id,y.TRANSACTIONID) in 
 (SELECT  distinct concat(max(alx.id),alx.TRANSACTIONID)
      from SPAUDITLOG alx where 
     alx.REQUESTTIME >= &from_date AND alx.REQUESTTIME < &to_date_exclude    
      and alx.application = 'NPCA' and alx.TRANSACTIONID is not null and alx.model is not null
      and alx.vendor is not null
      and alx.OPERATION not in ( 'LOGIN','CLI DIRECT') 
      -- and alx.operation not like 'ORDER:%'
        group by alx.TRANSACTIONID  )
    and y.application = 'NPCA' and y.operation != 'SEARCH'  and y.model is not null and y.Vendor is not null and y.username is not null and y.status != 'INVENTORY_ERROR'
      ) x, (select aly.username, min(aly.requesttime) as requesttime FROM SPAUDITLOG aly where aly.application = 'NPCA'
         and aly.operation in ('LOGIN', 'NEW INVENTORY') 
         and aly.REQUESTTIME >= &from_date AND 
      aly.REQUESTTIME < &to_date_exclude 
      group by aly.username) login,
	  (select y.transactionid, min(y.requesttime) as requesttime FROM SPAUDITLOG y 
      where y.application = 'NPCA' AND y.operation   not in ('NEW INVENTORY') and y.REQUESTTIME >= &from_date AND 
  y.REQUESTTIME < &to_date_exclude and y.model is not null and y.vendor is not null
  group by y.transactionid) mintime where x.username=login.username and  mintime.transactionid=x.TRANSACTIONID AND x.vendor LIKE '%dtran' AND x.model IS NOT NULL
  GROUP BY TO_CHAR(x.requesttime, 'MON/DD/YYYY')
     ) t2Result
     where cResult.dateStr=t1Result.dateStr  and t1Result.dateStr = t2Result.dateStr
     order by  cResult.datestr