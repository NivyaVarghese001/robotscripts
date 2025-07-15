from robot.api.deco import keyword
import paramiko
import datetime
import os

class Initialize:
    def __init__(self):
        self.client = None

    @keyword('Establish SSH Connection')
    def establish_ssh_connection(self, hostname, username, password):
        try:
            self.client = paramiko.SSHClient()
            self.client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            self.client.connect(hostname, username=username, password=password)

        except Exception as e:
            raise Exception(f"Failed to establish SSH connection: {e}")

    @keyword('Close SSH Connection')
    def close_ssh_connection(self):
        try:
            if self.client:
                self.client.close()
                self.client = None
        except Exception as e:
            raise Exception(f"Failed to close SSH connection: {e}")

    @keyword('Copy File To Remote')
    def copy_file_to_remote(self, local_path, remote_path):
        if not self.client:
            raise Exception("SSH connection is not established.")
        try:
            sftp =self.client.open_sftp()
            sftp.put(local_path, remote_path)

            sftp.close()
        except Exception as e:
            raise Exception(f"Failed to copy file to remote: {e}")

    @keyword("Change RemoteFilePermissions")
    def change_remote_file_permissions(self, remote_path, mode):
        try:
            stdin, stdout, stderr = self.client.exec_command(f'chmod {mode} {remote_path}')
            exit_status = stdout.channel.recv_exit_status()
            if exit_status != 0:
                raise Exception(f"Failed to change permissions for {remote_path}: {stderr.read().decode()}")
        except Exception as e:
            raise Exception(f"Error in changing remote file permissions: {e}")

    @keyword("Create rc.local file")
    def create_rc1_local(self):
        try:
            now = datetime.datetime.utcnow()
            date_cmd = now.strftime('date -s "%m/%d/%Y %H:%M:%S"')
            base_dir = os.path.dirname(os.path.abspath(__file__))
            print(f"Currentbase path is {base_dir}")
            data_dir = os.path.normpath(os.path.join(base_dir, '..', 'Data'))
            print (f"Path to Data folder is {data_dir}")
            file_path = os.path.join(data_dir, 'rc.local')
            print(f"Path for created rc.local is {file_path}")
            if not os.path.isdir(data_dir):
                raise Exception(f"Data directory does not exist: {data_dir}")
            with open(file_path, 'w') as f:
                f.write('\n#!/bin/sh\n\n')
                f.write(f'{date_cmd}')
            return file_path

        except Exception as e:
            raise Exception(f"Error while creating rc.local file: {e}")







