import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/amount.dart';

import 'package:provider/provider.dart';


import 'package:firebase_core/firebase_core.dart';

import 'dart:io' show Platform;

class checkOrder extends StatefulWidget {
  @override
  State<checkOrder> createState() => _checkOrder();
}

class _checkOrder extends State<checkOrder> {

  @override
  Widget build(BuildContext context) {

    context.read<Amount>().showOrderList();
      return Scaffold(
          appBar: AppBar(
            title: Text('Check Order'),
            centerTitle: true,
          ),
          body: Builder(builder: (context)
          {
            return ListView.builder(

                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                //vertical : 수직으로 나열 / horizontal : 수평으로 나열
                itemCount: context.read<Amount>().order_count,//context.read<Amount>().order_count,
                //리스트의 개수

                padding: EdgeInsets.only(top: 10),
                itemBuilder: (BuildContext context, int index) {
                  //리스트의 반목문 항목 형성
                  return Container(

                      height: 30,
                      color: Colors.lightBlueAccent,
                      alignment: Alignment.center,
                      child: Text(
                        context.read<Amount>().orderList[index]
                  ));
                });
          }
          ));
    }
  }