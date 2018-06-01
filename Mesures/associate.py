import pandas as pd
import os
import sys
from shutil import copyfile

# targetFile = open('./signals.csv', 'w', encoding='utf8') 

# copyfile('./'+sys.argv[1], './tmp.csv')
# duplicateFile = open('./tmp.csv', 'r')

# strings = duplicateFile.read().split('\n')

# print(strings)

# for string in strings:
	



# exec(open("D:/Projets/CNCP/doc/reprise/insert_type_code.py").read(), globals
# python associate.py data.csv 

# RELACHE_CLIC
# souris bouge 
# CLIC_ACTIF
actifClic = False;
etats_souris = {};
copyfile('./'+sys.argv[1], './tmp.csv')
ir1 = "0"
ir2 = "0"
curLine = 2
# with open('./signals.csv', 'a', encoding='utf8') as signal: 
	# with open('./tmp.csv', 'r', encoding='utf8') as data:
		# data_lines = data.readlines();
		# for line in data_lines: 
			# if line.startswith("RELACHE_CLIC"):
				# actifClic = False
			# elif line.startswith("CLIC_ACTIF"):
				# actifClic = True
			# if "souris bouge" in line:
				# infos = line.strip().split(" ")
				# if (ir1, ir2) in etats_souris and etats_souris[(ir1, ir2)] != [infos[-2], infos[-1], actifClic]:
					# raise Exception('la clé existe déjà ' + ir1 + " " + ir2 + str([infos[-2], infos[-1], actifClic]))
				# etats_souris[(ir1, ir2)] = [infos[-2], infos[-1], actifClic]
				# print('souris bouge : '+ ir1 + " " + ir2  + str(etats_souris[(ir1, ir2)]))
				# ir1 = 0;
				# ir2 = 0;
			# elif ir1 == 0:
				# ir1 = line.strip();
			# elif ir2 == 0:
				# ir2 = line.strip();

				
				
				
with open('./signals.csv', 'a', encoding='utf8') as signal: 
	with open('./tmp.csv', 'r', encoding='utf8') as data:
		data_lines = data.readlines();
		for line in data_lines: 
			if line.startswith("RELACHE_CLIC"):
				actifClic = False
			elif line.startswith("CLIC_ACTIF"):
				actifClic = True
			if "souris bouge" in line:
				infos = line.strip().split(" ")
				if (ir1, ir2) in etats_souris and etats_souris[(ir1, ir2)] != [infos[-2], infos[-1], actifClic]:
					raise Exception('la clé existe déjà ' + ir1 + " " + ir2 + str([infos[-2], infos[-1], actifClic]))
				etats_souris[(ir1, ir2)] = [infos[-2], infos[-1], actifClic]
				print('souris bouge : '+ ir1 + " " + ir2  + str(etats_souris[(ir1, ir2)]))
				# ir1 = 0;
				# ir2 = 0;
			else:
				ir1 = ir2;
				ir2 = line.strip();