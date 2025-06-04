# Prgoram t
import paramiko
import time
import sys
import socket
import logging
#import logging.config
import logger_jtf

class TargetConnection:



    def __init__(self, hostname, username, password):
        self.hostname = hostname
        self.username = username
        self.password = password
        self.ssh_client = None
        self.sftp_client = None
        self.logger = logging.getLogger("ExecuteCommand")
        self.logger.info("TargetConnection class is initialized.")

    def _terminate_script(self):
        self.ssh_client.close()
        self.logger.error("Terminating the script due unsuccessful connection to target.")
        print("Terminating the script due unsuccessful connection to target.")
        sys.exit(1)

    def connect(self):
        """
        Connect to the remote server using SSH.
        """

        # Initialize the SSH client

        self.ssh_client = paramiko.SSHClient()

        # Automatically add the host key from the remote machine
        self.ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

        # Connect to the remote server
        self.logger.info(f"Connecting to {self.hostname}...")
        try:
            self.ssh_client.connect(self.hostname, username=self.username, password=self.password)
            self.logger.info(f"SSH connection to {self.hostname} is established successfully")
        except paramiko.AuthenticationException:
            self.logger.error("Authentication failed. Please verify your credentials.")
            self._terminate_script()
        except paramiko.SSHException as sshException:
            self.logger.error(f"Unable to establish SSH connection: {sshException}")
            self._terminate_script()
        except socket.timeout:
            self.logger.error("Connection timed out. The server may be unreachable.")
            self._terminate_script()
        except socket.error as socketError:
            self.logger.error(f"Socket error: {socketError}")
            self._terminate_script()
        except ValueError as ve:
            if str(ve) == "p must be exactly 1024, 2048, 3072, or 4096 bits long":
                self.logger.error("Invalid key length: p must be exactly 1024, 2048, 3072, or 4096 bits long.")
                self.logger.error("Invalid hostname or IP address.")
            else:
                self.logger.error("Invalid hostname or IP address.")
            self._terminate_script()
        except Exception as e:
            self.logger.error(f"An unexpected error occurred: {e}")
            self._terminate_script()

            # Start SFTP session
        #self.sftp_client = self.ssh_client.open_sftp() #not required
        #print("*********SFTP Connection established.*************")


    def execute_command(self, command):
        """
        Execute a single command on the remote server and return output and error.
        """
        if self.ssh_client is None:
            self.logger.error("No connection established.")
            return None, "No connection established."

        try:
            print(f"***********Executing command: {command} ******************")
            stdin, stdout, stderr = self.ssh_client.exec_command(command)
            time.sleep(1)

            # Read command output and error
            output = stdout.read().decode()
            error = stderr.read().decode()

            #print("Output:")
            #print(output)

            if error:
                self.logger.warning(f"Error:{error}")

            return output, error
        except Exception as e:
            self.logger.warning(f"An error occurred during command execution: {e}")
            return None, str(e)

    def execute_commands(self, commands):
        """
        Execute multiple commands sequentially.
        If the reset command is encountered, handle the reset and continue execution.
        """
        for command in commands:
            output, error = self.execute_command(command)

            # If the command is the reset command, handle reset logic
            if command == "/opt/gem/scripts/reset-with-persistence.sh":
                self.logger.info("Reset command detected, waiting for reset to complete...")

                # Simulating a wait time for the system reset to complete
                time.sleep(100)  # Adjust sleep time based on the expected reset duration


    def close_connection(self):
        """
        Close the SSH connection to the remote server.
        """
        if self.ssh_client:
            self.ssh_client.close()
            self.logger.info("Connection closed.")
        else:
            self.logger.info("No active connection to close.")



# Example usage


