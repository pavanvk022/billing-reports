 
define from_date="to_date('1-6-20', 'dd/mm/yy')";
define to_date_exclude="to_date('1-7-20', 'dd/mm/yy')";
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%256x%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
  update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%128x%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%512x%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%768x%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%1.5Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
  update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%1Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
    update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%2Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%3Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%4Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%5Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
   
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%6Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%7Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%8Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%9Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:<=10M' where portproifle like '%10Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
   
 update SPAUDITLOG set nso='SPEED:11-15M' where portproifle like '%11Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:11-15M' where portproifle like '%13Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:11-15M' where portproifle like '%15Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
   
 update SPAUDITLOG set nso='SPEED:16-25M' where portproifle like '%20Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
   
 update SPAUDITLOG set nso='SPEED:16-25M' where portproifle like '%22Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:16-25M' where portproifle like '%24Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:16-25M' where portproifle like '%25Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
   
 update SPAUDITLOG set nso='SPEED:26-50M' where portproifle like '%30Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:26-50M' where portproifle like '%40Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:26-50M' where portproifle like '%50Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:51-100M' where portproifle like '%60Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:51-100M' where portproifle like '%80Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:101-200M' where portproifle like '%100Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:101-200M' where portproifle like '%200Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

 update SPAUDITLOG set nso='SPEED:201-500M' where portproifle like '%300Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:201-500M' where portproifle like '%400Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:201-500M' where portproifle like '%500Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

 update SPAUDITLOG set nso='SPEED:>501M' where portproifle like '%1024Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 update SPAUDITLOG set nso='SPEED:>501M' where portproifle like '%940Mx%' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
 
  update SPAUDITLOG set nso='SPEED:Video_0x1G' where portproifle like 'Video_0x1G' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude and technology like '%GPON_%' ;
 update SPAUDITLOG set nso='SPEED:HSI_Only' where portproifle like 'HSI_Only' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude and technology like '%GPON_%' ;
 update SPAUDITLOG set nso='SPEED:IPTV_Unicast' where portproifle like 'IPTV_Unicast' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude and technology like '%GPON_%' ;
 update SPAUDITLOG set nso='SPEED:VDSLHSIandUnicastMap' where portproifle like 'VDSLHSIandUnicastMap' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude and technology like '%GPON_%'  ;
 update SPAUDITLOG set nso='SPEED:cbras' where portproifle like 'cbras' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude and technology like '%GPON_%' ;

 commit;
