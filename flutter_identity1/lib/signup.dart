import 'package:flutter/material.dart';

import 'package:flutter_identity1/profile.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   final formkey = GlobalKey<FormState>();
 TextEditingController conemail = TextEditingController();
 TextEditingController conpassword = TextEditingController();
  TextEditingController conname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("signup"),
      ),
      body: ListView(
       children: [
        Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
              TextFormField(
               controller: conemail,
               decoration: const InputDecoration(
                labelText: "email",
                
                border: OutlineInputBorder(),
               ),
               validator: (value){

              if( value!.isEmpty){
                      return "Please enter your email";
              }else if(!isValidEmail(value)){
                  return ("please enter a vaild email");
              }else{
                return null;
              }
              
               },
              ),
              SizedBox(
                  height: 20,
              ),
              TextFormField(
               controller: conname,
               
               decoration: InputDecoration(
                labelText: "usar name",
                border: OutlineInputBorder(),
               ),),
                SizedBox(
                  height: 20,
              ),
              TextFormField(
               controller: conpassword,
               
               decoration: InputDecoration(
                labelText: "password",
                border: OutlineInputBorder(),
               ),
               validator: (value){
              bool haschar =false;
              bool hasnum = false;
              for(var i=0 ; i<value!.length;i++){
                    if(int.tryParse(value[i]) != null){
                        hasnum=true;
                    }else{
                      haschar=true;
                    }
              }
              if( value!.isEmpty){
                      return "Please enter your password";
              }else if (hasnum && haschar && value.length >8){
                  return null;
              }
              else{
                return "Please enter valid password";
              }
               },
               
              ),
               SizedBox(
                  height: 20,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 ElevatedButton(
                onPressed:(){ if(formkey.currentState!.validate()){
                      print("Done");
                      Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => 
                         profilePage(email: conemail.text.toString(),password: conpassword.text.toString(),name: conname.text.toString(),),
                      ),
                      );
                }
                else{
                  print("Not Done");
                }
                }
               , child: Text("Sign Up")
               ),
                 ElevatedButton(
                
                onPressed:()
                { 
                      /* Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => 
                        MyHomePage(title: ""),
                      ),
                      ); */
                      Navigator.pop(context);
                }
                
                
               , child: Text("Login")
               )
            
              ],)
            ],
          ),
          ),
          
          ),
       ],
      ),
    
    );
  }
  bool isValidEmail(String em) {

  String p =  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}
}