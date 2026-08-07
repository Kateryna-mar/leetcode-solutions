import pandas as pd

def count_unique_subjects(teacher: pd.DataFrame) -> pd.DataFrame:
    result = teacher.drop_duplicates(['subject_id', 'teacher_id']).groupby('teacher_id', as_index = False)['subject_id'].count()
    return result.rename(columns = {'subject_id': 'cnt'})