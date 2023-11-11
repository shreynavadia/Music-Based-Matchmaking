import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:musically_mine/user_interests.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'questionnaire.dart';
import 'user_interests.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

String Gheight = '',
    Gexercise = '',
    Gstar_sign = '',
    Gpets = '',
    Gdrinking = '',
    Gsmoking = '',
    Glooking_for = '';

final height_controller = TextEditingController();
final aboutMe_controller = TextEditingController();

bool isButtonEnabled = false;

File _image1, _image2, _image3, _image4, _image5;

List<String> interests = [];
String description = '';

Widget buildChips() {
  return Wrap(
    direction: Axis.horizontal,
    children: [
      for (int i = 0; i < interests.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Chip(
            label: Text(
              interests[i],
            ),
            backgroundColor: Color(0xffF6265A),
          ),
        ),
    ],
  );
}

class _UserProfileState extends State<UserProfile> {
  _imgFromCamera(int pos) async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    switch (pos) {
      case 1:
        {
          setState(() {
            _image1 = image;
          });
          break;
        }
      case 2:
        {
          setState(() {
            _image2 = image;
          });
          break;
        }
      case 3:
        {
          setState(() {
            _image3 = image;
          });
          break;
        }
      case 4:
        {
          setState(() {
            _image4 = image;
          });
          break;
        }
      case 5:
        {
          setState(() {
            _image5 = image;
          });
          break;
        }
    }
    updateUserProfile();
  }

  _imgFromGallery(int pos) async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    switch (pos) {
      case 1:
        {
          setState(() {
            _image1 = image;
          });
          break;
        }
      case 2:
        {
          setState(() {
            _image2 = image;
          });
          break;
        }
      case 3:
        {
          setState(() {
            _image3 = image;
          });
          break;
        }
      case 4:
        {
          setState(() {
            _image4 = image;
          });
          break;
        }
      case 5:
        {
          setState(() {
            _image5 = image;
          });
          break;
        }
    }
    updateUserProfile();
  }

  @override
  void initState() {
    super.initState();
    sendUserPrefs();
    sendUserProfile();
    isButtonEnabled = false;
    print("Printing data: " +
        Gexercise +
        " " +
        Gpets +
        " " +
        Gsmoking +
        " " +
        Gdrinking +
        " " +
        Glooking_for +
        " " +
        Gstar_sign);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(10.00),
                  child: Row(
                    children: [
                      IntrinsicHeight(
                        child: Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _showPicker(context, 1);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: _image1 != null
                                        ? Expanded(
                                            child: Image.file(
                                              _image1,
                                              fit: BoxFit.fill,
                                              width: 200.0,
                                              height: 200.0,
                                            ),
                                          )
                                        : Image.asset(
                                            'images/addImage.jpg',
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _showPicker(context, 2);
                                  print('tap detected');
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: _image2 != null
                                        ? Expanded(
                                            child: Image.file(
                                              _image2,
                                              fit: BoxFit.fill,
                                              width: 200.0,
                                              height: 100.0,
                                            ),
                                          )
                                        : Image.asset(
                                            'images/addImage.jpg',
                                          ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showPicker(context, 3);
                                  print('tap detected');
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: _image3 != null
                                        ? Expanded(
                                            child: Image.file(
                                              _image3,
                                              fit: BoxFit.fill,
                                              width: 200.0,
                                              height: 100.0,
                                            ),
                                          )
                                        : Image.asset(
                                            'images/addImage.jpg',
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _showPicker(context, 4);
                                  print('tap detected');
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: _image4 != null
                                        ? Expanded(
                                            child: Image.file(
                                              _image4,
                                              fit: BoxFit.fill,
                                              width: 200.0,
                                              height: 100.0,
                                            ),
                                          )
                                        : Image.asset(
                                            'images/addImage.jpg',
                                          ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showPicker(context, 5);
                                  print('tap detected');
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: _image5 != null
                                        ? Expanded(
                                            child: Image.file(
                                              _image5,
                                              fit: BoxFit.fill,
                                              width: 200.0,
                                              height: 100.0,
                                            ),
                                          )
                                        : Image.asset(
                                            'images/addImage.jpg',
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, bottom: 3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'About Me',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                  IconButton(
                    disabledColor: Theme.of(context).primaryColor,
                    color: Colors.green,
                    icon: Icon(Icons.done),
                    onPressed: !isButtonEnabled
                        ? null
                        : () {
                            description = aboutMe_controller.text;
                            print(description);
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            currentFocus.unfocus();
                            setState(() {
                              isButtonEnabled = false;
                            });
                            updateUserProfile();
                          },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 20.0),
                child: TextField(
                  onTap: () {
                    setState(() {
                      isButtonEnabled = true;
                    });
                  },
                  controller: aboutMe_controller,
                  toolbarOptions: ToolbarOptions(
                      cut: true, copy: true, selectAll: true, paste: true),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: null,
                  expands: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 3.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Interests',
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).accentColor),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 20.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: UserInterests(),
                        );
                      },
                    );
                  },
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width,
                      child: interests.length == 0
                          ? Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Choose your interests...',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.grey),
                              ),
                            )
                          : buildChips(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border(
                          top: BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.75),
                          bottom: BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.75),
                          right: BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.75),
                          left: BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.75),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 3.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Basic Info',
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).accentColor),
                  ),
                ),
              ),
              InfoTile(
                leading: Icon(Icons.height),
                title: Text('Height'),
                trailing: '',
              ),
              InfoTile(
                leading: Icon(Icons.fitness_center_outlined),
                title: Text('Exercise'),
                trailing: '',
              ),
              InfoTile(
                leading: Icon(Icons.stars),
                title: Text('Star Sign'),
                trailing: '',
              ),
              InfoTile(
                leading: Icon(Icons.pets),
                title: Text('Pets'),
                trailing: '',
              ),
              InfoTile(
                leading: Icon(Icons.wine_bar),
                title: Text('Drinking'),
                trailing: '',
              ),
              InfoTile(
                leading: Icon(Icons.smoking_rooms),
                title: Text('Smoking'),
                trailing: '',
              ),
              InfoTile(
                leading: Icon(Icons.search),
                title: Text('Looking for'),
                trailing: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context, int position) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery(position);
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera(position);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> sendUserPrefs() async {
  var headers = <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  var data = {
    'id': id,
    'pets': Gpets,
    'height': Gheight,
    'exercise': Gexercise,
    'star_sign': Gstar_sign,
    'drinking': Gdrinking,
    'smoking': Gsmoking,
    'looking_for': Glooking_for
  };

  //sending top artists and tracks to the server via POST request
  var res = await http.post(
      'https://musically-mine.000webhostapp.com/insertBasicInfo.php',
      headers: headers,
      body: data,
      encoding: Encoding.getByName("utf-8"));

  if (res.statusCode != 200)
    throw Exception('http.post error: statusCode= ${res.statusCode}');

  print(res.request.url);
  print(res.body);
}

