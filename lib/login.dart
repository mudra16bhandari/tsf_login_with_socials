import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_with_socials/blocs/auth_bloc_fb.dart';
import 'package:login_with_socials/blocs/auth_bloc_google.dart';
import 'package:login_with_socials/profile.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("lib/images/tsflogo.png",
                height: size.height * 0.45, width: double.infinity),
            Text(
              "Login With",
              style: GoogleFonts.josefinSans(
                textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30.0,
                    letterSpacing: 1.25,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(219, 68, 55, 1),
                  Color.fromRGBO(244, 160, 0, 1),
                  Color.fromRGBO(15, 155, 88, 1),
                  Color.fromRGBO(66, 133, 244, 1),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 7.5,
                splashColor: Colors.black,
                padding: EdgeInsets.fromLTRB(55, 15, 55, 15),
                child: Text(
                  "   Google   ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                color: Colors.transparent,
                textTheme: ButtonTextTheme.accent,
                onPressed: () async{
                  AuthBlocGoogle gu = AuthBlocGoogle();
                  gu.googleSignin.disconnect();
                   User googleUser = await gu.loginGoogle();
                   if(googleUser!=null){
                     Navigator.of(context).pushReplacement(
                     MaterialPageRoute(builder: (context)=>Profile(googleUser.photoURL,googleUser.displayName, googleUser.email)));
                   }
                   else{
                     print("Error occured");
                   }
            
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 7.5,
              splashColor: Colors.black,
              padding: EdgeInsets.fromLTRB(55, 15, 55, 15),
              child: Text("Facebook ",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: Colors.white),
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              color: Color.fromRGBO(66, 103, 178, 1),
              onPressed: () async{
                User fbUser = await AuthBlocFacebook().loginFacebook();
                if(fbUser!=null){
                   Navigator.of(context).pushReplacement(
                     MaterialPageRoute(builder: (context)=>Profile(fbUser.photoURL,fbUser.displayName, fbUser.email)));
                }
                else{
                  print("An Error Occured.");
                }

              }
              ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(252, 204, 99, 1),
                    Color.fromRGBO(251, 173, 80, 1),
                    Color.fromRGBO(233, 89, 80, 1),
                    Color.fromRGBO(205, 72, 107, 1),
                    Color.fromRGBO(188, 42, 141, 1),
                    Color.fromRGBO(138, 58, 185, 1),
                    Color.fromRGBO(76, 104, 215, 1)
                  ],
                ),
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 7.5,
                splashColor: Colors.black,
                padding: EdgeInsets.fromLTRB(55, 15, 55, 15),
                child: Text("Instagram",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.white),
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                color: Colors.transparent,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 7.5,
              splashColor: Colors.black,
              padding: EdgeInsets.fromLTRB(55, 15, 55, 15),
              child: Text("  LinkedIn  ",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: Colors.white),
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              color: Color.fromRGBO(14, 118, 168, 1),
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 7.5,
              splashColor: Colors.grey,
              padding: EdgeInsets.fromLTRB(55, 15, 55, 15),
              child: Text("    GitHub    ",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: Colors.white),
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              color: Color.fromRGBO(36, 41, 46, 1),
              onPressed: () {},
            ),
          ],
        ),
      ),
      //),
    );


  }
}