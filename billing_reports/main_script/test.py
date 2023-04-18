import sys


# Remove the last directory from the path
paths =sys.path

paths.remove('C:\\Users\\pavan.vasant\\billing_reports\\billing_reports\\NOCVue\\reports\\src\\billing_py\\automation_billing')

# Alternatively, you can remove a specific directory by specifying its index
# For example, to remove the directory at index 2:
# sys.path.pop(2)

# Print the updated path
print(sys.path)
#python -c "import sys; sys.path.remove('C:\\Users\\pavan.vasant\\billing_reports\\billing_reports\\NOCVue\\reports\\src\\billing_py\\automation_billing');sys.path.remove('C:\\Users\\pavan.vasant\\billing_reports\\billing_reports\\NOCVue\\reports\\src\\billing_py\\npca_cli_billing'); print(sys.path)"

####################################################################################################
import sys
import site
import os

# # Get the path to the site-packages directory
# site_packages = site.getsitepackages()[0]

# # Create a new .pth file in the site-packages directory
# pth_file = os.path.join(site_packages, "my_paths.pth")

# # Write the directory path to the .pth file
# with open(pth_file, "w") as f:
#     f.write('C:\\Users\\pavan.vasant\\billing_reports\\billing_reports\\NOCVue\\reports\\src\\billing_py\\')
sys.path.append(os.path.abspath('C:/Users/pavan.vasant/billing_reports/billing_reports/billing_reports/NOCVue/reports/src/billing_py/automation_billing/'))
sys.path.append(os.path.abspath('C:/Users/pavan.vasant/billing_reports/billing_reports/billing_reports/NOCVue/reports/src/billing_py/automation_billing/conf1_auto.py'))
#os.path('C:/Users/pavan.vasant/billing_reports/billing_reports/billing_reports/NOCVue/reports/src/billing_py/')
#sys.path.append('/billing_reports/billing_reports/NOCVue/reports/src/billing_py/npca_cli_billing/')
from automation_billing import Excelgenerator_auto
#from npca_cli_billing import  Excelgenerator_CLI
import traceback
if __name__ == '__main__':
    try:
        if len(sys.argv) != 4:
            print("Usage: 'python main_script.py' <'month'> <'year'> ")
            sys.exit(1)

        month ,year = sys.argv[1], sys.argv[2]

        # if not (month.isalpha() and len(month) == 3 and year.isnumeric() and len(year) == 4):
        #     raise ValueError("The input format is incorrect. Please make sure to enter the month in its abbreviated three-letter format (e.g. JAN, FEB, MAR), followed by the year in four-digit format (e.g. 2023), separated by a space. ")
        
        c0 = Excelgenerator_auto.Automation_billing(month ,year)
        c0.excel_report()
        # c1 = Excelgenerator_CLI.CLI_Reports_adtran(month ,year, appli)
        # c1.excel_report()       
        # c2 = Excelgenerator_CLI.CLI_Reports_tellabs(month ,year, appli)
        # c2.excel_report()    

    except Exception as e:
        print(f"Exception  in the main file: {e}")
        tb = traceback.extract_tb(e.__traceback__)
        filename, line_no, func, line = tb[-1]
        err_msg = f"Error occurred in line {filename, line_no, func, line}: {e}"
        print(err_msg)
        