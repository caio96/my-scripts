import argparse

parser = argparse.ArgumentParser()
parser.add_argument("file", help="displays lines of an rsync output file that don't start with '.'", type=str)
args = parser.parse_args()

with open(args.file, 'r') as f:
	for line in f:
		line = line.rstrip('\n')
		if len(line) > 0:
			if line[0] != '.':
				print(line)
