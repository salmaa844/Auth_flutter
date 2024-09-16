
import 'package:flutter/material.dart';
import 'package:flutter_identity1/profile.dart';
import 'package:flutter_identity1/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Login '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final formkey = GlobalKey<FormState>();
 TextEditingController conemail = TextEditingController();
 TextEditingController conpassword = TextEditingController();
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 235, 182, 200)
        ,
        title: Text(widget.title),
        
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
                controller: conpassword,
                obscureText: isObscured,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  ),
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
                         profilePage(email: conemail.text.toString(),password: conpassword.text.toString(),),
                      ),
                      );
                }
                else{
                  print("Not Done");
                }
                }
               , child: Text("Login")
               ),
                 ElevatedButton(
                
                onPressed:()
                { 
                      Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => 
                         SignupPage(),
                      ),
                      );
                }
                
                
               , child: Text("signup")
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
