/*

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Add_Post extends StatefulWidget {
  const Add_Post({Key? key}) : super(key: key);

  @override
  State<Add_Post> createState() => _Add_PostState();
}

class _Add_PostState extends State<Add_Post> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                CupertinoButton(

                  onPressed: ()async {
                    XFile? selectedFile = await ImagePicker().pickImage(source: ImageSource.gallery) ;
                    if(selectedFile!=null){
                      File convertedFile = File(selectedFile!.path);
                      setState(() {
                        profilePic= convertedFile;
                      });
                      Fluttertoast.showToast(msg: "Image is Selected");
                    }else {
                      Fluttertoast.showToast(msg: "image is not selected");
                    }
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: profilePic!=null?FileImage(profilePic!):null,
                    backgroundColor: Colors.grey,
                  ),
                ),

                SizedBox(height: 10,),

                TextFormField(
                  controller: _nameController,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      fontSize:20 ,
                      fontWeight:FontWeight.w400 ,
                      fontFamily:"Nunito" ,
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter the Your Name",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Nunito",
                      color: Color.fromRGBO(169, 169, 169, 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _titleController,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      fontSize:20 ,
                      fontWeight:FontWeight.w400 ,
                      fontFamily:"Nunito" ,
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter the Post",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Nunito",
                      color: Color.fromRGBO(169, 169, 169, 1),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      fontSize:20 ,
                      fontWeight:FontWeight.w400 ,
                      fontFamily:"Nunito" ,
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Your email",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Nunito",
                      color: Color.fromRGBO(169, 169, 169, 1),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black,width: 1)
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                GestureDetector(
                  onTap: (){
                    if(_nameController.text.isNotEmpty && _titleController.text.isNotEmpty && _emailController.text.isNotEmpty && profilePic!=null){
                      AddPost(
                          _nameController.text.toString(),
                          _titleController.text.toString(),
                          _emailController.text.toString().trim()
                      );
                      setState(() {
                        _nameController.clear();
                        _titleController.clear();
                        _emailController.clear();
                        profilePic=null;
                      });
                    }else{
                      Fluttertoast.showToast(msg: "Please fill all the fields");
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
                        child: Text("Add Post",
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
    );
  }
}
*/
