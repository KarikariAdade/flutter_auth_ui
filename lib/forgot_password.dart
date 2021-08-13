import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_login/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override

  final formKey = new GlobalKey<FormState>();

  String email;

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



  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
         Container(
           child: Stack(
             children: <Widget>[
               Container(
                 padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                 child: Text(
                   'Forgot',
                   style: TextStyle(fontSize: 76.0, fontWeight: FontWeight.w900),
                 ),
               ),
               Container(
                 padding: EdgeInsets.fromLTRB(15.0, 170.0, 0.0, 0.0),
                 child: Text(
                   'Password',
                   style: TextStyle(fontSize: 76.0, fontWeight: FontWeight.w900),
                 ),
               ),
               Container(
                 padding: EdgeInsets.fromLTRB(300.0, 162.0, 0.0, 0.0),
                 child: Text(
                   '.',
                   style: TextStyle(fontSize: 86.0, fontWeight: FontWeight.w900, color: Colors.green),
                 ),
               )
             ],
           ),
         ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Form(
              key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) => value.isEmpty ? 'Enter Email Address' : validateEmail(value),
                      onChanged: (value){
                        this.email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: 40.0),
                    Container(
                      child: Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: (){
                              print('this is tapp');
                              this.formKey.currentState.save();
                              Auth().forgotPassword(email, context);
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 7.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: (){
                                print('this is tapp');
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: 20.0,
                                        ),
                                      ),
                                      Text(
                                          'Go Back',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
