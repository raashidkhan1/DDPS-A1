#!/usr/bin/env python
import sys

for line in sys.stdin:
    line = line.strip()
    values = line.split(' ')
    for i in range(len(values)):
        if i > 1:
            print('%s\t%s' % (values[0], values[i]))
            tag = float(values[1]) / (len(values) - 2)
            print('%s\t%s' % (values[i], tag))

sys.exit(0)