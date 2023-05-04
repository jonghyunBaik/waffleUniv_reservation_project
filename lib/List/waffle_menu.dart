
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/waffle_menu/apple_cinamon.dart';
import 'package:flutter_application_1/waffle_menu/oreo.dart';
import 'package:provider/provider.dart';

import '../amount.dart';

class Waffle_menu extends StatefulWidget {
  @override
  State<Waffle_menu> createState() => _Waffle_menuState();
}

class _Waffle_menuState extends State<Waffle_menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Waffle Menu'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10.0),
        childAspectRatio: 8.0 / 9.0,
        children: <Widget>[
          InkWell(
            onTap: () {
              context.read<AmountSet>().amount_set();
              Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Waffle_1()));
            },
            child:
            Padding(
              padding: EdgeInsets.all(10),

              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {
              context.read<AmountSet>().amount_set();
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Oreo()));
            },
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_2.png'),
                          Text('오레오 누텔라 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {
              context.read<AmountSet>().amount_set();},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_3.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
          InkWell(
            onTap: () {},
            child:
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  children: <Widget>[
                    Container(
                      width: 180,
                      child: Column(
                        children: <Widget> [
                          Image.asset('image/waffle_1.png'),
                          Text('애플 시나몬 와플',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
              ),
            ),),
    ]),


      // body: Builder(builder: (context) {
      //   return Padding(
      //     padding: EdgeInsets.all(30.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Column(children: <Widget>[
      //           Card(),
      //           CircleAvatar(
      //             backgroundColor: Colors.white,
      //             backgroundImage: AssetImage('image/waffle_1.png'),
      //             radius: 80.0,
      //           ),
      //           SizedBox(height: 10.0,),
      //           Text(
      //             '애플 시나몬 와플',
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(height: 30.0,),
      //           CircleAvatar(
      //             backgroundColor: Colors.white,
      //             backgroundImage: AssetImage('image/waffle_3.png'),
      //             radius: 70.0,
      //           ),
      //           Text(
      //             '슈크림 크런치 젤라또 와플',
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //         ]),
      //         Column(
      //           children: <Widget>[
      //             CircleAvatar(
      //               backgroundColor: Colors.white,
      //               backgroundImage: AssetImage('image/waffle_2.png'),
      //               radius: 85.0,
      //             ),
      //             Text(
      //               '오레오 누텔라 와플',
      //               style: TextStyle(
      //                   color: Colors.black, fontWeight: FontWeight.bold),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   );
      // }),
    );
  }
}
