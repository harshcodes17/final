import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_facilitation/screens/home.dart';

class MyRegister extends StatefulWidget {
  static const String id = 'MyRegister';

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'images/—Pngtree—hand drawn flat cartoon background_1068944.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 150),
                  child: Text(
                    'Creat An Account',
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 40.0,
                        fontFamily: 'Pacifico'),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: 25,
                  top: MediaQuery.of(context).size.height * 0.4,
                  right: 25,
                ),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(color: Colors.blue.shade600),
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.blue.shade800),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.blue.shade600),
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.blue.shade800),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.blue.shade600),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.blue.shade800),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () async {
                                try {
                                  final newuser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  if (newuser != null) {
                                    Navigator.pushNamed(context, HomePage.id);
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              icon: Icon(Icons.arrow_forward_outlined),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
