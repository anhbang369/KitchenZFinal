import 'package:firstapp/models/payment_model.dart';
import 'package:firstapp/service/api_service.dart';
import 'package:flutter/material.dart';

import 'detail_history.dart';

class History1 extends StatefulWidget {
  const History1({Key? key}) : super(key: key);

  @override
  State<History1> createState() => _History1State();
}

class _History1State extends State<History1> {
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
      body: FutureBuilder(
        future: ApiService.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.uid != 'BKJq8xaAnHhIhe8AnUEmLPpraqo1') {
              return const Center(
                child: Text('You are not admin'),
              );
            }
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'STT',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Mã thanh toán',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Status',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                    future: ApiService.getListPayment(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                snapshot.data!.length,
                                (index) => buildPayment(
                                  context,
                                  index: index,
                                  payment: snapshot.data![index],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                const SizedBox(
                  height: 5,
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildPayment(
    BuildContext context, {
    required int index,
    required PaymentModel payment,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailHistory(
              payment: payment,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              color: index % 2 == 1
                  ? const Color(0xffe8e2d3)
                  : const Color.fromARGB(255, 193, 233, 209),
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      index.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 140),
                  Text(
                    payment.id.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      payment.status,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: payment.status == 'COMPLETED'
                              ? Colors.green
                              : Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
