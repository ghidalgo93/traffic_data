# Gerardo Hidalgo-Cuellar
# cleaning up traffic data from Maryland somewhere
# Dec 1, 2017

import csv

infile = csv.reader(open('Traffic_Violations.csv', 'r'))
outfile = csv.writer(open('SpeedExceeded.csv', 'w'), delimiter = ',')


header = next(infile)
header.append('SpeedLimit')
header.append('SpeedCaught')
header.append('SpeedOver')
header.append('Hwy')
outfile.writerow(header)


for row in infile:
    if ('EXCEED' in row[4].upper() and 'SPEED' in row[4].upper()):
        description = row[4]
        split = description.split(' ')
        intsfound = []
        for word in split:
            try:
                intsfound.append(int(word))
            except:
                pass
        if len(intsfound) == 2:
            over = abs(intsfound[0] - intsfound[1])
            if over < 200 and min(intsfound)%5 == 0:
                row.append(min(intsfound))
                row.append(max(intsfound))
                row.append(over)
                if min(intsfound) < 55:
                    row.append('no')
                else:
                    row.append('yes')
                outfile.writerow(row)
