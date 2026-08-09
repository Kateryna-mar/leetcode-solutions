import pandas as pd

def sales_person(sales_person: pd.DataFrame, company: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    company = company[company['name'] == 'RED']
    com_ord = pd.merge(orders, company, on = 'com_id', how = 'right')
    sel = pd.merge(com_ord, sales_person, on = 'sales_id', how = 'left')
    name_red = sel['name_y']
    result = sales_person.loc[~sales_person['name'].isin(name_red)]
    return result[['name']]