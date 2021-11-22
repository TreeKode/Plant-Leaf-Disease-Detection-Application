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
            if(result=="Bacterial Spot "): remedy_link="https://www.growingproduce.com/vegetables/tactics-to-tackle-bacterial-spot-of-tomato/"
            elif(result=="Early Blight "): remedy_link="https://gardenerspath.com/how-to/disease-and-pests/early-blight-tomato/"
            elif(result=="Late Blight "): remedy_link="https://www.gardentech.com/blog/pest-id-and-prevention/fight-blight-on-your-tomatoes"
            elif(result=="Tomato Leaf Mold "): remedy_link="https://www.gardeningknowhow.com/edible/vegetables/tomato/managing-tomato-leaf-mold.htm"
            elif(result=="Septoria Leaf Spot "): remedy_link="https://www.thespruce.com/identifying-and-controlling-septoria-leaf-spot-of-tomato-1402974"
            elif(result=="Spider Mites/Two-Spotted Spider Mite "): remedy_link="https://audreyslittlefarm.com/spider-mites-on-tomato-plants/"
            elif(result=="Tomato Yellow Leaf Curl Virus "): remedy_link="https://ipm.ifas.ufl.edu/agricultural_ipm/tylcv_home_mgmt.shtml"
            elif(result=="Tomato Mosaic Virus "): remedy_link="https://www.almanac.com/pest/mosaic-viruses"
            elif(result=="Healthy Tomato "): remedy_link="https://www.almanac.com/plant/tomatoes"
            return jsonify({
                "message": result,
                "link" : remedy_link
                })

        elif(model == "Apple") :
            import apple
            result = apple.predict("./Integration/uploadedimages/"+filename)
            remedy_link="Healthy"
            if(result=="Apple Scab "): remedy_link="https://www.independenttree.com/apple-scab-identification-prevention-treatment-2/"
            elif(result=="Apple Black Rot "): remedy_link="https://extension.umn.edu/plant-diseases/black-rot-apple"
            elif(result=="Cedar Apple Rust "): remedy_link="https://gardenerspath.com/how-to/disease-and-pests/cedar-apple-rust-control/"
            elif(result=="Healthy Apple "): remedy_link="https://extension.umn.edu/fruit/growing-apples"
            return jsonify({
                "message": apple.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link
            })

        elif(model == "Corn") :
            import corn
            result = corn.predict("./Integration/uploadedimages/"+filename)
            remedy_link="Healthy"
            if(result=="Cercospora Leaf / Spot Gray Leaf Spot "): remedy_link="https://www.pioneer.com/us/agronomy/gray_leaf_spot_cropfocus.html"
            elif(result=="Common Rust "): remedy_link="https://www.gardeningknowhow.com/edible/vegetables/corn/corn-rust-fungus-control.htm"
            elif(result=="Northern Leaf Blight "): remedy_link="https://www.gardeningknowhow.com/edible/vegetables/corn/northern-corn-leaf-blight-control.htm"
            elif(result=="Healthy Corn/Maize "): remedy_link="https://www.thespruce.com/grow-dracaena-fragrans-indoors-1902748"
            return jsonify({
                "message": corn.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link
            })

        elif(model == "Grapes") :
            import grapes
            result = grapes.predict("./Integration/uploadedimages/"+filename)
            if(result=="Black Rot "): remedy_link="https://www.gardeningknowhow.com/edible/fruits/grapes/black-rot-grape-treatment.htm"
            elif(result=="Grape Esca (Black Measles) "): remedy_link="http://ipm.ucanr.edu/PMG/r302100511.html"
            elif(result=="Grape Leaf blight (Isariopsis Leaf Spot) "): remedy_link="https://plantvillage.psu.edu/topics/grape/infos"
            elif(result=="Healthy Grape "): remedy_link="https://www.ugaoo.com/knowledge-center/how-to-grow-grape-vines/"
            return jsonify({
                "message": grapes.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link
            })

        elif(model == "Potato") :
            import potato
            result = potato.predict("./Integration/uploadedimages/"+filename)
            if(result=="Early Blight "): remedy_link="https://www.gardeningknowhow.com/edible/vegetables/potato/potato-early-blight-treatment.htm"
            elif(result=="Late Blight "): remedy_link="https://www.intechopen.com/chapters/58251"
            elif(result=="Healthy Potato "): remedy_link="https://homegardeners.in/potatoes/"
            return jsonify({
                "message": potato.predict("./Integration/uploadedimages/"+filename),
                "link" : remedy_link
            })
            
if __name__=="__main__":
    app.run(debug=True,port=4000)
