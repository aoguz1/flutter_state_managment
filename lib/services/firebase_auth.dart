import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum UserDurum {
  Idle,
  OturumKapali,
  OturumAciliyor,
  OturumAcik
} // bu enum yapısı ile oturum durumlarını ele alıp ona göre switch caseler ile sayfa değişimini sağlıyoruz.

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  GoogleSignIn googleSignIn;
  UserDurum _durum = UserDurum.Idle;

  UserRepository() {
    _auth = FirebaseAuth.instance;
    googleSignIn = GoogleSignIn();
    _auth.onAuthStateChanged.listen(
        _onStateChanged); // oluşturuduğumuz stream ile oturum durumunun sürekli dinlenmesini sağlıyoruz.
  }

  FirebaseUser get user => _user;

  set user(FirebaseUser value) {
    _user = value;
  }

  UserDurum get durum => _durum;

  set durum(UserDurum value) {
    _durum = value;
  }

  Future<bool> fireSignIn(String email, String sifre) async {
    //bu fonksiyon oturum durumunun açılmasını sağlıyor
    try {
      _durum = UserDurum.OturumAciliyor;
      notifyListeners();
      var authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: sifre);
      _user = authResult.user;
      notifyListeners();
      return true;
    } catch (e) {
      _durum = UserDurum.OturumKapali;
      notifyListeners();
      return false;
    }
  }

  Future<bool> googleSignInFunc() async {
    try {
      _durum = UserDurum.OturumAciliyor;
      notifyListeners();
      var googleSignInAccount = await googleSignIn.signIn();
      var googleAuth = await googleSignInAccount.authentication;
      var credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await _auth.signInWithCredential(credential);

      return true;
    } catch (e) {
      debugPrint("hata kodu : " + e.toString());

      _durum = UserDurum.OturumKapali;
      notifyListeners();
      return false;
    }
  }

  Future fireSignOut() async {
    _auth.signOut();
    googleSignIn.signOut();
    _durum = UserDurum.OturumKapali;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(FirebaseUser user) {
    //bu fonksiyon oturum durumunu sürekli dinliyor.
    if (user == null) {
      _durum = UserDurum.OturumKapali;
      print("user null oldu");
    } else {
      _user = user;
      print("user true");
      _durum = UserDurum.OturumAcik;
    }
    notifyListeners();
  }
}
