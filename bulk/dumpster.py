from glob import glob
from sys import argv
from time import sleep
from os import system as run
from os import path

# python3 dumpster.py <trash bin path> <dumpster path>

if not path.exists(argv[2]):
    run(f'mkdir {argv[2]}')

ls = lambda: glob(f'{argv[1]}/*')
isempty = lambda: ls()==[]

filetypes = ['bin', 'directories']

print(ls())
while 1:
    if isempty():
        sleep(10)
        continue
    
    print(ls())
    for file in ls():
        ff = file.split('.')
        ext = ''
        if len(ff) == 0:
            if os.path.isdir(file): ext = 'directories'
            else: ext = 'bin'
        else:
            ext = ff[-1]
        
        if not (ext in filetypes):
            run(f'mkdir "{argv[2]}/{ext}"')
            filetypes.append(ext)
        
        run(f'mv "{file}" "{argv[2]}/{ext}"')