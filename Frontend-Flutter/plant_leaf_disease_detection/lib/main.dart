import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? selectedImage;
  String? message = "";

  String? link = "";
  int counter=1;

  uploadImage() async {
    final request = http.MultipartRequest(
        "POST",
        Uri.parse("https://811a-2409-4050-dc5-71ce-6da8-f81f-901c-bb55.in.ngrok.io/upload"));

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
  int currentIndex=2;
  bool _isLoggedIn =false;
  late GoogleSignInAccount _userObj ;
  GoogleSignIn _googleSignIn =GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Scaffold(
        backgroundColor: Color.fromRGBO(51, 240, 127, 0.52),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // leading: Icon(Icons.seven_mp_outlined),
          brightness: Brightness.light,
          title: const Text('Disease Detector App',

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
          child: _isLoggedIn ? Container(
            padding: const EdgeInsets.fromLTRB(0, 143, 0, 0),
            child: Column(
              children: [
                if(currentIndex==0)...[
                Container(
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
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      if(dropdownValue=='Potato')...[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://cdn.discordapp.com/attachments/1043380063145566291/1043380367278743652/unknown.png'),
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
                        'https://media.discordapp.net/attachments/1043380063145566291/1043380485516185600/unknown.png'),
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
                                      "No Disease Detected",
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
                        width: 150,
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
                ),] else if(currentIndex==1)...[

      ] else if(currentIndex==2 )...[
        Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                _userObj.photoUrl!),
                radius: 90,)
              ,
              Text( _userObj.displayName!,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 40.0)
              ),
              Text( _userObj.email,
                  style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
              Container(
                height: 150,
              ),
              RaisedButton(onPressed: (){
                _googleSignIn.signOut().then((value) {
                  setState(() {
                    _isLoggedIn =false;
                  });
                } );
              },shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)
                  ),
                  elevation: 0.0,
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color.fromRGBO(30, 30, 30, 100),Colors.black]
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                  constraints: BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text("Logout",
                  style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w300),
                  ),
              ),),),
            ],
          ),
        )

                ],

              ],
            ),
          ) : Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child :
                  Image.network('https://media.discordapp.net/attachments/1043380063145566291/1043432427424595968/image.png'),

                ),
                Container(

                  height: 50,
                  child: ElevatedButton(
                    child : Text("Lets Begin  !",),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(30, 30, 30, 100)),
                    ),
                    onPressed: (){
                      _googleSignIn.signIn().then((userData) {
                        setState(() {
                          _isLoggedIn =true;
                          _userObj =userData!;
                        });
                    }).catchError((e){
                    print(e);
                  });
          },
        ),
                ),
              ],
            ),),),
        bottomNavigationBar:  BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) => setState(() =>currentIndex=index),
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                color: Color.fromRGBO(51, 240, 127, 0.52),
              ),
              title: Text('Home'),
              backgroundColor: Colors.white,
              activeIcon: Icon(Icons.home,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail,
                  color: Color.fromRGBO(51, 240, 127, 0.52),),
                title: Text('Search'),
                backgroundColor: Colors.white,
              activeIcon: Icon(Icons.contact_mail,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                color: Color.fromRGBO(51, 240, 127, 0.52),
              ),
              title: Text('Profile'),
              backgroundColor: Colors.white,
              activeIcon: Icon(Icons.person,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );




  }
}

