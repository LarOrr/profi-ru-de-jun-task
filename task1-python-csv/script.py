import csv
import sys
import fileinput
import statistics
from typing import List

surnames = []
salaries = []


def process_row(row: str or List):
    values = row
    if row is str:
        print(1)
        values = row.split(DEFAULT_DELIMITER)
    surname = values[0]
    salary = int(values[1])
    surnames.append(surname)
    salaries.append(salary)


def analyze_collected_data():
    # Counting all 'by hands' for performance
    # It's also possible to do it separably with sum(), min(), etc.
    sum_salaries = 0
    min_salary = float('inf')
    max_salary = -1
    count_of_K = 0
    for i in range(len(salaries)):
        salary = salaries[i]
        surname = surnames[i]
        sum_salaries += salary
        min_salary = min(min_salary, salary)
        max_salary = max(max_salary, salary)
        if surname[0] == 'K':
            count_of_K += 1

    size = len(surnames)
    # Кол-во сотрудников;
    print("Number of employees:", size)
    # Общая сумма зарплат;
    print("Salary sum:", sum_salaries)
    # Средняя зарплата;
    mean = sum_salaries / size
    print("Mean salary:", mean)
    # Медиана от зарплат;
    print("Median:", statistics.median(salaries))
    # Минимальная зарплата;
    print("Min salary:", min_salary)
    # Максимальная зарплата;
    print("Max salary:", max_salary)
    # Кол-во сотрудников, получающих сумму строго большую, чем средняя зарплата.
    print("Count of employees with salary higher than mean:", sum(1 for s in salaries if s > mean))
    # Посчитать количество сотрудников, чьи фамилии начинаются на букву «K».
    print("Surnames with K:", count_of_K)
    #  Or like that sum(1 for s in surnames if s[0] == 'K')


DEFAULT_DELIMITER = " "

# Collecting data
if len(sys.argv) > 1:
    file_name = sys.argv[1]
    with open(file_name) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=DEFAULT_DELIMITER)
        for row in csv_reader:
            process_row(row)
else:
    # Getting data from stdin
    for row in fileinput.input():
        row = row.strip().strip("'").strip('"')
        process_row(row.split(DEFAULT_DELIMITER))

# Print data
analyze_collected_data()