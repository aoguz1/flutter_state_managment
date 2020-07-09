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
              children: <Widget>[
                Center(child: Text("E-mail : " + userRepository.user.email)),
                RaisedButton(
                  onPressed: () {
                    userRepository.fireSignOut();
                  },
                  child: Text("Çıkış Yap"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
