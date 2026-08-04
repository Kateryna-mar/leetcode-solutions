import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    df = views[views['author_id'] == views['viewer_id']]
    df = df[['viewer_id']].rename(columns = {'viewer_id': 'id'}).sort_values(by = 'id').drop_duplicates()
    return df