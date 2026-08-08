import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    employee = employee['salary'].drop_duplicates().sort_values(ascending = False)
    if len(employee)<= 1:
        result = None
    else:
        result = employee.iloc[1]
    return pd.DataFrame({'SecondHighestSalary' : [result]})