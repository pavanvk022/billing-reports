 define from_date      ="to_date('1-12-22', 'dd/mm/yy')";
define to_date_exclude="to_date('1-01-23', 'dd/mm/yy')";
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
            )  and x.application = 'NPCA' and x.vendor like '%ellabs'
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
      and x.OPERATION not in ( 'LOGIN', 'CLI DIRECT') and x.TRANSACTIONID is not null and x.vendor like '%ellabs'
      and x.model is not null and x.vendor is not null) al2 
        where al2.status = &ceStat
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
              x.TOTALDURATION,x.operation, x.status
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
            x.TRANSACTIONID is not null  and x.model is not null and x.vendor is not null and x.vendor like '%ellabs'
          ) al2 
           group by  TO_CHAR(al2.requesttime, 'MON/DD/YYYY')
        ) t1Result,
        (
          SELECT   
          TO_CHAR(al2.requesttime, 'MON/DD/YYYY') dateStr, 
          count(al2.TRANSACTIONID) TCount
         
          from 
          (
            SELECT  
              x.TRANSACTIONID, x.vendor, x.requesttime,x.respondtime,
              x.TOTALDURATION,x.operation, x.status
            FROM SPAUDITLOG x 
            where 
              concat(concat(x.id,x.TRANSACTIONID), TO_CHAR(x.requesttime, 'MON/DD')) in 
            (SELECT  distinct concat(concat(max(al.id),al.TRANSACTIONID), TO_CHAR(al.requesttime, 'MON/DD'))
            from SPAUDITLOG al where 
           al.REQUESTTIME >= &from_date AND al.REQUESTTIME < &to_date_exclude   
            and al.application = 'NPCA' and al.TRANSACTIONID is not null 
            -- and al.operation not like 'ORDER:%' 
            and al.OPERATION not in ( 'LOGIN', 'CLI DIRECT')
            group by al.TRANSACTIONID,TO_CHAR(al.requesttime, 'MON/DD') ) and  x.vendor like '%ellabs' and x.model is not null  and x.username is not null
                    ) al2 
            group by  TO_CHAR(al2.requesttime, 'MON/DD/YYYY')
     ) t2Result
     where cResult.dateStr=t1Result.dateStr  and t1Result.dateStr = t2Result.dateStr
     order by  cResult.datestr