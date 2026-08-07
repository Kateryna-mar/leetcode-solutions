import pandas as pd

def categorize_products(activities: pd.DataFrame) -> pd.DataFrame:
    result = activities.drop_duplicates().groupby('sell_date', as_index = False).agg(num_sold = ('product', 'count'), products = ('product', lambda x: ','.join(sorted(x)))).sort_values(by = 'sell_date')
    return result