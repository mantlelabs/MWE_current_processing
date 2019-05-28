#!/usr/bin/env python3

#  can be used from command line to run jobs, like:
#   ./add_job.py testinput1 testinput2 testinput3


from job import do_work
import sys


input_images = sys.argv[1:]

for image in input_images:

    #  use delay method from rq to add to queue
    do_work.delay(image)
