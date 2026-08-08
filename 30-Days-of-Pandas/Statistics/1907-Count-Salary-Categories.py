import pandas as pd

def count_salary_categories(accounts: pd.DataFrame) -> pd.DataFrame:
    accounts['category'] = accounts['income'].case_when([
        (accounts['income'] < 20000, 'Low Salary'),
        (accounts['income'] > 50000, 'High Salary'), 
        (accounts['income'] >= 20000, 'Average Salary')])
    result = accounts.groupby('category', as_index = False)['account_id'].count().rename(columns = {'account_id': 'accounts_count'})
    categories = pd.DataFrame({'category': ['Low Salary', 'Average Salary', 'High Salary']})
    result = pd.merge(result, categories, on = 'category', how = 'right')
    result['accounts_count'] = result['accounts_count'].fillna(0)
    return result