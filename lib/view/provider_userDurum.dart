import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/services/firebase_auth.dart';

class ProviderUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository userRepository, child) => Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    radius: 45,
                    backgroundImage:
                        NetworkImage(userRepository.user.photoUrl)),
                Center(child: Text("E-mail : " + userRepository.user.email)),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    userRepository.fireSignOut();
                  },
                  child: Text(
                    "Çıkış Yap",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
