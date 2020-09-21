import 'package:flutter/material.dart';
import 'package:vdart/globals.dart';
import 'package:vdart/profile/infodata.dart';
import 'package:vdart/utils.dart/styles.dart';

class DependentEditingPage extends StatefulWidget {
  @override
  _DependentEditingPage createState() => _DependentEditingPage();
}

class _DependentEditingPage extends State<DependentEditingPage> {
  String _dropDownNationalValue, _dropDownGenderValue;
  DateTime pickedDatedob, pickedDatees, pickedDateee;
  double ht, wt;
  List genderlist = ['Male', 'Female'];
  List nationallist = [
    'Afghan',
    'Albanian',
    'Algerian',
    'American',
    'Andorran',
    'Angolan',
    'Anguillan',
    'Argentine',
    'Armenian',
    'Australian',
    'Azerbaijani',
    'Austrian',
    'Azerbaijani',
    'Bahamian',
    'Bahraini',
    'Bangladeshi',
    'Barbadian',
    'Belarusian',
    'Belgian',
    'Belizean'
  ];
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  var hst = TextStyle(
      color: fontColor, letterSpacing: 1, fontWeight: FontWeight.w700);
  var lst = TextStyle(
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey[400]);
  InfoData i = new InfoData();
  String firstname,
      lastname,
      dob,
      national,
      gender,
      relation,
      city,
      district,
      pid,
      personaltax,
      estartdate,
      eenddate;
  @override
  void initState() {
    //  i.data();
    //remodify the pickeddate value as from DB
    pickedDatedob = DateTime.now();
    pickedDatees = DateTime.now();
    pickedDateee = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;

    return MaterialApp(
        title: "Grove",
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: wt / 6,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: wt / 20,
                            color: Colors.blueGrey[600],
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: wt / 20,
                            color: Colors.green[300],
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        // _savedData();
                        notilist.add("Dependent Information has been changed");
                        print("saved");
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ]),
          ),
          Card(
              color: Colors.white,
              child: Container(
                width: wt,
                padding: EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(7.0), child: _buildHead()),
                    combo('First Name *', i.dfname, 1, 'E.g.Phong'),
                    combo('Last Name *', i.dlname, 2, 'E.g.Nguyen Thi'),
                    // combo('Date of Birth', i.dobC, 3),
                    dobField('Date of Birth', 3),
                    chooseNationalDropBox('Nationality'),
                    chooseGenderDropBox('Gender'),

                    //  combo('Nationality', i.nationalityC, 4),
                    combo('Relationship', i.drelation, 4, 'Relationship'),
                    combo('City', i.dcity, 5, 'City'),
                    combo('District', i.ddistrict, 6, 'District'),
                    combo('Personal ID', i.dpersonalid, 7, 'Personal ID'),

                    // combo('Marital Status', i.maritalC, 7),
                    combo('Personal Tax ID', i.dpersonaltax, 8,
                        'Personal Tax ID'),

                    eSField('Effective Start Date', 9),
                    eeField('Effective End Date', 10),

                    /*   ListTile(
                      title: Text(
                          "Date:  ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                          style: TextStyle(fontWeight: FontWeight.w900)),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: _pickDate,
                    ),*/
                  ],
                ),
              ))
        ]))));
  }

  Widget chooseNationalDropBox(String label) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: cardColor,
                child: Center(
                  child: DropdownButton(
                    iconEnabledColor: Colors.green[300],
                    iconDisabledColor: Colors.green[300],
                    underline: SizedBox(height: 5),
                    hint: _dropDownNationalValue == null
                        ? Center(
                            child: Text(
                            "Select Nationality",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownNationalValue,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          )),
                    isExpanded: true,
                    iconSize: 28.0,
                    style: TextStyle(
                        fontSize: wt / 30,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                    isDense: false,
                    items: nationallist.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(
                            val,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownNationalValue = val;
                          national = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget chooseGenderDropBox(String label) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: cardColor,
                child: Center(
                  child: DropdownButton(
                    iconEnabledColor: Colors.green[300],
                    iconDisabledColor: Colors.green[300],
                    underline: SizedBox(height: 0.8),
                    hint: _dropDownGenderValue == null
                        ? Center(
                            child: Text(
                            "Select Gender",
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: Colors.blueGrey[300],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ))
                        : Center(
                            child: Text(
                            _dropDownGenderValue,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          )),
                    isExpanded: true,
                    iconSize: 28.0,
                    style: TextStyle(
                        fontSize: wt / 30,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                    isDense: false,
                    items: genderlist.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(
                            val,
                            style: TextStyle(
                                fontSize: wt / 26,
                                height: 1,
                                color: fontColor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownGenderValue = val;
                          gender = val;
                        },
                      );
                    },
                  ),
                ),
              )
            ]));
  }

  Widget dobField(String label, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  color: cardColor,
                  child: Center(
                      child: ListTile(
                    title: Center(
                      child: Text(
                        "${pickedDatedob.day} ${months[pickedDatedob.month - 1]} ${pickedDatedob.year}",
                        style: TextStyle(
                            fontSize: wt / 26,
                            height: 1,
                            color: fontColor,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: Icon(
                      Icons.date_range,
                      size: 20,
                      color: Colors.green[300],
                    ),
                    onTap: _pickDateDOB,
                  )))
            ]));
  }

  Widget eSField(String label, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  color: cardColor,
                  child: Center(
                      child: ListTile(
                    title: Center(
                      child: Text(
                        "${pickedDatees.day} ${months[pickedDatees.month - 1]} ${pickedDatees.year}",
                        style: TextStyle(
                            fontSize: wt / 26,
                            height: 1,
                            color: fontColor,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: Icon(
                      Icons.date_range,
                      size: 20,
                      color: Colors.green[300],
                    ),
                    onTap: _pickDateES,
                  )))
            ]));
  }

  Widget eeField(String label, int i) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  color: cardColor,
                  child: Center(
                      child: ListTile(
                    title: Center(
                      child: Text(
                        "${pickedDateee.day} ${months[pickedDateee.month - 1]} ${pickedDateee.year}",
                        style: TextStyle(
                            fontSize: wt / 26,
                            height: 1,
                            color: fontColor,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: Icon(
                      Icons.date_range,
                      size: 20,
                      color: Colors.green[300],
                    ),
                    onTap: _pickDateEE,
                  )))
            ]));
  }

  Widget combo(String label, TextEditingController t, int i, String hint) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildLabel(label),
              _buildField(t, i, hint),
            ]));
  }

  _savedData() {}

  Widget _buildHead() {
    return Text(
      "Dependents",
      style: hst.copyWith(fontSize: wt / 20),
    );
  }

  Widget _buildLabel(String label) {
    return Text(label, style: lst.copyWith(fontSize: wt / 25));
  }

  Widget _buildField(TextEditingController c, int index, String hint) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      color: cardColor,
      child: Center(
        child: TextFormField(
          controller: c,
          showCursor: true,
          cursorColor: Colors.green[800],
          cursorWidth: 1,
          onChanged: (value) {
            setState(() {
              print("After changed" + c.text);
              if (index == 1) {
                firstname = value;
              } else if (index == 2) {
                lastname = value;
              } else if (index == 4) {
                relation = value;
              } else if (index == 5) {
                city = value;
              } else if (index == 6) {
                district = value;
              } else if (index == 7) {
                pid = value;
              } else if (index == 8) {
                personaltax = value;
              } else if (index == 9) {
                estartdate = value;
              } else if (index == 10) {
                eenddate = value;
              }
              // = value;
            });
          },
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: wt / 26,
              height: 1,
              color: fontColor,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: wt / 26,
                height: 1,
                color: Colors.blueGrey[300],
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500),
            suffixIcon: Icon(
              Icons.edit,
              size: 22,
              color: Colors.green[300],
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  _pickDateDOB() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDatedob,
    );
    if (date != null)
      setState(() {
        pickedDatedob = date;
      });
  }

  _pickDateES() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDatees,
    );
    if (date != null)
      setState(() {
        pickedDatees = date;
      });
  }

  _pickDateEE() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDateee,
    );
    if (date != null)
      setState(() {
        pickedDateee = date;
      });
  }
}
