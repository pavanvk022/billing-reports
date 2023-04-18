
define from_date="to_date('1-6-20', 'dd/mm/yy')";
define to_date_exclude="to_date('1-7-20', 'dd/mm/yy')";
update SPAUDITLOG set technology='VDSL2_SL_HSI' where technology='C7_VDSL2_SL_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_HSI' where technology='e7VDSL2SLHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_HSI' where technology='VDSL2_SL_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_HSI' where technology='VDSL2_SingleLineHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_HSI' where technology='c7_vdsl2_sl_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_HSI' where technology='e348CVDSL2SLHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_HSI' where technology='e348CVDSL2SLHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_HSI' where technology='e348CVDSL2SLHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_Fallback_SL_HSI' where technology='ADSL2FallbackSingleLineHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_Fallback_SL_HSI' where technology='ADSL2_FALLBACK_SINGLELINE_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_Fallback_SL_HSI' where technology='e3-12c_adsl2_fallback_sl_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_Fallback_SL_HSI' where technology='e3-48_adsl2_fallback_sl_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_Fallback_SL_HSI' where technology='e5-120_adsl2_fallback_sl_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_Fallback_SL_HSI' where technology='e5-121_adsl2_fallback_sl_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_Fallback_SL_HSI' where technology='C7_ADSL2_Fallback_SL_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL2_ATM_SL_HSI' where technology='ADSL2_ATMSingleLineHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_ATM_SL_HSI' where technology='ADSL_ATM_SingleLineHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_ATM_SL_HSI' where technology='C7_ADSL2_ATM_SL_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_ATM_SL_HSI' where technology='ADSL_ATM_SingleLineHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='VDSL2_ATM_SL_HSI' where technology='C7_VDSL2_ATM_SL_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_HSI' where technology='ADSL2_BONDED_FALLBACK_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_HSI' where technology='C7_ADSL2_BONDED_Fallback_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_HSI' where technology='e3-48_adsl2_bonded_fallback_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_HSI' where technology='e7ADSL2_BondedGroupFallback' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_PRISM' where technology='ADSL2_BONDED_FALLBACK_PRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_PRISM' where technology='C7_ADSL2_BONDED_Fallback_Prism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_PRISM' where technology='e7ADSL2BondedFallbackPrism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_PRISM' where technology like '%adsl2_bonded_fallback_prism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_PRISM' where technology = 'ADSL2_BondedFallbackPrism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='VDSL2_SL_PRISM' where technology='e3-48_vdsl2_sl_prism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_PRISM' where technology='C7_VDSL2_SL_PRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_PRISM' where technology='VDSL2_SingleLinePRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_PRISM' where technology='e3-12c_vdsl2_sl_prism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_PRISM' where technology='e5-120_vdsl2_sl_prism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_PRISM' where technology='e5-121_vdsl2_sl_prism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='VDSL2_BONDED_PRISM' where technology='e3-48_vdsl2_bonded_prism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_PRISM' where technology='C7_VDSL2_Bonded_PRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_PRISM' where technology='e7VDSL2_BondedGroupPrism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_PRISM' where technology='VDSL2_BondedPRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;


update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology='e3-48_vdsl2_bonded_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology='c7_vdsl2_bonded_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology='C7_VDSL2_Bonded_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology='e3-48_vdsl2_bonded_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology='VDSL_Bonded_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology='VDSL2_BONDED_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology='e348CVDSL2_BondedHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology='VDSL2_BondedHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;


update SPAUDITLOG set technology='GPON_HSI' where technology='C7_GPON_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_HSI' where technology='ExGPONHsiOnt' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_HSI' where technology='GPONHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_HSI' where technology='C7_GPON_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_HSI' where technology='C7_BPON_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;


update SPAUDITLOG set technology='GPON_PRISM' where technology='C7_GPON_PRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_PRISM' where technology='ExGPONPrismOnt' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_PRISM' where technology='GPONPRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_PRISM' where technology='GPON_PRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_PRISM' where technology='C7_GPON_PRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='GPON_VOICE' where technology='C7_GPON_VOICE' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_VOICE' where technology='C7_BPON_VOICE' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_VOICE' where technology='ExGPON_VOICE' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='GPON_VOICE' where technology='GPONVOICE' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='VDSL2_BONDED_HSI' where technology like 'VDSL2BondedGroup' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_HSI' where technology like '%adsl2_bonded_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_HSI' where technology like 'ADSL2_BondedHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;


update SPAUDITLOG set technology='ADSL2_BONDED_PRISM' where technology like '%adsl2_bondedline_prism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_PRISM' where technology like 'C7_ADSL2_Bonded_PRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_PRISM' where technology like 'ADSL2_BondedPrism' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL2_SL_HSI' where technology like '%adsl2_sl_hsi' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_SL_HSI' where technology = 'ADSL2_SingleLineHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_SL_HSI' where technology = 'e7ADSL2SLHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL_ETH_BONDED_HSI' where technology = 'C7_ADSL2_ETHERNET_BONDED_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL_ETH_BONDED_HSI' where technology = 'ADSL_Ethernet_BondedHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL_ETH_BONDED_HSI' where technology = 'ADSL_Ethernet_BondedHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL_ETH_SL_HSI' where technology = 'C7_ADSL2_ETHERNET_SL_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL_ETH_SL_HSI' where technology = 'ADSL_Ethernet_SingleLineHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL_ETH_SL_HSI' where technology = 'C7_ADSL2_ETHERNET_SL_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;


update SPAUDITLOG set technology='ADSL2_SL_FALLBACK_HSI' where technology='ADSL2_Fallback_SL_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL2_ATM_BONDED_HSI' where technology='C7_ADSL2_ATM_BONDED_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='VDSL2_SL_PRISM' where technology='VDSL2SLPRISM' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;


update SPAUDITLOG set technology='ADSL2_ATM_BONDED_FALLBACK_HSI' where technology='C7_ADSL2_ATM_BONDED_Fallback_HSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;
update SPAUDITLOG set technology='ADSL2_BONDED_FALLBACK_HSI' where technology='ADSL2_BondedFallbackHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

update SPAUDITLOG set technology='ADSL2_ATM_BONDED_HSI' where technology='ADSL_ATM_BondedHSI' and REQUESTTIME >= &from_date AND REQUESTTIME < &to_date_exclude ;

commit;
