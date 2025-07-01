import os
import re

def extract_variables_from_robot_file(file_path):
    variables = []
    with open(file_path, 'r') as file:
        lines = file.readlines()
        in_variables_section = False
        for line in lines:
            if line.strip().startswith("*** Variables ***"):
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
    all_variables = []
    for root, _, files in os.walk(project_path):
        for file in files:
            if file.endswith(".robot"):
                file_path = os.path.join(root, file)
                variables = extract_variables_from_robot_file(file_path)
                all_variables.extend(variables)
    return all_variables

def write_variables_to_robot_file(output_file, variables):
    with open(output_file, 'w') as file:
        file.write("*** Variables ***\n")
        for variable in variables:
            file.write(variable + "\n")

# Define project path and output file
project_path = r"C:\PycharmProjects\robot-scripts\Gem_Automation"
output_file = r"C:\PycharmProjects\robot-scripts\Gem_Automation\Data\AutomatedInputData.robot"

# Collect and write variables
variables = collect_variables_from_project(project_path)
write_variables_to_robot_file(output_file, variables)