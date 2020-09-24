import 'package:flutter/material.dart';
import 'package:hesap_makinem/main.dart';

void main(){
  runApp(HakkindaApp()

  );
}

class  HakkindaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => (MyApp())));
              }
          ),
          title: Text('Geliştirici Hakkında',),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        body: SafeArea( // SafeArea çentikli vb. telefonlarda yazıyı çentik kısmına getirmiyor
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50,),
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('assets/images/hakkindafoto.jpg'),
                ),
                Text("Süleyman İnce",
                    style: TextStyle(
                      fontFamily: 'Holimount',
                      fontSize: 100,
                      color: Colors.greenAccent
                    ),
                ),
                Container(
                    width: 300,
                    child: Divider(height: 50,color: Colors.white,)),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.email,size: 40,color: Colors.red,),
                      title: Text("dev.suleymanince@gmail.com",style: TextStyle(fontSize: 19.0,color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.person,size: 40,color: Colors.blue,),
                      title: Text("instagram/suleymaninception",style: TextStyle(fontSize: 19.0,color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
/*child: Row(
children: <Widget>[
Icon(Icons.email,size: 45,color: Colors.red,),
SizedBox(width: 20.0),
Text("dev.suleymanince@gmail.com",style: TextStyle(fontSize: 20.0,color: Colors.white),)
],
),*/