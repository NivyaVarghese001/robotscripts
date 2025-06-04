# target_connection.py

from ExecuteCommand import TargetConnection

class RobotTargetConnection:

    def __init__(self, hostname, username, password=""):
        self.conn = TargetConnection(hostname, username, password)

    def connect(self):
        self.conn.connect()

    def execute_command(self, command):
        output, error = self.conn.execute_command(command)
        return output.strip()  # Clean it up for comparison

    def close_connection(self):
        self.conn.close_connection()
