import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:login_with_socials/services/auth_service.dart';

class AuthBloc{

  final authService = AuthService();
  final fb = FacebookLogin();

  Stream<User> get currentUser => authService.currentUser;

  loginFacebook() async{
    print("Logging in with Facebook");
  
    final FacebookLoginResult res = await fb.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email
      ]
    );

    print(res.status);

    switch(res.status){

      case FacebookLoginStatus.success:
      print("Login Successful");

      //Get Token
      final FacebookAccessToken fbToken = res.accessToken;

      //Convert to Auth Credential
      final AuthCredential credential = FacebookAuthProvider.credential(fbToken.token);

      final result = await authService.signInWithCredential(credential);
      print('${result.user.displayName} is now logged in.');

      break;
      case FacebookLoginStatus.cancel:
      print("The user cancelled the login");
      break;
      case FacebookLoginStatus.error:
      print("There was an error");
      break;


    }

  }

}