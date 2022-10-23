#!/usr/bin/env python 
#test.py

import multiprocessing
import time

start_time = time.time()

def foo():
    with open('/home/Docker-proj/volume/Output.txt', 'w') as f:
    f.write('Python.py file output\n')
    exit()

if __name__ == '__main__':
    # Start foo as a process
    p = multiprocessing.Process(target=foo, name="Foo")
    p.start()
     
    # Wait 10 seconds for foo
    time.sleep(10)
    
    # Terminate foo
    p.terminate()

    # Cleanup
    p.join()
    
    with open('/home/Docker-proj/volume/Output.txt', 'w') as f:
        f.write('Failed test\n')
