
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Amount with ChangeNotifier {
  var _product_list = new List.empty(growable: true);
  var _product_amount = new List.empty(growable: true);
  var orderList = new List.empty(growable: true);

  get product_list => _product_list;
  get product_amount => _product_amount;

  int count = 1;
  var _order_count;

  get order_count => _order_count;

  void product_add() {
    FirebaseFirestore.instance.collection('waffle').snapshots().forEach((
        element) {
      count = element.size;
    });
    for (int i = 0; i < count; i++) {
      final usercol = FirebaseFirestore.instance.collection("waffle").doc(
          "waffle${i+1}_amount");
      usercol.get().then((value) =>
      {
        _product_list.add(value.data()!['username']),
        _product_amount.add(value.data()!['amount']),
      });
    }
    notifyListeners();
  }

  void reset_process() {
      _product_list.clear();
      _product_amount.clear();
      notifyListeners();
  }

  void reser_orderList() {
    orderList.clear();
  }
  void showOrderList() {

    FirebaseFirestore.instance.collection('orderList').snapshots().forEach((
        element) {
      _order_count = element.size;
    });


    for(int i = 0; i < _order_count; i++) {
      FirebaseFirestore.instance.collection('orderList').doc('orderList${i+1}').get().then((value) =>
      {
        orderList.add("${value.data()!['name']}, ${value.data()!['date']}  ${value.data()!['time']}"),
      });
    }
    print(orderList);
  }

  void createOrderList(String name, String phone, String date, String time){
    FirebaseFirestore.instance.collection('waffle').snapshots().forEach((
        element) {
      count = element.size;
    });
    final usercol = FirebaseFirestore.instance.collection("orderList").doc(
        "orderList${_order_count+1}");
    usercol.set({
      "name" : name,
      "phone" : phone,
      "date" : date,
      "time" : time,
    });
    for (int i = 1; i <= count; i++) {
      final usercol1 = FirebaseFirestore.instance.collection("waffle").doc(
          "waffle${i}_amount");
      usercol1.get().then((value) =>
      {
       usercol.update({
        "menu$i": "${value.data()!['username']}  :  ${value.data()!['amount']}",
        })
      });
    }
  }


  void deleteData() {
    for (int i = 1; i <= count; i++) {
      FirebaseFirestore.instance.collection("waffle").doc(
          "waffle${i}_amount").delete();
    }
  }

  void createData(String name, int amount){
    if(amount > 0) {
      final usercol = FirebaseFirestore.instance.collection("waffle").doc(
          "waffle${count + 1}_amount");
      usercol.set({
        "username": name,
        "amount": amount,
      });
      product_add();
    }
  }
}

class AmountSet with ChangeNotifier {

  int _count = 0;
  int get count => _count;

  void amount_add() {
    _count++;
    notifyListeners();
  }

  void amount_sub() {
    if(_count > 0) {
      _count--;
    }
    notifyListeners();
  }

  void amount_set() {
    _count = 0;
    notifyListeners();
  }
}
