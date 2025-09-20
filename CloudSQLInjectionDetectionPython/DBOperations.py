from DBConnect import *
import base64 
from DecisionAlgo import *
 
def convertToBase64(message='NA') :
    message_bytes = message.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    base64_message = base64_bytes.decode('ascii')
    print(base64_message)
    return base64_message

def convertFromBase64(base64_message='NA') :
    base64_bytes = base64_message.encode('ascii')
    message_bytes = base64.b64decode(base64_bytes)
    message = message_bytes.decode('ascii')
    print(message)
    return message
def deleteResult(userid1='NA',examId1=0) : 
     
    conn = connect()    
    mycursor = conn.cursor()
    sql = "delete from result where userid='"+userid1+"' and examId="+examId1
    print(sql)
    mycursor.execute ( sql )

    conn.commit ( ) 
def getReadings(uid='NA',examId=0) : 
    final_result=[]
    conn = connect()    
    cursor = conn.cursor()
    args = [uid,examId]
    args1=cursor.callproc('getScore', args)
    print("Return value:", args1)
    #for result in cursor.stored_results():
    
    #record = cursor.fetchall()
     
    record=[]
    a=()
    col=0
    for result in cursor.stored_results(): 
        #print(result.fetchall()) 
        for i in result.fetchall():
            #print(result.fetchall())
            final_result = [[int(i[1]),int(i[2])]]
            output=decisionalgo(uid,final_result) 
            print("anstype") 
            marks=int(i[2])
            qmarks=marks
            if qmarks==0:
                qmarks=1

            if col==0:
                a = ((examId,int(i[0]),uid,marks,int(output),qmarks),)
            else:
                a = a + ((examId,int(i[0]),uid,marks,int(output),qmarks),)
            col=col+1 
    insertResult(a)
    
    #conn.commit()
    """
    for x in record:
        lst.append(str(x[0]))
        print(str(x[0])+'\n')
    return final_result   
    print(final_result)
    print(cursor.rowcount) 
    """
    #return final_result

def insertResult(keywDic) : 
     
    conn = connect()    
    mycursor = conn.cursor()
    sql = "INSERT into result(examId,quesId,userid,marks,grade,qmarks) VALUES (%s, %s,%s,%s,%s,%s)"
    
    mycursor.executemany ( sql, keywDic )

    conn.commit ( )

    #print ( mycursor.rowcount, "was inserted." )
    conn.commit()
