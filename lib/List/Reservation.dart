import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/amount.dart';

import 'package:provider/provider.dart';


import 'package:firebase_core/firebase_core.dart';

import 'dart:io' show Platform;

class Reservation extends StatefulWidget {
  @override
  State<Reservation> createState() => _Reserve();
}

class _Reserve extends State<Reservation> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String _selectedTime = '시간 선택';
  String _selectedDate = '날짜 선택';

  // Order order = new Order();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Form(
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 15.0,
                        )),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(children: [
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(labelText: '예약자 성함'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: controller2,
                        decoration: InputDecoration(labelText: '예약자 전화번호'),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        RaisedButton(
                          child: Text(_selectedDate),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            Future<DateTime?> selectedDate = showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //초기값
                            firstDate: DateTime.now(), //시작일
                            lastDate: DateTime(2023), //마지막일
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.dark(), //다크 테마
                                child: child!,
                              );
                            },
                          );

                          selectedDate.then((dateTime) {
                            setState(() {
                              _selectedDate = dateTime!.year.toString() +" / "+ dateTime.month.toString() +" / "+  dateTime.day.toString();
                            });
                          });
                          },
                        ),
                          SizedBox(width: 40,),

                          RaisedButton(

                            child: Text(_selectedTime),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {
                              Future<TimeOfDay?> future = showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              future.then((timeOfDay) {
                                setState(() {
                                  _selectedTime = '${timeOfDay?.hour}:${timeOfDay?.minute}';

                                });
                              });
                            },
                          ),
                        ]
                      ),

                      ListView.builder(

                          shrinkWrap: true,
                          scrollDirection: Axis.vertical, //vertical : 수직으로 나열 / horizontal : 수평으로 나열
                          itemCount: context.read<Amount>().count, //리스트의 개수
                          padding: EdgeInsets.only(top: 10),
                          itemBuilder: (BuildContext context, int index) {
                            //리스트의 반목문 항목 형성
                            return Container(

                                height: 30,
                                color: Colors.lightBlueAccent,
                                alignment: Alignment.center,
                                child: Text("${context.read<Amount>().product_list[index]} : ${context.read<Amount>().product_amount[index]}",)
                              );
                          }),

                      SizedBox(height: 20,),
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: RaisedButton(
                              color: Colors.orange,
                              child: Text(
                                '예약',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
        if(controller.text.isNotEmpty && controller2.text.isNotEmpty && _selectedDate != "날짜 선택" && _selectedTime != "시간 선택") {
          context.read<Amount>().createOrderList(
              controller.text, controller2.text, _selectedDate, _selectedTime);
        } else{
          showSnackBar(context);
        }
                              })),
                      SizedBox(height: 10,),
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: RaisedButton(
                              color: Colors.orange,
                              child: Text(
                                '장바구니 비우기',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                context.read<Amount>().deleteData();
                              }))
                    ]),
                  ),
                ),
              )
            ]),
          ),
        );
      }),
    );
  }
}

void showSnackBar(BuildContext context) {

  Scaffold.of(context).showSnackBar(
      SnackBar(content:
      Text('입력하지 않은 창이 있습니다. 모든 창에 입력해주세요',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}

//
// class Order {
//
//   int product_amount = 0;
//   String product_name = '123';
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   final userCollectionReference = FirebaseFirestore.instance.collection("waffle").doc("waffle_amount");
//   Order() {
//
//     firestore.collection("waffle").doc('waffle_amount').get().then((value) => {
//     });
//   }
// }

// String readname(String code, product_name){
//   final usercol=FirebaseFirestore.instance.collection("waffle").doc("$code");
//   usercol.get().then((value) => {
//      = value.data()!['username'],
//     print(product_name)
//   });
//   return product_name;
// }

int readamount(String code, product_amount){
  final usercol=FirebaseFirestore.instance.collection("waffle").doc("$code");
  usercol.get().then((value) => {
    product_amount = value.data()!['amount'],
  });
  return product_amount;
}