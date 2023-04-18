import cx_Oracle
import configuration_CLI as conf1_CLI
import pandas as pd 
class OracleDB:
    def __init__(self):
        self.connect1=conf1_CLI.connect.get('Connect')
        self.connection = None

    def connect(self):
        try:
            self.connection = cx_Oracle.connect(f'{self.connect1}')
            print("Database is Connected")
            return self.connection
        except Exception as e:
            print(f"Error connecting to Oracle Database: {str(e)}")
            self.connection = None

    def disconnect(self):
        try:
            if self.connection is not None:
                self.connection.close()
                print("Database is disconnected")
        except Exception as e:
            print(f"Error disconnecting from Oracle Database: {str(e)}")
