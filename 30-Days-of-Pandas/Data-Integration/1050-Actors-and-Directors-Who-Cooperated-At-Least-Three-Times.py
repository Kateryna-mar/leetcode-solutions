import pandas as pd

def actors_and_directors(actor_director: pd.DataFrame) -> pd.DataFrame:
    result = actor_director.groupby(['actor_id', 'director_id'], as_index = False)['timestamp'].count()
    result = result[result['timestamp'] >= 3]
    return result[['actor_id', 'director_id']]