Future<void> updateUserPrefs() async {
  var headers = <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  var data = {
    'id': id,
    'pets': Gpets,
    'height': Gheight,
    'exercise': Gexercise,
    'star_sign': Gstar_sign,
    'drinking': Gdrinking,
    'smoking': Gsmoking,
    'looking_for': Glooking_for
  };

  //sending top artists and tracks to the server via POST request
  var res = await http.post(
      'https://musically-mine.000webhostapp.com/updateBasicInfo.php',
      headers: headers,
      body: data,
      encoding: Encoding.getByName("utf-8"));

  if (res.statusCode != 200)
    throw Exception('http.post error: statusCode= ${res.statusCode}');

  print(res.request.url);
  print(res.body);
}

Future<void> sendUserProfile() async {
  var headers = <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  var data = {
    'id': id,
    'description': description,
    'image_1': _image1 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'image_2': _image2 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'image_3': _image3 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'image_4': _image4 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'image_5': _image5 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'interests': interests.toString()
  };

  //sending top artists and tracks to the server via POST request
  var res = await http.post(
      'https://musically-mine.000webhostapp.com/insertUserProfile.php',
      headers: headers,
      body: data,
      encoding: Encoding.getByName("utf-8"));

  if (res.statusCode != 200)
    throw Exception('http.post error: statusCode= ${res.statusCode}');

  print(res.request.url);
  print(res.body);
}

