import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_leaf_disease_detection/home.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class homepage extends StatelessWidget {
  File? selectedImage;
  String? message = "";

  String? link = "";

  uploadImage() async {
    final request = http.MultipartRequest(
        "POST",
        Uri.parse("http://localhost:4000/upload"));

    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile('image', selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(),
        filename: selectedImage!
            .path
            .split("/")
            .last ,
      ),
    );
    final dataset = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile('object', selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(),
        filename: dropdownValue ,
      ),
    );
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];
    link = resJson['link'];
    setState(() {});
  }
  Future getImage() async {
    final pickedImage = await ImagePicker().getImage(
        source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    uploadImage();
    setState(() {});
  }
  List<String> items =<String>[
    'Potato',
    'Corn',
    'Tomato',
    'Apple',
    'Grapes',
  ];
  String dropdownValue = 'Apple' ;
  openURL()async{
    await launch(link!);
  }
  @override
  Widget build(BuildContext context) =>Scaffold(
    body:
    Container(
      padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
            children: [
              if(dropdownValue=='Potato')...[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://cdn.discordapp.com/attachments/911339738638737489/911340749822521344/2.jpg'),
                  radius: 40,
                ),
              ] else   if(dropdownValue=='Corn')...[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://cdn.discordapp.com/attachments/911339738638737489/911340750191624312/3.jpg'),
                  radius: 40,
                ),
              ]
              else   if(dropdownValue=='Tomato')...[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://cdn.discordapp.com/attachments/911339738638737489/911340749549871164/1.jpg'),
                    radius: 40,
                  ),
                ]
                else   if(dropdownValue=='Apple')...[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://media.discordapp.net/attachments/1043380063145566291/1043429001013764187/unknown.png'),
                      radius: 40,
                    ),]
                  else   if(dropdownValue=='Grapes')...[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://cdn.discordapp.com/attachments/911339738638737489/911340750787211395/5.jpg'),
                        radius: 40,
                      ),
                    ],
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('Detect The Disease ',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('In Your Plants ',
                    style: TextStyle(
                      color: Color.fromRGBO(125, 232, 107, 1),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
              //selectedImage ==null ?Text('pick image') : Image.file(selectedImage!),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                width: 350,
                height: 350,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      IconButton(
                        onPressed: getImage,
                        iconSize: 100,
                        icon: (
                            Icon(
                              Icons.cloud_upload,
                              color: Color.fromRGBO(117, 164, 136, 0.49),)
                        ),
                      ),
                    ),
                    selectedImage == null ? Container(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: Text('Upload Image To',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text('Detect Diseases',
                                style: TextStyle(
                                  color: Color.fromRGBO(125, 232, 107, 1),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ) : Container(
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        //border: Border.all(
                        //   color: Colors.white,
                        //   ),
                        //borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child:
                      Column(
                        children: [
                          Container(
                            child: Image.file(selectedImage!),
                            height: 150,
                            width: 150,
                          ),
                          Container(
                            child: Text(
                              message!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              child: MaterialButton(
                                onPressed: (){
                                  openURL();
                                },
                                child: Text("Click here to See Remedy",
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,

                                  ),

                                ),

                              )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 100,
                child: DropdownButton(
                  isExpanded: true,
                  onChanged: (String? newValue){
                    setState(() {
                      dropdownValue=newValue!;
                    });
                    dropdownValue =newValue!;
                  },
                  value: dropdownValue,
                  items: items.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child:Text(value,
                              style: TextStyle(
                                fontSize: 20,
                              ),

                            ) );
                      }
                  ).toList(),
                ),
              ),
            ]
        ),
      ),
    ),
  );
}
