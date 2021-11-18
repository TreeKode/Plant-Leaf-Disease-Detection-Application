from flask import Flask, json, request, jsonify
import werkzeug

app = Flask(__name__)

@app.route('/upload', methods=["POST"])
def upload():
    if(request.method == "POST"):
        imagefile = request.files['image']
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        imagefile.save("./Integration/uploadedimages/"+filename)
        import prediction
        link="hello"
        print(prediction.predict("./Integration/uploadedimages/"+filename))
        return jsonify({
            "message": prediction.predict("./Integration/uploadedimages/"+filename),
            "link" : "https://fluttercorner.com/how-to-open-a-web-browser-url-from-flutter-code/"
        })

if __name__=="__main__":
    app.run(debug=True,port=4000)