Future<void> updateUserProfile() async {
  var headers = <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  print(_image1.toString());

  var data = {
    'id': id,
    'description': description,
    'image_1': _image1 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'image_2': _image2 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'image_3': _image3 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'image_4': _image4 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'image_5': _image5 == null ? '' : base64Encode(_image1.readAsBytesSync()),
    'interests': interests.toString()
  };

  //sending top artists and tracks to the server via POST request
  var res = await http.post(
      'https://musically-mine.000webhostapp.com/updateUserProfile.php',
      headers: headers,
      body: data,
      encoding: Encoding.getByName("utf-8"));

  if (res.statusCode != 200)
    throw Exception('http.post error: statusCode= ${res.statusCode}');

  print(res.request.url);
  print(res.body);
}

class InfoTile extends StatefulWidget {
  final Icon leading;
  final Text title;
  final String trailing;
  const InfoTile({Key key, this.leading, this.title, this.trailing})
      : super(key: key);

  @override
  _InfoTileState createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  final introKey = GlobalKey<IntroductionScreenState>();
  var position = {
    'Height': 0,
    'Exercise': 1,
    'Star Sign': 2,
    'Pets': 3,
    'Drinking': 4,
    'Smoking': 5,
    'Looking for': 6
  };

  static String height = '',
      exercise = '',
      star_sign = '',
      pets = '',
      drinking = '',
      smoking = '',
      looking_for = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey)),
        child: ListTile(
          leading: widget.leading,
          title: widget.title,
          trailing: widget.title.data == 'Height'
              ? Text(height)
              : widget.title.data == 'Exercise'
                  ? Text(exercise)
                  : widget.title.data == 'Star Sign'
                      ? Text(star_sign)
                      : widget.title.data == 'Pets'
                          ? Text(pets)
                          : widget.title.data == 'Drinking'
                              ? Text(drinking)
                              : widget.title.data == 'Smoking'
                                  ? Text(smoking)
                                  : widget.title.data == 'Looking for'
                                      ? Text(looking_for)
                                      : Text(''),
          onTap: () {
            int _position = position[widget.title.data];
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return WillPopScope(
                  onWillPop: _onBackPressed,
                  child: Dialog(
                    child: IntroductionScreen(
                      key: introKey,
                      pages: [
                        PageViewModel(
                          titleWidget: Padding(
                            padding: EdgeInsets.only(top: 100.00),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Icon(
                                    Icons.height,
                                    size: 40.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                Text(
                                  "What's your height?",
                                  style: TextStyle(
                                    color: Color(0xffF6265A),
                                    fontSize: 30.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bodyWidget: TextFormField(
                            controller: height_controller,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                ),
                                filled: false,
                                hintStyle:
                                    new TextStyle(color: Colors.grey[700]),
                                hintText: "Your height",
                                fillColor: Color(0x50FFFFFF)),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CupertinoAlertDialog(
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Set'),
                                          style: ElevatedButton.styleFrom(
                                              primary: Theme.of(context)
                                                  .accentColor),
                                        )
                                      ],
                                      content: numberPicker(),
                                    );
                                  });
                            },
                          ),
                        ),
                        PageViewModel(
                          titleWidget: Padding(
                            padding: EdgeInsets.only(top: 100.00),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Icon(
                                    Icons.fitness_center_outlined,
                                    size: 40.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                Text(
                                  "Do you workout?",
                                  style: TextStyle(
                                    color: Color(0xffF6265A),
                                    fontSize: 30.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bodyWidget: CustomRadioButton(
                            elevation: 10,
                            enableShape: true,
                            autoWidth: true,
                            selectedBorderColor: Theme.of(context).accentColor,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16)),
                            selectedColor: Theme.of(context).primaryColor,
                            enableButtonWrap: true,
                            wrapAlignment: WrapAlignment.center,
                            unSelectedColor: Theme.of(context).primaryColor,
                            buttonLables: [
                              'Active',
                              'Sometimes',
                              'Almost never'
                            ],
                            buttonValues: [
                              'Active',
                              'Sometimes',
                              'Almost never'
                            ],
                            radioButtonValue: (value) {
                              setState(() {
                                exercise = value.toString();
                                Gexercise = exercise;
                                height = height;
                                star_sign = star_sign;
                                pets = pets;
                                drinking = drinking;
                                smoking = smoking;
                                looking_for = looking_for;
                              });
                            },
                          ),
                        ),
                        PageViewModel(
                          titleWidget: Padding(
                            padding: EdgeInsets.only(top: 100.00),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Icon(
                                    Icons.stars,
                                    size: 40.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                Text(
                                  "What's your star sign?",
                                  style: TextStyle(
                                    color: Color(0xffF6265A),
                                    fontSize: 30.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bodyWidget: CustomRadioButton(
                            elevation: 10,
                            enableShape: true,
                            autoWidth: true,
                            selectedBorderColor: Theme.of(context).accentColor,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16)),
                            selectedColor: Theme.of(context).primaryColor,
                            enableButtonWrap: true,
                            wrapAlignment: WrapAlignment.center,
                            unSelectedColor: Theme.of(context).primaryColor,
                            buttonLables: [
                              'Aquarius',
                              'Pisces',
                              'Aries',
                              'Taurus',
                              'Gemini',
                              'Cancer',
                              'Leo',
                              'Virgo',
                              'Libra',
                              'Scorpio',
                              'Sagittarius',
                              'Capricon'
                            ],
                            buttonValues: [
                              'Aquarius',
                              'Pisces',
                              'Aries',
                              'Taurus',
                              'Gemini',
                              'Cancer',
                              'Leo',
                              'Virgo',
                              'Libra',
                              'Scorpio',
                              'Sagittarius',
                              'Capricon'
                            ],
                            radioButtonValue: (value) {
                              setState(() {
                                star_sign = value.toString();
                                Gstar_sign = star_sign;
                                exercise = exercise;
                                height = height;
                                pets = pets;
                                drinking = drinking;
                                smoking = smoking;
                                looking_for = looking_for;
                              });
                            },
                          ),
                        ),
                        PageViewModel(
                          titleWidget: Padding(
                            padding: EdgeInsets.only(top: 100.00),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Icon(
                                    Icons.pets,
                                    size: 40.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                Text(
                                  "What is your preference about pets?",
                                  style: TextStyle(
                                    color: Color(0xffF6265A),
                                    fontSize: 30.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bodyWidget: CustomRadioButton(
                            elevation: 10,
                            enableShape: true,
                            autoWidth: true,
                            selectedBorderColor: Theme.of(context).accentColor,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16)),
                            selectedColor: Theme.of(context).primaryColor,
                            enableButtonWrap: true,
                            wrapAlignment: WrapAlignment.center,
                            unSelectedColor: Theme.of(context).primaryColor,
                            buttonLables: ['Like', 'Don\'t Like'],
                            buttonValues: ['Like', 'Don\'t Like'],
                            radioButtonValue: (value) {
                              setState(() {
                                pets = value.toString();
                                Gpets = pets;
                                exercise = exercise;
                                height = height;
                                star_sign = star_sign;
                                drinking = drinking;
                                smoking = smoking;
                                looking_for = looking_for;
                              });
                            },
                          ),
                        ),
                        PageViewModel(
                          titleWidget: Padding(
                            padding: EdgeInsets.only(top: 100.00),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Icon(
                                    Icons.wine_bar,
                                    size: 40.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                Text(
                                  "Do you Drink?",
                                  style: TextStyle(
                                    color: Color(0xffF6265A),
                                    fontSize: 30.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bodyWidget: CustomRadioButton(
                            elevation: 10,
                            enableShape: true,
                            autoWidth: true,
                            selectedBorderColor: Theme.of(context).accentColor,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16)),
                            selectedColor: Theme.of(context).primaryColor,
                            enableButtonWrap: true,
                            wrapAlignment: WrapAlignment.center,
                            unSelectedColor: Theme.of(context).primaryColor,
                            buttonLables: ['Socially', 'Never', 'Frequently'],
                            buttonValues: ['Socially', 'Never', 'Frequently'],
                            radioButtonValue: (value) {
                              setState(() {
                                drinking = value.toString();
                                Gdrinking = drinking;
                                exercise = exercise;
                                height = height;
                                star_sign = star_sign;
                                pets = pets;
                                smoking = smoking;
                                looking_for = looking_for;
                              });
                            },
                          ),
                        ),
                        PageViewModel(
                          titleWidget: Padding(
                            padding: EdgeInsets.only(top: 100.00),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Icon(
                                    Icons.smoking_rooms,
                                    size: 40.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                Text(
                                  "Do you smoke?",
                                  style: TextStyle(
                                    color: Color(0xffF6265A),
                                    fontSize: 30.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bodyWidget: CustomRadioButton(
                            elevation: 10,
                            enableShape: true,
                            autoWidth: true,
                            selectedBorderColor: Theme.of(context).accentColor,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16)),
                            selectedColor: Theme.of(context).primaryColor,
                            enableButtonWrap: true,
                            wrapAlignment: WrapAlignment.center,
                            unSelectedColor: Theme.of(context).primaryColor,
                            buttonLables: ['Socially', 'Never', 'Regularly'],
                            buttonValues: ['Socially', 'Never', 'Regularly'],
                            radioButtonValue: (value) {
                              setState(
                                () {
                                  smoking = value.toString();
                                  Gsmoking = smoking;
                                  exercise = exercise;
                                  height = height;
                                  star_sign = star_sign;
                                  pets = pets;
                                  drinking = drinking;
                                  looking_for = looking_for;
                                },
                              );
                            },
                          ),
                        ),
                        PageViewModel(
                          titleWidget: Padding(
                            padding: EdgeInsets.only(top: 100.00),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Icon(
                                    Icons.search,
                                    size: 40.0,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                Text(
                                  "Looking for?",
                                  style: TextStyle(
                                    color: Color(0xffF6265A),
                                    fontSize: 30.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bodyWidget: CustomRadioButton(
                            elevation: 10,
                            enableShape: true,
                            autoWidth: true,
                            selectedBorderColor: Theme.of(context).accentColor,
                            unSelectedBorderColor: Colors.grey,
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16)),
                            selectedColor: Theme.of(context).primaryColor,
                            enableButtonWrap: true,
                            wrapAlignment: WrapAlignment.center,
                            unSelectedColor: Theme.of(context).primaryColor,
                            buttonLables: [
                              'Relationship',
                              'Something Casual',
                              'Want to explore',
                              'Marriage'
                            ],
                            buttonValues: [
                              'Relationship',
                              'Something Casual',
                              'Want to explore',
                              'Marriage'
                            ],
                            radioButtonValue: (value) {
                              setState(() {
                                looking_for = value.toString();
                                Glooking_for = looking_for;
                                exercise = exercise;
                                height = height;
                                star_sign = star_sign;
                                pets = pets;
                                drinking = drinking;
                                smoking = smoking;
                              });
                            },
                          ),
                        ),
                      ],
                      initialPage: _position,
                      dotsFlex: 0,
                      showSkipButton: true,
                      showNextButton: true,
                      onChange: (position) {
                        updateUserPrefs();
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();
                        // initState();
                      },
                      next: const Icon(Icons.arrow_forward),
                      onSkip: () => introKey.currentState.controller.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut),
                      skip: const Text('Skip',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      onDone: () => _onIntroEnd(context),
                      done: const Text('Done',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      dotsDecorator: const DotsDecorator(
                        size: Size(10.0, 10.0),
                        color: Color(0x50F6265A),
                        activeColor: Color(0xffF6265A),
                        activeSize: Size(22.0, 10.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _onIntroEnd(context) {
    updateUserPrefs();
    Navigator.of(context).pop();
    // initState();
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pop();
    updateUserPrefs();
    // initState();
  }
}

class numberPicker extends StatefulWidget {
  @override
  _numberPickerState createState() => _numberPickerState();
}

class _numberPickerState extends State<numberPicker> {
  int _currentIntValue = 150;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                value: _currentIntValue,
                minValue: 90,
                maxValue: 220,
                haptics: true,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.75, color: Colors.white),
                      bottom: BorderSide(width: 0.75, color: Colors.white)),
                ),
                onChanged: (value) => setState(() {
                  _currentIntValue = value;
                  height_controller.text = _currentIntValue.toString() + ' cm';
                  print(height_controller.text);
                  Gheight = height_controller.text;
                  //height = _currentIntValue.toString();
                }),
              ),
              Text(
                'cm',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
