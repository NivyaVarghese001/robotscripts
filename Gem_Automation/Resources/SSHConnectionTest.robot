*** Settings ***
Library    ../HelpersLib/Initialize.py
Resource    ../Data/AutomatedInputData.robot


*** Variables ***

#${USER_NAME}      root
#${PASSWORD}
${SSHConnectionTestRemoteLocationToCopyFile_rc.d}    /etc/rc.d/rc.local

*** Keywords ***

Connect to Target and copy rc.local
    ${LocalFileLocationToCopy_rc.local}=      Initialize.Create rc.local file
    sleep    3s
    Initialize.Establish SSH Connection    ${TARGET_IP}    ${USER_NAME}    ${PASSWORD}
    log    SSH Connection established to ${TARGET_IP} as ${USER_NAME}
    Initialize.Copy File To Remote        ${LocalFileLocationToCopy_rc.local}    ${SSHConnectionTestRemoteLocationToCopyFile_rc.d}
    log    File copied to remote server at ${SSHConnectionTestRemoteLocationToCopyFile_rc.d}
    Initialize.Change RemoteFilePermissions         ${SSHConnectionTestRemoteLocationToCopyFile_rc.d}    755

Disconnect Connection
    Initialize.Close SSH Connection




