import pandas as pd

def largest_orders(orders: pd.DataFrame) -> pd.DataFrame:
    result = orders.groupby('customer_number', as_index = False)['order_number'].count()
    result = result[result['order_number'] == result['order_number'].max()]
    return result[['customer_number']].drop_duplicates()