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
            result =tomato.predict("./Integration/uploadedimages/"+filename)
            remedy_link="Healthy"
            if(result=='Bacterial Spot'):
                remedy_link="https://www.growingproduce.com/vegetables/tactics-to-tackle-bacterial-spot-of-tomato/"
            if str(result)=="Early Blight " :
                remedy_link="https://gardenerspath.com/how-to/disease-and-pests/early-blight-tomato/"
            elif(result=="Late Blight "): remedy_link="https://www.gardentech.com/blog/pest-id-and-prevention/fight-blight-on-your-tomatoes"
            elif(result=="Tomato Leaf Mold "): remedy_link="https://www.gardeningknowhow.com/edible/vegetables/tomato/managing-tomato-leaf-mold.htm"
            elif(result=="Septoria Leaf Spot "): remedy_link="https://www.thespruce.com/identifying-and-controlling-septoria-leaf-spot-of-tomato-1402974"
            elif(result=="Spider Mites/Two-Spotted Spider Mite "): remedy_link="https://audreyslittlefarm.com/spider-mites-on-tomato-plants/"
            elif(result=="Tomato Yellow Leaf Curl Virus "): remedy_link="https://ipm.ifas.ufl.edu/agricultural_ipm/tylcv_home_mgmt.shtml"
            elif(result=="Tomato Mosaic Virus "): remedy_link="https://www.almanac.com/pest/mosaic-viruses"
            print(remedy_link)
            print(result) 
            
            return jsonify({
                "message": result,
                "link" : remedy_link
                })
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
