from configparser import *
config_file = 'C:/Users/pavan.vasant/billing_reports/billing_reports/NOCVue/reports/src/billing_py/automation_billing/config.ini'
cf1 = ConfigParser()
try:
    cf1.read(config_file)
    file_path = cf1['file_path']
    file_name = cf1['file_name']
    application = cf1['application']

except Exception as e:
    print(f"Error loading configuration file: {e}")
