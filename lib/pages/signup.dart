// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mordidinha/pages/bottomnav.dart';
import 'package:mordidinha/pages/login.dart';
import 'package:mordidinha/widget/widget-support-text.dart';
import 'package:mordidinha/widget/widget-toast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = "", email = "", password = "";

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    print({email, password, name});
    if (email == null ||
        email.isEmpty ||
        password == null ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Por favor, preencha todos os campos!",
          style: TextStyle(fontSize: 18.0),
        ),
      ));
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      showCustomToast(
          message: "Registrado com sucesso!", backgroundColor: Colors.green);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNav()));
    } on FirebaseException catch (e) {
      if (e.code == "email-already-in-use") {
        showCustomToast(
            message: 'Conta já está cadastrada!',
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
                  height: MediaQuery.of(context).size.height / 1.8,
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
                          "Cadastre-se",
                          style: AppWidget.lgboldTextStyle(),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: namecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira um nome';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Nome',
                              prefixIconColor: Colors.pink,
                              hintStyle: AppWidget.smBoldTextStyle(),
                              prefixIcon: Icon(Icons.person_outlined)),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: emailcontroller,
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
                          controller: passwordcontroller,
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
                          height: 80.0,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              name = namecontroller.text;
                              email = emailcontroller.text;
                              password = passwordcontroller.text;
                            }

                            registration();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(20)),
                            width: 200,
                            child: Center(
                              child: Text(
                                'Cadastrar',
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => LogIn()))
                },
                child: Text(
                  'Já tem uma conta? Entre',
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
