import 'package:flutter/material.dart';
import 'package:login_with_socials/login.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: NetworkImage("https://bit.ly/3nMdePK"),radius: 75.0,),
            SizedBox(height: 30.0,),
            Text("NAME:", style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 5.0,),
            Text("Mudra Bhandari", style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 20.0),
            Text("EMAIL ID:", style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 5.0,),
            Text("mudrabhandari123@yahoo.in", style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 30.0,),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              color: Colors.blueGrey,
              padding: EdgeInsets.all(15),
              child: Text("Log Out", style: TextStyle(color: Colors.white, fontSize: 17),),
              onPressed: ()=>Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>Login())
              ))
          ],
        ),
      ),
    );
  }
}