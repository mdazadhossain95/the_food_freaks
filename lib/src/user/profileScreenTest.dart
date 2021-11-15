import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/home.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class ProfileScreenTest extends StatelessWidget {
  const ProfileScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
          backgroundColor: kColor1,
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ClipOval(
                          child: Stack(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  'images/1.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  color: Colors.black.withOpacity(0.3),
                                  child: Column(
                                    children: [
                                      Icon(Icons.add_a_photo_outlined)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   Helper.getAssetName("edit_filled.png", "virtual"),
                            // ),
                            Icon(Icons.edit),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Edit Profile",
                              style: TextStyle(color: Color(0xFFFC6011)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Hi there Azad!",
                          style:
                          Theme.of(context).textTheme.headline6!.copyWith(
                            color: Color(0xFF4A4B4D),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Sign Out"),
                        SizedBox(
                          height: 40,
                        ),
                        CustomFormImput(
                          label: "Name",
                          value: "Md Azad Hossain",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormImput(
                          label: "Email",
                          value: "mdazadhossain95@email.com",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormImput(
                          label: "Address",
                          value: "Divint IT, Dhaka",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormImput(
                          label: "Password",
                          value: "1234",
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormImput(
                          label: "Confirm Password",
                          value: "1234",
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child:                 Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(kColor1),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0)))),
                              child: const CustomText(
                                text: 'Save',
                              ),
                            ),
                          ),
                          ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFormImput extends StatelessWidget {
  final String _label;
  final String _value;
  final bool _isPassword;

  const CustomFormImput({
    Key? key,
    required String label,
    required String value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Color(0xFFF2F2F2),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: _label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        obscureText: _isPassword,
        initialValue: _value,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
