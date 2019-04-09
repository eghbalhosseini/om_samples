from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
import numpy as np
import sys
##

def func_python_code(job_id):
    print('I am running Job # '+ str(job_id))
    return str(job_id)


value = int(sys.argv[1])
func_python_code(value)
print('end of job')
