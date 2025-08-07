import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .30,
              decoration: BoxDecoration(
                  image:DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/loginImage.png"),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20, vertical: 10),
              child: Form( key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login Details", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    customSizedBox(),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: "Username, email & phone number"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid email";
                        }
                        return null;
                      },
                    ),
                    customSizedBox(),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required!";
                        }
                        return null;
                      },
                    ),

                    customSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){}, child: Text("Forgot Password?")),
                      ],
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Əgər bütün sahələr doludursa
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Uğurla daxil oldun!")),
                          );
                        }
                      },
                      child: Text("Daxil ol"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
    height: 10,
  );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:Colors.grey,
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            )
        )
    );
  }

}