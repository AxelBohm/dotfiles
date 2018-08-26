#!/usr/bin/env python

import os
import pandas as pd

# params
filename = '.csv'
subject = 'test results'
email_body = ''
signature = ''


results = pd.read_csv(filename)
df = results[['Vorname', 'E-Mail-Adresse', 'second_test']]

for _, row in df.iterrows():
    email_content = f'''Hi {row["Vorname"]},
    {email_body}
    Your result is {row["second_test"]} out of 10 Points.
    {signature}'''
    command = f'echo {email_content!r} | neomutt -s {subject!r} {row["E-Mail-Adresse"]}'
    os.system(command)


os.system("echo 'done..'")
