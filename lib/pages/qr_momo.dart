import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Text('Quét mã để thanh toán', style: TextStyle(fontSize: 26,color: Colors.purple),),
          ),
          Image(image: AssetImage('assets/imageMomo.jpg')),
          SizedBox(height: 10,),
          Text('QR code MoMo', style: TextStyle(fontSize: 24, color: Colors.purple),),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('Nguời nhận:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('Lê Thanh Duy', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('Số điện thoại:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('0903701165', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('Số tiền:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('60.000 VND', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('Lời nhắn:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('UserID1235456465', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: TextButton(
                      onPressed:() async {

                      },
                      child: Text('Xác nhận',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blue, // Màu sắc của border
                      width: 2.0, // Độ dày của border
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {},
                    child: Text(
                      'Đóng',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              )


            ],
          )
        ],
      ),
    );
  }
}
