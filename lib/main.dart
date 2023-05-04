import 'package:flutter/material.dart';
import 'package:flutter_application_1/List/waffle_menu.dart';
import 'package:flutter_application_1/List/drink_menu.dart';
import 'package:flutter_application_1/drawer/checkOrder.dart';

import 'List/Reservation.dart';
import 'package:provider/provider.dart';

import 'amount.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'dart:io' show Platform;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Amount>(create: (_) => Amount()),
    ChangeNotifierProvider<AmountSet>(create: (_) => AmountSet())
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waffle Univ',
      home: MainPage(),

    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.blue,),);
          }),

        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Row(
          children: <Widget> [
            Transform.scale(
              alignment: Alignment(0, 0),
              child: Image(image: AssetImage('image/Logo.png')),
              scale: 0.6,
            ),
            Column( children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'in Seochang',

                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 3, 0, 167),
                ),
              ),
            ])
          ],
        ),
      ),
      drawer: Drawer(
        // 드로워 화면 구현
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 50,),
            ListTile(
              // 리스트형으로 타일을 배치하는 위젯
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('home'),
              onTap: () {
                print('home Button is Clicked');
              },
              trailing: Icon(Icons.add),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(
                // 리스트 타일에 왼쪽부터 위젯들을 배치
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('예약 확인'),
              onTap: () {
                // 클릭시 동작
                Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => checkOrder()));
              },
              trailing: Icon(Icons.add), // 리스트 타일의 오른쪽부터 위젯들을 배치
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(
                // 리스트 타일에 왼쪽부터 위젯들을 배치
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('쿠폰'),
              onTap: () {
                // 클릭시 동작
                print('Coupon Button is Clicked');
              },
              trailing: Icon(Icons.add), // 리스트 타일의 오른쪽부터 위젯들을 배치
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('설정'),
              onTap: () {
                print('Setting Button is Clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 0,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20,10,0,10),
                leading: Image(
                  image: AssetImage('image/waffle_icon.png'),
                ),
                title: Text(
                  'Waffle',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  context.read<Amount>().reser_orderList();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Waffle_menu()));
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20,10,0,10),
                leading: Image(
                  image: AssetImage('image/waffle_icon.png'),
                ),
                title: Text(
                  'Drink',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Drink_menu()));
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20,10,0,10),
                leading: Image(
                  image: AssetImage('image/waffle_icon.png'),
                ),
                title: Text(
                  'Reservation',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  context.read<Amount>().reset_process();
                  context.read<Amount>().product_add();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Reservation()));
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20,10,0,10),
                leading: Image(
                  image: AssetImage('image/waffle_icon.png'),
                ),
                title: Text(
                  'Location',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
            ],
          ),
        );
      }),
    );
  }
}
