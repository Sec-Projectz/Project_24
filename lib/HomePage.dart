import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'password_generator.dart';


class HomePage extends StatefulWidget {
  
   

  HomePage({
    this.auth,
    this.onSignedOut,
    
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  void _logOutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    
   
    // TODO: implement build
    var _generatedpassword=generatePassword(true, true, true, false, 17);
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
        
          body: Center(
           
            child: Text(
                " One time password for travelfreak.com login= $_generatedpassword", style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center),
           
      ),
      // body: Container(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app),
                iconSize: 50.0,
                color: Colors.white,
                onPressed: _logOutUser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
