import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:test_app/pages/gps.dart';
import 'package:test_app/services/alert.service.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  String name;
  String images1;
  String description;
  double lat;
  double long;
  String start;
  String end;
  String images2;
  String images3;
  String images4;
  String images5;
  String phone;

  Detail(
      String name,
      String images1,
      String description,
      double lat,
      double long,
      String start,
      String end,
      String images2,
      String images3,
      String images4,
      String images5,
      String phone) {
    this.name = name;
    this.images1 = images1;
    this.description = description;
    this.lat = lat;
    this.long = long;
    this.start = start;
    this.end = end;
    this.images2 = images2;
    this.images3 = images3;
    this.images4 = images4;
    this.images5 = images5;
    this.phone = phone;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Detailstate(name, images1, description, lat, long, start, end,
        images2, images3, images4, images5 , phone);
//    return imageslide();
  }
}

class _Detailstate extends State<Detail> {
  String name;
  String images1;
  String description;
  double lat;
  double long;
  String start;
  String end;
  String images2;
  String images3;
  String images4;
  String images5;
  String phone;

  _Detailstate(
      String name,
      String images1,
      String description,
      double lat,
      double long,
      String start,
      String end,
      String images2,
      String images3,
      String images4,
      String images5,
      String phone) {
    this.name = name;
    this.images1 = images1;
    this.description = description;
    this.lat = lat;
    this.long = long;
    this.start = start;
    this.end = end;
    this.images2 = images2;
    this.images3 = images3;
    this.images4 = images4;
    this.images5 = images5;
    this.phone = phone;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromRGBO(240, 101, 31, 1),
      ),
      body: ListView(children: <Widget>[
        Image.network(images1,fit: BoxFit.fill,),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'รายละเอียด',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 20,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 15,
                ),
              ),
              Text(
                "ร้านเปิด : ${start.toUpperCase()}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "ร้านปิด : ${end.toUpperCase()}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        imageslide(images2, images3, images4, images5),
        RaisedButton(
          onPressed: () {
//            print(lat);
//            print(long);
//            print(name);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GPSlocation(lat, long, name)));
          },
          child: const Text('สถานที่ตั้ง', style: TextStyle(fontSize: 20)),
        ),
//        RaisedButton(
//          onPressed: () {
//            Share.share(
//                'Check out our apps: https://play.google.com/store/apps/details?id=com.saleafterservice.gozione');
//          },
//          child: const Text('แชร์', style: TextStyle(fontSize: 20)),
//        ),
        RaisedButton(
            onPressed: (){ launch("tel://$phone");
            },
            child: const Text('โทร', style: TextStyle(fontSize: 20))),
        RaisedButton(
//          shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.vertical(
//                top: Radius.circular(20.0),
//              )),
          onPressed: () {
            AlertService().showAlert(
              context: context,
              message: "ได้ทำการสำรองที่นั่ง ${widget.name} เรียบร้อยแล้ว.",
              type: AlertType.success,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "สำรองที่นั่ง",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                "${widget.name.toString()}",
                style: TextStyle(fontSize: 20.0, color: Colors.deepOrange[600]),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class imageslide extends StatefulWidget {
  String images2;
  String images3;
  String images4;
  String images5;

  imageslide(String images2, String images3, String images4, String images5) {
    this.images2 = images2;
    this.images3 = images3;
    this.images4 = images4;
    this.images5 = images5;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _imageslideState(images2, images3, images4, images5);
  }
}

class _imageslideState extends State<imageslide> {
  String images2;
  String images3;
  String images4;
  String images5;

  _imageslideState(
      String images2, String images3, String images4, String images5) {
    this.images2 = images2;
    this.images3 = images3;
    this.images4 = images4;
    this.images5 = images5;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CarouselSlider(
      height: 150.0,
      items: [images2, images3, images4, images5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.white),
                child: GestureDetector(
                  child: Image.network(i, fit: BoxFit.fitWidth),
                ));
          },
        );
      }).toList(),
    );
  }

}
