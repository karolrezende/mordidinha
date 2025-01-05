import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mordidinha/pages/signup.dart';
import 'package:mordidinha/widget/widget-toast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailcontroller = new TextEditingController();

  String email = "";

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      showCustomToast(
          message: "E-mail para redefinir senha enviado!",
          backgroundColor: Colors.greenAccent);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == "user-not-found") {
        showCustomToast(
            message: "Usuário não encontrado!",
            backgroundColor: Colors.redAccent);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Centraliza o conteúdo
        child: Container(
          padding: EdgeInsets.all(16.0), // Espaçamento interno para o conteúdo
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Garante que a altura do Column seja mínima
            crossAxisAlignment: CrossAxisAlignment
                .center, // Centraliza horizontalmente os filhos
            children: [
              Text(
                "Recuperar senha",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Digite seu e-mail",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              Form(
                key: _formkey,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    controller: mailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        showCustomToast(
                            message: "Por favor, digite um e-mail!",
                            backgroundColor: Colors.redAccent);
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.pinkAccent),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle:
                          TextStyle(fontSize: 18.0, color: Colors.pinkAccent),
                      prefixIcon: Icon(Icons.person,
                          color: Colors.pinkAccent, size: 30.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      email = mailcontroller.text;
                    });
                    resetPassword();
                  }
                },
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Enviar e-mail",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Não tem uma conta?",
                    style: TextStyle(fontSize: 18.0, color: Colors.pinkAccent),
                  ),
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      "Cadastre-se",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
