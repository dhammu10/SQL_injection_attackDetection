#!C:\Users\Spider Projects\AppData\Local\Programs\Python\Python39\python
import cgi
import mysql.connector as mycon
import base64
from DBOperations import * 
cnt=0
cnt1=0
print("Content-type: text/html")
print()

form=cgi.FieldStorage()
userid=form.getvalue("userid")
examId=form.getvalue("examId")
print("param val="+userid+" "+examId)
#base64_bytes = id.encode('ascii')
#message_bytes = base64.b64decode(base64_bytes)
#message = message_bytes.decode('ascii')
#uid,requesterUserid = message.split('|')
#print(message)
#print("userid="+uid+" usershare="+requesterUserid)
try:
    deleteResult(userid,examId)  
    getReadings(userid,examId)  
    print("classification")
     
     
    print("<html>")
    print("<head>")
    print("<meta http-equiv='refresh' content='0;url=http://localhost:8080/fromPythonEval?userid="+userid+"&examId="+examId+"'/>")
    print("</head>")
    print("</html>")
except Exception as e:
        print(e)
        print("Variable x is not defined"+ NameError)