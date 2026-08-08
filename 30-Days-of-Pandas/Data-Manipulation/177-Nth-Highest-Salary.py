import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:
    employee = employee['salary'].drop_duplicates().sort_values(ascending = False)
    if N > len(employee) or N <= 0:
        salary = None
    else:
        salary = employee.iloc[N-1]
    result = pd.DataFrame({f'getNthHighestSalary({N})': [salary]})
    return result