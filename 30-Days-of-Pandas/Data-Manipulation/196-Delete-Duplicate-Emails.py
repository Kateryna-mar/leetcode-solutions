import pandas as pd

def delete_duplicate_emails(person: pd.DataFrame) -> None:
    new = person.sort_values(by = ['email', 'id'])
    duplicates = new[new.duplicated(subset='email')].index
    person.drop(duplicates, inplace = True)