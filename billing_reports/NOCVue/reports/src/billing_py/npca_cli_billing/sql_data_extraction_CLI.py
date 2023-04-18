from oracledb_CLI import *


class SqlDataExtractor:
        def __init__(self):
            self._db = OracleDB()
                  
        def extract_sql_data(self, from_date, to_date,database_option,database_appli,sql_path):
            
            if database_option=='Tellabs':
                file_extension='NPCA-CLI-Switch-Monthly-Billing_TELLABS.SQL'
            elif database_option=='Adtran-Lumen':
                 file_extension='NPCA-CLI-Switch-Monthly-Billing_ADTRAN.SQL'
            else:
                 raise FileNotFoundError("Error in extract_sql_data:Sql file not found")

            with open(sql_path +file_extension, 'r') as f:
                query = f.read()
            lines = query.split('\n')
            sql_content = lines[:]     
            my_string = '\n'.join(sql_content)
            new_string = my_string.replace('&from_date',"to_date('{}','dd/mm/yy')".format(from_date))
            final_string = new_string.replace('&to_date_exclude',"to_date('{}','dd/mm/yy')".format(to_date))
            final_string2 = final_string.replace('&ceStat',"'Communication Error'")
            if database_option=='Adtran-Lumen':
                final_string2 = final_string2.replace('&cliDevices',"'TA5000','TA3000', 'TA5004','TA1200F','TA1100F','TA5006', 'TAHDX','TA1148A','TA1148V','TA1248A','TA1248V','TA1148VX','TA1108VP','TA1100D'")
            
            if database_appli!="lumen":
                final_string2 = final_string2.replace('SPAUDITLOG',"SPAUDITLOG_BRIGHTSPEED")
            else:
                final_string2 = final_string2.replace('SPAUDITLOG',"SPAUDITLOG_LUMEN")
            
            
            oracledb_statements = [statement.strip() for statement in final_string2.split(';') if statement.strip()]
            oracledb_statements = [s for s in  oracledb_statements  if 'define' not in s]
            try:
                conn = self._db.connect()
                curs = conn.cursor()
                for statement in oracledb_statements:
                    curs.execute(statement)
                result = curs.fetchall()
            except:
                raise
            finally:
                self._db.disconnect()

            return result
