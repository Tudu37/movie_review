import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_review/screens/home_screen.dart';

class VerifyOTP extends StatefulWidget {
  String VerificationId;
   VerifyOTP({required this.VerificationId,Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  TextEditingController _otpController = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  void VerifyOTP()async{
    String OTP = _otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.VerificationId, smsCode: OTP);

    try{
      await _firebaseAuth.signInWithCredential(credential)
          .then((value) {
           if(value.user!=null)
             Fluttertoast.showToast(msg: "your login is successful");
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
           })
      ;

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
                controller: _otpController,
                maxLength: 6,
                cursorColor: Colors.black,
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
                      VerifyOTP();
                    }*/
                    VerifyOTP();
                  },
                  child: Container(
                      height: height*0.06,
                      width: width*0.45,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Center(
                        child: Text("Verify",
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
