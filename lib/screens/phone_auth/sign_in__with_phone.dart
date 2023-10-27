import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_review/screens/phone_auth/verify_otp.dart';


class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({Key? key}) : super(key: key);

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {

  TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void SendOTP()async{
    String PhoneNumber = "+91" + _phoneNumberController.text.trim();

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: PhoneNumber,
        codeSent: (VerificationID,resendToken){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOTP(VerificationId: VerificationID,)));
        },
        verificationCompleted: (credential){},
        verificationFailed: (ex){
          Fluttertoast.showToast(msg: ex.code.toString());
        },
        codeAutoRetrievalTimeout: (VerificationID){},
      timeout: Duration(seconds: 30)
    );

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In With Phone"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _phoneNumberController,
                cursorColor: Colors.black,
                maxLength: 10,
                keyboardType: TextInputType.number,
                validator: (email){
                  if(email==null || email.isEmpty){
                    return "please enter your Phone number";
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
                    hintText: "Enter Your Phone Number",
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
              /*if(_keyForm.currentState!.validate()){
                SendOTP();
              }*/
              SendOTP();
            },
            child: Container(
                height: height*0.06,
                width: width*0.45,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Center(
                  child: Text("Sign In",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),
                  ),
                )
            )
            ),
            ],
          ),
        ),
      ),
    );
  }
}
