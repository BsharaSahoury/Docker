import time
start_time = time.time()

with open('/home/Docker-proj/volume/Output.txt', 'w') as f:
    f.write('Python.py file output\n')

#time.sleep(10)

if (time.time() - start_time) >= 10:
    with open('/home/Docker-proj/volume/Output.txt', 'w') as f:
        f.write('Failed test\n')
