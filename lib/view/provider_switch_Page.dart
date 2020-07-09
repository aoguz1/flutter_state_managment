import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/services/firebase_auth.dart';
import 'package:state_managment/view/providerLoginPage.dart';
import 'package:state_managment/view/provider_userDurum.dart';

class ProviderSwitchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, UserRepository userRepo, child) {
      // stream yapısı ile oluşturuduğumuz stream yapısı ile sürekli dinleyip bunu ilgili sayfalara atıyoruz.
      switch (userRepo.durum) {
        case UserDurum.Idle:
          return SplashScreen();
        case UserDurum.OturumAciliyor:
        case UserDurum.OturumKapali:
          return ProviderLoginPage();
        case UserDurum.OturumAcik:
          return ProviderUserPage();
      }
    });
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
