# Gerardo Hidalgo-Cuellar
# cleaning up traffic data from Maryland somewhere
# Dec 1, 2017

import csv

#importing data and making a new data csv file
infile = csv.reader(open('../data/Traffic_Violations.csv', 'r'))
outfile = csv.writer(open('../data/SpeedExceeded.csv', 'w'), delimiter = ',')

#writing header from old data and applying it to new data
header = next(infile)
#adding some columns to new data
header.append('Time.Of.Day_decimal')
header.append('DayOfMonth')
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
                ts = row[1].split(":") #ts is time stamp
                row.append(float(ts[0])+float(ts[1])/60+float(ts[2])/3600)
                date = row[0].split("/")
                row.append(date[1])
                row.append(min(intsfound))
                row.append(max(intsfound))
                row.append(over)
                if min(intsfound) < 55:
                    row.append('no')
                else:
                    row.append('yes')
                outfile.writerow(row)
