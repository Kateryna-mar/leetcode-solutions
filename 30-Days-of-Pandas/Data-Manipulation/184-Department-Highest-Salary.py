import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    salary_max = employee.groupby('departmentId', as_index = False)['salary'].max()
    salary_name = pd.merge(salary_max, employee, left_on = ['salary', 'departmentId'], right_on = ['salary', 'departmentId'], how = 'inner' )[['departmentId', 'name', 'salary']].rename(columns = {'name': 'Employee'})
    result = pd.merge(salary_name, department, left_on = 'departmentId', right_on = 'id')
    return result[['name', 'Employee', 'salary']].rename(columns = {'name': 'Department', 'salary': 'Salary'})