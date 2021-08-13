import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_login/main.dart';
import 'package:ui_login/services/auth.dart';
import 'package:ui_login/services/error_handler.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override

  // You'll always need a form key to validate form data
  final formKey = new GlobalKey<FormState>();

  // Check fields during submission

  checkFields() {
    final form = formKey.currentState;

    if (form.validate() == true){
      form.save();
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  String validatePassword(String value){
    if(value.length < 10){
      return 'Password too short';
    }else{
      return null;
    }
  }

  String email, password;

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 130.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(fontSize: 90.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(240.0, 120.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(fontSize: 120.0, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        this.email = value;
                      },
                      validator: (value) => value.isEmpty ? 'Email is required' : validateEmail(value),

                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusColor: Colors.green,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          )
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        this.password = value;
                      },
                      validator: (value) => value.isEmpty ? 'Password should not be empty' : validatePassword(value),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusColor: Colors.green,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          )
                      ),
                    ),
                    // SizedBox(height: 20.0),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //       labelText: 'USERNAME',
                    //       labelStyle: TextStyle(
                    //         fontFamily: 'Montserrat',
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.grey,
                    //       ),
                    //       focusColor: Colors.green,
                    //       focusedBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.green),
                    //       )
                    //   ),
                    // ),

                    SizedBox(height: 40.0),
                    Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: (){
                              print('you tapped');
                              this.formKey.currentState.save();
                               Auth().signUp(email, password)
                                   .then((userCreds){
                                     Navigator.of(context).pop();
                               }).catchError((e){
                                     ErrorHandler().errorDialog(context, e);
                               });
                            },
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Montserrat'
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                  widthFactor: 2.0,
                                  child: FaIcon(
                                    FontAwesomeIcons.arrowCircleLeft,
                                    size: 15.0,
                                  )
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context, '/login');
                                },
                                child: Text(
                                  'Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}
