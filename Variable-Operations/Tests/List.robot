*** Settings ***
#robot -d ../Results List.robot
*** Variables ***
@{LIST_VARIABLES}    list1    list2    list3     #define a list variable with prefix @ and when you call the elements of the list you should use ${List_Variables}[0] or ${List_Variables}[1] or ${List_Variables}[2]
*** Test Cases ***
Show list variables
    LOG    ${LIST_VARIABLES}[0]
    LOG    ${LIST_VARIABLES}[1]
    LOG    ${LIST_VARIABLES}[2]

Show list variables 2
   # @{list_variable}    Set Variable    setlist1    setlist2    setlist3 # to define  a list    you can use both Set Variable and Create List but more recommended to use Create List
   @{list_variable}    Create List    setlist1    setlist2    setlist3
    LOG    ${list_variable}[0]
    LOG    ${list_variable}[1]
    LOG    ${list_variable}[2]

*** Keywords ***

