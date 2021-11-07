from flask import Flask, json, request, jsonify
import werkzeug

app = Flask(__name__)

@app.route('/upload',method=["POST"])
def upload():
    if(requests.method == "POSTS"):
        imagefile = request.files['image']
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        imagefile.save("./uploadimages/"+filename)
        return jsonify({
            "message": "Image Uploaded Successfully"
        })

if __name__=="__main__":
    app.run(debug=True,port=4000)