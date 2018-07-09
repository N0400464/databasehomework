import sympy
import logging
from db import DataBase


nameFile=input()

def set_model(equataion, solution):
    try:
        DataBase.callFunction('set_model', equataion, solution)
        return True
    except BaseException as e:
        print(str(e))
        return False

def add_log(equataion, log_text):
    try:
        DataBase.callFunction('add_log', equataion, log_text)
    except BaseException as e:
        print(str(e))

with open(nameFile, "r") as t:
        for line in t:
           equataion = str(line)
           try:
               s = sympy.solve(line)
               set_model(equataion, str(s))
           except:
               if set_model(equataion, None):
                   add_log(equataion,'Error in equation')





