import 'package:firstapp/pages/detail_history.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Lịch sử thanh toán'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Container(
              child: Row(
                children: [
                  Text('STT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text('Mã thanh toán', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text('Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailHistory(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    color: Color(0xffe8e2d3),
                    height: 40,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('1', style: TextStyle(fontSize: 18),),
                        ),
                        Spacer(),
                        Text('n465das4d6a54d5sa6', style: TextStyle(fontSize: 18),),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text('Thành công', style: TextStyle(fontSize: 18, color: Colors.green),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
