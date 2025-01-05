import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mordidinha/pages/bottomnav.dart';
import 'package:mordidinha/pages/forgotpassword.dart';
import 'package:mordidinha/pages/signup.dart';
import 'package:mordidinha/widget/widget-support-text.dart';
import 'package:mordidinha/widget/widget-toast.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();

  TextEditingController useremailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      showCustomToast(
          message: 'Login efetuado com sucesso!',
          backgroundColor: Colors.green);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNav()));
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'invalid-credential') {
        showCustomToast(
            message: 'Email/Senha incorretos',
            backgroundColor: Colors.orangeAccent);

        return;
      }
      if (e.code == 'too-many-requests') {
        showCustomToast(
            message: "Muitas tentativas. Tente novamente mais tarde.",
            backgroundColor: Colors.redAccent);

        return;
      }

      showCustomToast(
          message: "Algo deu errado, tente novamente!",
          backgroundColor: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                const Color.fromARGB(255, 249, 29, 102),
                const Color.fromARGB(255, 231, 128, 162)
              ])),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Text(''),
        ),
        Container(
          margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                "assets/images/logo.png",
                width: MediaQuery.of(context).size.width / 1.5,
                fit: BoxFit.cover,
              )),
              SizedBox(
                height: 50.0,
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "Login",
                          style: AppWidget.lgboldTextStyle(),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: useremailcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira um email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIconColor: Colors.pink,
                              hintStyle: AppWidget.smBoldTextStyle(),
                              prefixIcon: Icon(Icons.email_outlined)),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: userpasswordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Senha',
                              prefixIconColor: Colors.pink,
                              hintStyle: AppWidget.smBoldTextStyle(),
                              prefixIcon: Icon(Icons.password_outlined)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()))
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Esqueceu sua senha?",
                              style: AppWidget.smLightTextStyle(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        GestureDetector(
                          onTap: () => {
                            if (_formkey.currentState!.validate())
                              {
                                setState(() {
                                  email = useremailcontroller.text;
                                  password = userpasswordcontroller.text;
                                }),
                                userLogin()
                              }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            child: Center(
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Poppins1'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()))
                },
                child: Text(
                  'Não tem uma conta? Cadastre-se',
                  style: AppWidget.smBoldTextStyle(),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}
