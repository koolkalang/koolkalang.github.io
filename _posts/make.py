import os
import time
import re

for filename in os.listdir("."):
    if filename == 'post':
        post = open(filename)
        break


# extract parts
line = (post.readline()).rstrip('\r\n')
print line
if not line.strip():
	exit()
tags = (post.readline()).rstrip('\r\n')
date =  time.strftime("%Y-%m-%d-")
title = re.sub('[ ]', '-', line)
postname = date + title + ".md"

tags = tags.split( )
new_tags = ''
for tag in tags:
    new_tags = new_tags + '- ' + tag + '\n'

header = "---\nlayout: post\ntitle: " + line + "\ntags:\n" + new_tags + "---\n"


file = open(postname, 'w')
file.write(header)
while True:
    buffer=post.readline()
    if not buffer: break
    file.write(buffer)

file.write("\n---")
file.close()


