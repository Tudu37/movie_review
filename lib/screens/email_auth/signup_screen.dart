
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _emailAddressController= TextEditingController();
  TextEditingController _passwordController= TextEditingController();
  TextEditingController _confirmPasswordController= TextEditingController();
  final GlobalKey<FormState> _keyForm =GlobalKey<FormState>();
  bool showPassword = false;


  FirebaseAuth _firebaseAuth =  FirebaseAuth.instance;

  void signUpMethod()async{

    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: _emailAddressController.text.toString().trim(), password: _passwordController.text.toString().trim())
          .then((value) {
            Fluttertoast.showToast(msg:"your account has successfully been created");  //for success of account

                  if(value.user!=null){  //to check if same user credential is logged in  then go back
                   Navigator.pop(context);
                     }

        });
        // .onError((error, stackTrace) => Fluttertoast.showToast(msg: error.toString()))



    }  on FirebaseAuthException catch(ex){
         Fluttertoast.showToast(msg: ex.code.toString());
     }


  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back)
        ),
        title: Text("Create an Account",),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  SizedBox(
                    height:height*0.07,
                  ),
                  TextFormField(
                    controller: _emailAddressController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    validator: (email){
                      if(email==null || email.isEmpty){
                       return "please enter your email";
                      }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
                       return "Please enter a valid email address";
                      }
                    },
                    style: TextStyle(
                      fontSize:20 ,
                      fontWeight:FontWeight.w400 ,
                      fontFamily:"Nunito" ,
                      color: Colors.black
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      hintText: "Enter Email Address",
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Nunito",
                        color: Color.fromRGBO(169, 169, 169, 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color:Color.fromRGBO(169, 169, 169, 1,),width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color:Colors.black,width: 1)
                      ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color:Colors.black,width: 1)
                        )
                    ),

                  ),
                  SizedBox(
                    height:height*0.02,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    obscureText:showPassword?false: true,
                    style: TextStyle(
                        fontSize:20 ,
                        fontWeight:FontWeight.w400 ,
                        fontFamily:"Nunito" ,
                        color: Colors.black
                    ),
                    validator: (password){
                      if(password==null || password.isEmpty){
                        return "please enter password";
                      }
                    },
                    decoration: InputDecoration(
                      suffix:
                        GestureDetector(
                          onLongPressStart: (value){
                            showPassword=true;
                              setState(() {
                              });
                              },
                          
                          onLongPressEnd: (value){
                            showPassword=false;
                            setState(() {
                            });
                          },
                          child: Container(
                            child:showPassword?Icon(Icons.remove_red_eye_rounded):Icon(Icons.remove_red_eye_outlined),
                          ),
                        )

                      /*IconButton(
                        onPressed: (){
                          if(showPassword) {
                            showPassword = false;
                          }else if(!showPassword){
                            showPassword= true;
                          }
                          setState(() {
                          });
                          },
                        icon:showPassword?Icon(Icons.remove_red_eye_rounded):Icon(Icons.remove_red_eye_outlined) ,
                      )*/
                        ,
                        contentPadding: const EdgeInsets.all(20),
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Nunito",
                          color: Color.fromRGBO(169, 169, 169, 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color:Color.fromRGBO(169, 169, 169, 1,),width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color:Colors.black,width: 1)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color:Colors.black,width: 1)
                        )
                    ),

                  ),

                  SizedBox(
                    height:height*0.02,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize:20 ,
                        fontWeight:FontWeight.w400 ,
                        fontFamily:"Nunito" ,
                        color: Colors.black
                    ),
                    validator: (confirmpassword){
                      if(confirmpassword==null || confirmpassword.isEmpty){
                        return "please enter confirm password";
                      }else if(confirmpassword!=_passwordController.text.toString()){
                        return "Your Password does not Match";
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        isDense: true,
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Nunito",
                          color: Color.fromRGBO(169, 169, 169, 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color:Color.fromRGBO(169, 169, 169, 1,),width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color:Colors.black,width: 1)
                        ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color:Colors.black,width: 1)
                      )
                    ),
                  ),
                  SizedBox(height: height*0.03,),
                  GestureDetector(
                    onTap: (){
                      if(_keyForm.currentState!.validate()){
                        signUpMethod();
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("your Account has been Successfully Created")));
                      }

                    },
                    child: Container(
                      height: height*0.06,
                      width: width*0.45,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Center(
                        child: Text("Create Account",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),
                        ),
                      )

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
