#!/usr/bin/env python

from __future__ import print_function
import sys
from os import path
from time import sleep
import subprocess

cmd = sys.argv[1:]

dot = '...'
fname = '/etc/ssl/certs/dhparam.pem'

count = 0
while not path.isfile(fname):
    end = count % 3 + 1

    print('Running dhparam {0:3}'.format(dot[0:end]), end='\r')
    sys.stdout.flush()

    count += 1
    sleep(1)

print('\ndhparam done!')
sys.stdout.flush()

subprocess.call(cmd)
