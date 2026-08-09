import pandas as pd

def students_and_examinations(students: pd.DataFrame, subjects: pd.DataFrame, examinations: pd.DataFrame) -> pd.DataFrame:
    exam_counts = examinations.groupby(['student_id', 'subject_name']).size().reset_index(name='attended_exams')
    st_sub = pd.merge(students, subjects, how='cross')
    res = pd.merge(st_sub, exam_counts, on=['student_id', 'subject_name'], how='left')
    res['attended_exams'] = res['attended_exams'].fillna(0).astype(int)
    return res.sort_values(by=['student_id', 'subject_name'])