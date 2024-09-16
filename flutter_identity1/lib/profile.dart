

import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  final String email;
  final String password;
   final String name;
  const profilePage({super.key,required this.email,required this.password,this.name=""});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 235, 182, 200),
          title:  Text("Profile",style: TextStyle(color: Color.fromARGB(255, 88, 68, 147),fontWeight: FontWeight.normal)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png"),
                radius: 20.0,
                
              ),
            ),
          ],
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 32.0, 
                      fontWeight: FontWeight.bold,
                      color:const Color.fromARGB(255, 88, 68, 147), 
                    )
                    ),
                  SizedBox(height: 10), 
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png"),
                    radius: 40.0,
                  ),
                  Padding(padding:EdgeInsets.all(20.0) ),
                  Text("Email"+":"+widget.email,
                  style: TextStyle(
                      fontSize: 20.0, 
                      color: const Color.fromARGB(255, 88, 68, 147),
                      fontWeight: FontWeight.bold, 
                    )),
                  Text("Name"+":"+widget.name,
                  style: TextStyle(
                      fontSize: 20.0, 
                      color: const Color.fromARGB(255, 88, 68, 147),
                      fontWeight: FontWeight.bold, 
                    ))
                ],
              ),
            ),
          ),
        ),



    );
  }
}