from flask import Flask,request,Response
app=Flask(__name__)

list1=[1,2,3,4,5,6]

information={'name':'somewhere ','age':'32','occupation':'somejob'}

@app.route('/')
def b():
    return information

@app.route('/info',methods=['GET'])
def get_text():
    return list1

@app.route('/post/text',methods=['POST'])
def post_text():
    data_sent=request.data.decode('utf-8')
    return Response('this is the data you sent to the api:' + data_sent,mimetype='text/plain')


@app.route('/info/update/<string:key>', methods=['PUT'])
def put_text(key):
  if key in information:
        information[key] = request.data.decode('utf-8')
        return Response(key + " changed to: " + request.data.decode('utf-8'), mimetype='text/plain')
    else:
        return Response(key + " not found.", mimetype='text/plain')

@app.route('/info/delete', methods=['DELETE'])
def delete_text():
  key = request.data.decode('utf-8')
    if key in information:
        information.pop(key)
        return Response(key + " deleted from information. ", mimetype='text/plain')
    else:
        return Response(key + " not found.", mimetype='text/plain')

if __name__=='__main__':
    app.run(port=5000,debug=True,host='0.0.0.0')
