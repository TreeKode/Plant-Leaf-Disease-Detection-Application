import 'dart:convert';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
_launchURLBrowser() async {
  const url = 'https://www.codegrepper.com/code-examples/dart/flutter+open+link+in+browser';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? selectedImage;
  String? message= "" ;
  String? link ="" ;
  uploadImage() async{
    final request = http.MultipartRequest(
        "POST",
        Uri.parse("https://0426-117-97-134-99.ngrok.io/upload"));

    final headers ={"Content-type": "multipart/form-data"};
    request.files.add(
        http.MultipartFile('image', selectedImage!.readAsBytes().asStream(),
            selectedImage!.lengthSync(),
            filename: selectedImage!.path.split("/").last)
    );

    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];
    link =resJson['link'];
    setState((){} );

  }
  Future getImage() async{
    final pickedImage = await ImagePicker().getImage(source : ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    uploadImage();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Scaffold(
        backgroundColor: Color.fromRGBO(51, 240, 127, 0.52),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Icon(Icons.seven_mp_outlined),
          title: const Text('TreeKode',
            style: TextStyle(
              fontFamily: ('Work_Sands'),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),

          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                )
            ),
            width: double.maxFinite,
            height: double.maxFinite,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://media.discordapp.net/attachments/843384733135273996/907518700683419678/Untitled_design_4.jpg?width=671&height=671'),
                  radius: 40,
                ),
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
                  child:Text('In Your Plants ',
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
                          offset: Offset(0.0,1.0),
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
                          icon : (
                              Icon(
                                Icons.cloud_upload,
                                color: Color.fromRGBO(117, 164, 136, 0.49),)

                          ),

                        ),
                      ),
                      selectedImage ==null ?Container(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child:Column(
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
                              child: InkWell(
                                  child: new Text("Click here for remedy"),
                                  onTap: () => _launchURLBrowser(),

                              ),
                            ),


                          ],
                        ),
                      )


                    ],

                  ),
                ),

              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                color: Colors.black,
              ),
              title: Text('Home'),
              backgroundColor: Colors.green,
              activeIcon: Icon(Icons.home,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
  _launchURL() async {
    const url = ‘https://flutter.io’;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw ‘Could not launch $url’;
  }
  }
}
