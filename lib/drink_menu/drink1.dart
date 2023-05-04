
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/List/Reservation.dart';
import 'package:provider/provider.dart';

import '../amount.dart';


class Drink1 extends StatefulWidget {
  @override
  State<Drink1> createState() => _Drink1();
}

class _Drink1 extends State<Drink1> {
  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("Dialog Title"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "장바구니로 가기",
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  context.read<Amount>().reset_process();
                  context.read<Amount>().product_add();
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Reservation()));
                },
              ),
              new FlatButton(
                child: new Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Apple Cinamon'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('image/americano.png')),
            Text('Americano',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),),
            SizedBox(height: 10,),
            Text('브라질 원산지 원두',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),),
            Text('깊고 풍부한 와플대학만에 커피',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      context.read<AmountSet>().amount_add();
                    });
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      context.read<AmountSet>().amount_sub();
                    });
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.remove,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              ],
              ),
            SizedBox(height: 20,),
            Text('개수 : ${context.read<AmountSet>().count}'),
            SizedBox(height: 20,),
            ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                    color: Colors.lightBlueAccent,
                    child: Text(
                      '장바구니로',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      context.read<Amount>().createData('아메리카노', context.read<AmountSet>().count);
                        FlutterDialog();
                    }))

          ],
        ),
      )
    );
  }
}

