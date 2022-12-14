#!/usr/bin/env python
import sys

current_key = None
key = None
damping = 0.85
page_num = 4
tag_list = []
out_link_arr = []


def page_rank(arr):
    result = (1 - damping) / page_num + damping * (sum(arr))
    return result


def is_float(str):
    try:
        float(str)
        return True
    except ValueError:
        return False


for line in sys.stdin:
    line = line.strip()
    key, value = line.split(' ')
    if current_key == key:
        if is_float(value):
            tag_list.append(float(value))
        else:
            out_link_arr.append(value)
    else:
        if current_key:
            new_pr = page_rank(tag_list)
            out_links = ''
            for out_link in out_link_arr:
                out_links += out_link + '\t'
            print('%s\t%s\t%s' % (current_key, new_pr, out_links))
            tag_list = []
            out_link_arr = []
            if is_float(value):
                tag_list.append(float(value))
            else:
                out_link_arr.append(value)
        else:
            if is_float(value):
                tag_list.append(float(value))
            else:
                out_link_arr.append(value)
        current_key = key

if current_key == key:
    new_pr = page_rank(tag_list)
    out_links = ''
    for out_link in out_link_arr:
        out_links += out_link + ' '
    print('%s\t%s\t%s' % (current_key, new_pr, out_links))

sys.exit(0)
