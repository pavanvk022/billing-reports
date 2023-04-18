import sys
#sys.path.append('/billing_reports/billing_reports/NOCVue/reports/src/billing_py/automation_billing/')
sys.path.append('/billing_reports/billing_reports/NOCVue/reports/src/billing_py/npca_cli_billing/')

#import Excelgenerator_auto
import Excelgenerator_CLI
if __name__ == '__main__':
    try:
        if len(sys.argv) != 3:
            print("Usage: python main_script.py <date> <application>")
            sys.exit(1)

        date, appli = sys.argv[1], sys.argv[2]

        # c = Excelgenerator_auto.Automation_billing(date, appli)
        # c.excel_report()
        c = Excelgenerator_CLI.CLI_Reports_adtran(date, appli)
        c.excel_report()       
        c1 = Excelgenerator_CLI.CLI_Reports_tellabs(date, appli)
        c1.excel_report()    

    except Exception as e:
        print(f"Error in main: {e}")