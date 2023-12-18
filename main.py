import os
from tkinter import Tk
from tkinter.messagebox import askyesno

services = (
    'svcMayaDSes',
    'SvcMayaEC',
    'sService Agent Launcher',
    'sServiceLoopBack'
)
for service in services:
    print(f'{service} 사용 안 함으로 변경하는 중...')
    os.system(f'sc config "{service}" start=disabled')

root = Tk()
root.withdraw()

reboot = askyesno('재부팅', '컴퓨터를 재부팅 하시겠습니까? (권장)')
if reboot:
    os.system('shutdown /r -t 5')
os.system('pause')
