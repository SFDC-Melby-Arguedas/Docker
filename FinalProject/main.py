# This is a sample Python script.

import datetime
import socket
import time

now = datetime.datetime.now()
hostname = socket.gethostname()
Ipaddr = socket.gethostbyname(hostname)
timezone1 = time.timezone
converted_num = str(timezone1)

print("Current date and time : ")
print(now.strftime("%Y-%m-%d %H:%M:%S"))
print("Your Computer Name is:" + hostname)
print("Your Computer IP Address is:" + Ipaddr)
print("The timezone of your computer is:" + converted_num)
