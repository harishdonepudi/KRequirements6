from config import app,client
from flask import request
from producer import messageSender 


@app.route('/upload',methods=['POST'])
def upload_image():
    bucket='finalproject009'
    content_type=request.mimetype
    obj=request.files['file']
    filename=obj.filename
    client.put_object(Body=obj,
          Bucket=bucket,
          Key=filename,
          ContentType=content_type
    )
    messageSender(filename + ' successfully uploaded')
    return {'message': 'file uploaded'}