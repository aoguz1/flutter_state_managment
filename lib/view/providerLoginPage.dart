import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/services/firebase_auth.dart';

class ProviderLoginPage extends StatefulWidget {
  @override
  _ProviderLoginPageState createState() => _ProviderLoginPageState();
}

class _ProviderLoginPageState extends State<ProviderLoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController email;
  TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = TextEditingController(text: "");
    password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository userRepository, child) => Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.length <= 0) {
                          return "Lütfen metin kutusuna değer giriniz";
                        }
                      },
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value.length <= 0) {
                          return "Lütfen metin kutusuna değer giriniz";
                        }
                      },
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          if (!await userRepository.fireSignIn(
                              email.text, password.text)) {
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                                content:
                                    Text("E-mail ve kullanıcı adı yanlış")));
                            print(userRepository.durum);
                          } else {
                            print(userRepository.durum);
                          }
                        }
                      },
                      child: Text("Giriş Yap"),
                      color: Colors.green.shade400,
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
