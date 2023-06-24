import 'package:firstapp/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QrMomo extends StatefulWidget {
  const QrMomo({Key? key}) : super(key: key);

  @override
  State<QrMomo> createState() => _QrMomoState();
}

class _QrMomoState extends State<QrMomo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Thanh toán'),
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
        future: ApiService.createPayment(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    'Quét mã để thanh toánn',
                    style: TextStyle(fontSize: 26, color: Colors.purple),
                  ),
                ),
                const Image(image: AssetImage('assets/imageMomo.jpg')),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Nguời nhận:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        'Lê Thanh Duy',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Số điện thoại:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        '0903701165',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Số tiền:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        '60.000 VND',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    children: [
                      const Text(
                        'Lời nhắn:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            'Đăng ký thành viên VIP cho ứng dụng KitchenZ với id là ${snapshot.data!.id}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                      'Đăng ký thành viên VIP cho ứng dụng KitchenZ với id là ${snapshot.data!.id}'));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Copied to clipboard')),
                              );
                            },
                            child: IconButton(
                              icon: Icon(
                                Icons.copy,
                                color: Colors.grey.shade600,
                              ),
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text:
                                        'Đăng ký thành viên VIP cho ứng dụng KitchenZ với id là ${snapshot.data!.id}'));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Copied to clipboard')),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
