import sys
import os
import sys_path
sys.path.append(os.path.abspath(sys_path.automation))
sys.path.append(os.path.abspath(sys_path.npca_cli))
#import Excelgenerator_auto
import Excelgenerator_CLI
#import traceback

if __name__ == '__main__':
    try:
        if len(sys.argv) != 3:
            print("Usage: 'python main_script.py' <'month'> <'year'> ")
            sys.exit(1)
        print(sys.argv[1], sys.argv[2])
        month ,year = sys.argv[1], sys.argv[2]

        if not (month.isalpha() and len(month) == 3 and year.isnumeric() and len(year) == 4):
            raise ValueError("The input format is incorrect. Please make sure to enter the month in its abbreviated three-letter format (e.g. JAN, FEB, MAR), followed by the year in four-digit format (e.g. 2023), separated by a space. ")
        
        # c0 = Excelgenerator_auto.Automation_billing(month ,year)
        # c0.excel_report()
        c1 =Excelgenerator_CLI.CLI_Reports(month ,year)
        c1.excel_report('Tellabs') 
        c1.excel_report('Adtran')       
          

    except Exception as e:
        print(f"Exception  in the main file: {e}")
        # tb = traceback.extract_tb(e.__traceback__)
        # filename, line_no, func, line = tb[-1]
        # err_msg = f"Error occurred in line {filename, line_no, func, line}: {e}"
        # print(err_msg)
        