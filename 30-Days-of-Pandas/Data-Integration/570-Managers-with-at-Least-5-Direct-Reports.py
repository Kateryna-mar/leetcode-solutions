import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    count_num = employee.groupby('managerId', as_index = False).count()
    count_num = count_num[count_num['id'] >= 5]
    result = pd.merge(count_num, employee, left_on = 'managerId', right_on = 'id', how = 'inner')
    result = result[['name_y']].rename(columns = {'name_y': 'name'})
    return result