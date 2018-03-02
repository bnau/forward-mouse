import pandas as pd
import os
import sys
from shutil import copyfile

targetFile = open('./signals.csv', 'w', encoding='utf8') 

copyfile('./'+sys.argv[1], './tmp.csv')
duplicateFile = open('./tmp.csv', 'r')

strings = duplicateFile.read().split('\n')

print(strings)

for string in strings:
	



# exec(open("D:/Projets/CNCP/doc/reprise/insert_type_code.py").read(), globals())