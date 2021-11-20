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
        remedy_link ="https://stackoverflow.com/questions/50459272/missingpluginexception-while-using-plugin-for-flutter"
        if(model == "Tomato") :
            import tomato
            print(tomato.predict("./Integration/uploadedimages/"+filename))
            return jsonify({
                "message": tomato.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link})
        elif(model == "Apple") :
            import apple
            print(apple.predict("./Integration/uploadedimages/"+filename))
            return jsonify({
                "message": apple.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link
            })
        elif(model == "Corn") :
            import corn
            print(corn.predict("./Integration/uploadedimages/"+filename))
            return jsonify({
                "message": corn.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link
            })
        elif(model == "Grapes") :
            import grapes
            print(grapes.predict("./Integration/uploadedimages/"+filename))
            return jsonify({
                "message": grapes.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link
            })
        elif(model == "Potato") :
            import potato
            print(potato.predict("./Integration/uploadedimages/"+filename))
            return jsonify({
                "message": potato.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link
            }
            )
            

        

if __name__=="__main__":
    app.run(debug=True,port=4000)
