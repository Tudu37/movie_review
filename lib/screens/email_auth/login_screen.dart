
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_review/screens/email_auth/signup_screen.dart';
import 'package:movie_review/screens/home_screen.dart';
import 'package:movie_review/screens/phone_auth/sign_in__with_phone.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void EmailLoginMethod()async{

    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: _emailTextController.text.toString().trim(), password:_passwordTextController.text.toString().trim())
          .then((value) {
            Fluttertoast.showToast(msg: "your login is successful");
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
          });
    } on FirebaseAuthException catch(ex){
      Fluttertoast.showToast(msg: ex.code.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
         child:  Form(
           key: _keyForm,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Nunito",
                    color: Colors.black,
                  ),
                  controller: _emailTextController,
                  // validator: validateMobile,
                  validator: (email){
                    if(email==null || email.isEmpty){
                      return "please enter your email";
                    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
                      return "Please enter a valid email address";
                    }
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    hintText: "Enter Email Address",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Nunito",
                      color: Color.fromRGBO(169, 169, 169, 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                          width: 1, color:  Color.fromRGBO(169, 169, 169, 1),),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),

                TextFormField(
                  controller: _passwordTextController,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: "Nunito",
                  ),
                  validator: (password){
                    if(password==null || password.isEmpty){
                      return "please enter password";
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Nunito",
                      color: Color.fromRGBO(169, 169, 169, 1),
                    ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black,width: 1.0),
                  ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Color.fromRGBO(169, 169, 169, 1),width: 1.0),
                    ),
                  ),
                ),
               SizedBox(height: height*0.035,),
                GestureDetector(
                  onTap: (){
                    if(_keyForm.currentState!.validate()){
                      EmailLoginMethod();
                    }
                  },
                  child: Container(
                    height: height*0.059,
                    width: width*0.3,
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),

                      ),
                    ),
                  ),
                ),

                SizedBox(height: height*0.035,),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                }, child: Text("Create an Account")),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInWithPhone()));
                }, child: Text("Sign In with Phone"))

              ],
            ),
         )
        ),
      ),
    );
  }
}
