import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vdart/screens/profile/changepassword.dart';
import 'package:vdart/screens/profile/companyinfo.dart';
import 'package:vdart/screens/profile/contracts.dart';
import 'package:vdart/screens/profile/dependentinfo.dart';
import 'package:vdart/screens/profile/emergencycontact.dart';
import 'package:vdart/screens/profile/homeaddress.dart';
import 'package:vdart/screens/profile/jobinfo.dart';
import 'package:vdart/screens/profile/payslips.dart';
import 'package:vdart/screens/profile/personaldocuments.dart';
import 'package:vdart/screens/profile/personalinfo.dart';
import 'package:vdart/signup/login.dart';
import 'package:vdart/utils.dart/globals.dart';
import 'package:vdart/utils.dart/styles.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  String domainname = "Tailermade";
  bool showsetting = false;
  double ht, wt;
  bool _showTick = true;
  String fileName;
  String path;
  bool videoFile = false;
  void _openVideoFiles() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      // allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      // List<File> file1 = result.paths.map((path) => File(path));

//fileName  = file1[0].name;

      /*  File file = File(result.files.single.path);*/
      PlatformFile file1 = result.files.first;
      print(file1.name);

      fileName = file1.name;
      setState(() {
        videoFile = !videoFile;
      });
      print(file1.bytes);
      print(file1.size);
      print(file1.extension);
      print(file1.path);
      path = file1.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 30),
                height: wt / 5.5,
                width: wt,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        _modalBottomSheetMenu();
                      },
                      icon: Icon(Icons.settings),
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),
              Container(
                height: wt / 2,
                // color: Colors.red,
                width: wt,
                color: Colors.white,
                padding: EdgeInsets.only(top: 1.0, bottom: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/images/person.png"),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: 6),
                    Text("Karthika Velmurugan",
                        style: TextStyle(
                            color: fontColor,
                            fontSize: wt / 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            print("show tick :" + _showTick.toString());
                            setState(() {
                              _showTick = !_showTick;
                              print("At the office");
                              Fluttertoast.showToast(
                                  msg: "At the Office",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: toastColor,
                                  textColor: Colors.white,
                                  fontSize: wt / 20);
                            });
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green[400],
                            ),
                            child: _showTick
                                ? Icon(Icons.check,
                                    color: Colors.white, size: 20)
                                : Text(""),
                          ),
                        ),
                        SizedBox(width: wt / 22),
                        InkWell(
                          onTap: () {
                            print("show tick :" + _showTick.toString());
                            setState(() {
                              _showTick = !_showTick;
                              print("At the home");
                              Fluttertoast.showToast(
                                  msg: "At the Home",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: toastColor,
                                  textColor: Colors.white,
                                  fontSize: wt / 20);
                            });
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange[800],
                            ),
                            child: !_showTick
                                ? Icon(Icons.check,
                                    color: Colors.white, size: 20)
                                : Text(""),
                          ),
                        ),
                        SizedBox(width: wt / 22),
                        InkWell(
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 2,
                                    color: Colors.green,
                                    style: BorderStyle.solid)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              showoption("Personal Info", 1),
              showoption("Home Address", 2),
              showoption("Emergency Contact", 3),
              showoption("Job Information", 4),
              showoption("Personal Documents", 5),
              showoption("Contracts", 6),
              showoption("Payslips", 7),
              showoption("Dependents", 8),
              showoption("Company Info", 9),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey[200]),
                    ),
                    color: Colors.white),
                // color: Colors.white,
                width: wt,
                height: ht / 16,
                child: ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Welcome Video",
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: wt / 25),
                        ),
                        SizedBox(width: 2),
                        Text(
                          "Please input .mp4 file",
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: wt / 30),
                        ),
                      ]),
                  trailing: Image.asset('assets/images/arrowright.png',
                      height: 14, width: 14),
                  onTap: () {
                    // Update the state of the app.
                    // ...

                    _showRequestVideo();
                  },
                ),
              ),
              version(),
            ],
          ),
        ));
  }

  Widget showoption(String option, int no) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey[200]),
            ),
            color: Colors.white),
        // color: Colors.white,
        width: wt,
        height: wt / 7,
        child: ListTile(
          // contentPadding: EdgeInsets.all(3.0),
          title: Text(option,
              style: TextStyle(
                color: fontColor,
                fontSize: wt / 26,
                fontWeight: FontWeight.w500,
              )),
          trailing: //Icon(Icons.arrow_right),
              Image.asset('assets/images/arrowright.png',
                  height: 14, width: 14),
          onTap: () {
            // Update the state of the app.
            // ...
            setState(() {
              _choosePage(no);
            });
          },
        ));
  }

  _choosePage(int no) {
    if (no == 1) {
      print("Personal Info");
      //navigate to personal info
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PersonalInfo()));
    } else if (no == 2) {
      print("Home address");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeAddressInfo()));
      //navigate to home address
    } else if (no == 3) {
      print("Emergency contact");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EmergencyInfo()));
      //navigate to emergency contact
    } else if (no == 4) {
      print("Job information");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => JobInfo()));
      //navigate to jon info
    } else if (no == 5) {
      print("Personal documents");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PersonalDoc()));
      //navigate to personal docs
    } else if (no == 6) {
      print("Contracts");
      //navigate to contracts
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Contracts()));
    } else if (no == 7) {
      print("Payslips");
      //navigate to payslips
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Payslips()));
    } else if (no == 8) {
      print("Dependents");
      //navigate to dependents
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DependentDoc()));
    } else if (no == 9) {
      print("company info");
      //navigate to company info
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CompanyInfo()));
    }
  }

  Widget version() {
    return Container(
      padding: EdgeInsets.only(top: wt / 8, bottom: wt / 20),
      height: wt / 4,
      width: wt,
      child: Center(
          child: Text("Version 1.8.1",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: wt / 25,
              ))),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        builder: (builder) {
          return new Container(
            height: wt / 2,
            // color: Colors.transparent,
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 6.0),
                      child: Center(
                        child: Container(
                          height: 6,
                          width: wt / 11,
                          decoration: new BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        ),
                      )),
                  showsettingsoption("Settings"),
                  drawer(),
                  showsettingsoption("CHANGE PASSWORD"),
                  drawer(),
                  showsettingsoption("LOG OUT"),
                ]),
          );
        });
  }

  void _showRequestVideo() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        builder: (builder) {
          return new Container(
            height: wt / 1.5,
            // color: Colors.transparent,
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Center(
                      child: Container(
                        height: 6,
                        width: wt / 11,
                        decoration: new BoxDecoration(
                          color: Colors.blueGrey[300],
                          borderRadius: new BorderRadius.circular(25),
                        ),
                      ),
                    )),
                Center(
                    child: Text("Welcome Video",
                        style: TextStyle(
                          color: fontColor,
                          fontSize: wt / 26,
                          fontWeight: FontWeight.w800,
                        ))),
                SizedBox(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                      Text(
                        "Start preparing to welcome a new employee with open",
                        style: TextStyle(
                            fontSize: wt / 30,
                            height: 1,
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "arms even before their first day arrives. This video will",
                        style: TextStyle(
                            fontSize: wt / 30,
                            height: 1,
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "be displayed on employee's Timeline.",
                        style: TextStyle(
                            fontSize: wt / 30,
                            height: 1,
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w500),
                      ),
                    ])),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            //choose video file
                            _openVideoFiles();
                          },
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: !videoFile
                                  ? Row(children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.video_library,
                                          size: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text("Select video",
                                          style: TextStyle(
                                            color: fontColor,
                                            fontSize: wt / 24,
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ])
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                fileName,
                                                style: TextStyle(
                                                  color: fontColor,
                                                  fontSize: wt / 24,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                          Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      videoFile = !videoFile;
                                                      print("video added!");
                                                      notilist.add(
                                                          "Your welcome video has been added");
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Text("DONE",
                                                      style: TextStyle(
                                                        color:
                                                            Colors.green[300],
                                                        fontSize: wt / 24,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ))))
                                        ]))),
                      drawer(),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 10, top: 10, bottom: 10),
                              child: Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          color: fontColor,
                                          fontSize: wt / 24,
                                          fontWeight: FontWeight.w400)),
                                )
                              ])))
                    ])
              ],
            ),

            /*  InkWell(
                    child: showsettingsoption("Select video"),
                    onTap: () {
                      //choose video file pick
                    },
                  ),
                  drawer(),
                  showsettingsoption("Cancel"),*/
          );
        });
  }

  Widget drawer() {
    return Container(
      height: 1,
      width: wt / 1.1,
      color: Colors.grey[300],
    );
  }

  Widget showsettingsoption(String option) {
    return InkWell(
      child: option != "Settings"
          ? Center(
              child: Text(option,
                  style: TextStyle(
                    color: fontColor,
                    fontSize: wt / 20,
                    fontWeight: FontWeight.w300,
                  )))
          : Text(option,
              style: TextStyle(fontSize: wt / 23, fontWeight: FontWeight.w800)),
      onTap: () {
        // Update the state of the app.
        Navigator.pop(context);

        checksettingsoption(option);
      },
    );
  }

  checksettingsoption(String option) {
    if (option == "CHANGE PASSWORD") {
      //navigate into changepaswwrod page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChangePassword()));
    } else if (option == "LOG OUT") {
      _showLogout();
    } else if (option == "Select video") {
    } else if (option == "Cancel") {
      Navigator.pop(context);
    }
    // ...
  }

  Future<bool> _showLogout() async {
    SharedPreferences vdart = await SharedPreferences.getInstance();
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(
          'Log out of $domainname',
          style: TextStyle(fontSize: wt / 20),
        ),
        elevation: 5,
        contentPadding: EdgeInsets.all(20),
        content: SizedBox(
          height: wt / 20,
        ),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("CANCEL",
                style: TextStyle(color: Colors.green[400], fontSize: wt / 25)),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () {
              //write code for logout
              setState(() {
                //clear name and pass
                vdart.clear();
                print("Log out : cleared sharedprefence");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              });
            },
            child: Text("LOG OUT",
                style: TextStyle(color: Colors.green[400], fontSize: wt / 25)),
          ),
          SizedBox(height: wt / 20),
        ],
      ),
    );
  }
}
