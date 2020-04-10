import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/pages/home_firebase.dart';
import 'package:test_app/pages/product_list.dart';
import 'package:test_app/pages/upload_images.dart';
import 'package:test_app/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

class Nearby extends StatefulWidget {
  final FirebaseUser user;

//  final DBref = FirebaseDatabase.instance.reference();

  Nearby(this.user, {Key key}) : super(key: key);

  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<Nearby>
    with SingleTickerProviderStateMixin {
  final DBref = FirebaseDatabase.instance.reference();
  TabController tabController;
  List<String> tabs = ["ใกล้คุณ", "เป็นที่นิยม"];

  FirebaseUser get user => null;

  @override
  initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = TabBar(
      controller: tabController,
      indicatorColor: Color.fromRGBO(36, 218, 216,1),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0),
        insets: EdgeInsets.symmetric(horizontal: 55.0),
      ),
      labelColor: Color.fromRGBO(36, 218, 216,1),
      labelStyle: TextStyle(fontSize: 22.0, fontFamily: AppFonts.primaryFont),
      unselectedLabelColor: Color.fromRGBO(36, 218, 216,0.3),
      tabs: tabs.map((tabName) => Tab(text: tabName)).toList(),
    );

    final tabBarView = Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.only(top: 30.0),
        child: TabBarView(
          controller: tabController,
          children: <Widget>[ProductList(), ProductList()],
        ),
      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(240, 101, 31, 1),
        title: new Text('Gozione',
            style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 0.0),
//        color: Color.fromRGBO(195, 232, 231,1),

        child: Column(
          children: <Widget>[
//            tabBar,
            tabBarView,
//            RaisedButton(
//              child: Text("Write Data"),
//              onPressed: () {
//                DBref.child('Member').child('A140').set({
//                  'name': 'ร้าน 004',
//                  'id' : '004',
//                  'description': 'หาดบางแสน',
//                  'location_lat': '99.912984',
//                  'location_long': '13.360193',
//                  'images1':
//                  "https://firebasestorage.googleapis.com/v0/b/gozione.appspot.com/o/logo.png?alt=media&token=1a1437c0-50a3-4d16-b7ff-687bc333ed1e",
//                  'images2':
//                  "https://firebasestorage.googleapis.com/v0/b/gozione.appspot.com/o/10.jpg?alt=media&token=815c644b-e11e-4b36-b33e-d1423fd6a9a3",
//                  'images3':
//                  "https://firebasestorage.googleapis.com/v0/b/gozione.appspot.com/o/12.jpg?alt=media&token=a135b1af-2472-4649-81b0-fa2e3a451bd5",
//                  'images4':
//                  "https://firebasestorage.googleapis.com/v0/b/gozione.appspot.com/o/13.jpg?alt=media&token=83aa1ae7-e731-4c6b-8d50-e491b111365b",
//                  'images5':
//                  "https://firebasestorage.googleapis.com/v0/b/gozione.appspot.com/o/c82b9d7cfaef4f1c885e08bb8520a001.jpg?alt=media&token=0c6db833-9fed-44da-9752-746445ed2116",
//                  'working_start': '8.00',
//                  'working_end': '18.00',
//                  'dayoff': 'ไม่มี'
//                });
//              },
//            ),
//            RaisedButton(
//              child: Text("Read Data"),
//              onPressed: () {
//                DBref.once().then((DataSnapshot datasnapshot) {
//                  print(datasnapshot.value);
//                });
//              },
//            ),
//            RaisedButton(
//              child: Text("Update Data"),
//              onPressed: () {
//                DBref.child("abc")
//                    .child('data')
//                    .update({'data': 'This is a update data'});
//              },
//            ),
//            RaisedButton(
//              child: Text("Delete Data"),
//              onPressed: () {
//                DBref.child('Member')
//                    .child('A002')
//                    .remove();
//              },
//            ),
          ],
        ),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
//              arrowColor: Colors.black,
              accountName: new Text('สวัสดี'),
              accountEmail: new Text("ยินดีต้อนรับ"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('https://firebasestorage.googleapis.com/v0/b/gozione.appspot.com/o/งานออกแบบที่ไม่มีชื่อ-5.png?alt=media&token=7662218e-1376-4356-8c88-3efea9354378'),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 101, 31, 1)
              ),
            ),
//            new ListTile(
//              title: new Text('Play Games'),
//              onTap: () {
//                Navigator.of(context).pop();
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => MyHomePage(user)));
//              },
//            ),
//            new ListTile(
//              title: new Text('Upload Images'),
//              onTap: () {
//                Navigator.of(context).pop();
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => UploadPage()));
//              },
//            ),
//            new ListTile(
//              title: new Text('ลงชื่อออก'),
//              onTap: () {
//                signOut(context);
//              },
//            )
          ],
        ),
      ),
    );
  }

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyLoginPage()),
        ModalRoute.withName('/'));
  }
}
