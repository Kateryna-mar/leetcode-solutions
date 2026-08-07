import pandas as pd

def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    result  = courses.groupby('class', as_index = False)['student'].count()
    result = result[result['student'] >= 5][['class']]
    return result