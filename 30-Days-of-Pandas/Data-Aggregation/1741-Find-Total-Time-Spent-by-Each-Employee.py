import pandas as pd

def total_time(employees: pd.DataFrame) -> pd.DataFrame:
  employees['time_spend']  = employees['out_time'] - employees['in_time']
  result = employees.groupby(['emp_id', 'event_day'], as_index = False)['time_spend'].sum()
  return result.rename(columns = {'event_day': 'day', 'time_spend': 'total_time'})