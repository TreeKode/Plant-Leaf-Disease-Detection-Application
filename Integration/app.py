from flask import Flask, json, request, jsonify
import werkzeug

app = Flask(__name__)

@app.route('/upload', methods=["POST"])
def upload():
    if(request.method == "POST"):
        imagefile = request.files['image']
        dataset =request.files['object']
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        imagefile.save("./Integration/uploadedimages/"+filename)
        model= werkzeug.utils.secure_filename(dataset.filename)
        remedy_link ="hello"+model
        import prediction
        print(prediction.predict("./Integration/uploadedimages/"+filename))
        return jsonify({
            "message": prediction.predict("./Integration/uploadedimages/"+filename),
            "link" : remedy_link
        })

if __name__=="__main__":
    app.run(debug=True,port=4000)
