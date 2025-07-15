
import datetime
import os

#def update_and_copy_rc_local(self, local_path, remote_path):
    #step1 : Update the date line locally
def create_rc1_local():
    now = datetime.datetime.utcnow()
    date_cmd = now.strftime('date -s "%m/%d/%Y %H:%M:%S"')
    #print(os.getcwd())

    data_dir = '../Data'
    file_path = os.path.join(data_dir, 'rc.local')
    with open(file_path, 'w') as f :
        f.write('\n#!/bin/sh\n\n')
        f.write(f'{date_cmd}')

create_rc1_local()