import re
import os

def collect_variables_from_robot_file(file_path):
    variables = []
    with open(file_path, 'r') as file:
        lines = file.readlines()
        print(lines)
        in_variables_section = False
        for line in lines:
            if line.strip().startswith('*** Variables ***'):
                in_variables_section = True
                continue
            if in_variables_section:
                if line.strip().startswith("***"):
                    break
                match = re.match(r"^\${.*?}.*$", line.strip())
                if match:
                    variables.append(line.strip())

    return variables

def collect_variables_from_project(project_path):
    allvariables = []

    for root, _, files in os.walk(project_path):
        for file in files:
            if file.endwith(".robot"):
                file_path = os.path.join(root, file)
                variables = collect_variables_from_robot_file(file_path)
                allvariables.extend(variables)
    return allvariables

def write_variables_to_robot_file(output_file, variables):
    with open(output_file,'w') as file:
        file.write("*** Variables ***\n")
        for variable in variables:
            file.write(variable + "\n")

project_path = r"C:\PycharmProjects\robot-scripts\Gem_Automation"
output_file = r"C:\PycharmProjects\robot-scripts\Gem_Automation\Data\AutomatedInputData.robot"

# Collect and write variables
variables = collect_variables_from_project(project_path)
write_variables_to_robot_file(output_file, variables)









