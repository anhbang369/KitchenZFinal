import 'package:flutter/material.dart';

class DetailHistory extends StatefulWidget {
  const DetailHistory({Key? key}) : super(key: key);

  @override
  State<DetailHistory> createState() => _DetailHistoryState();
}

class _DetailHistoryState extends State<DetailHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Chi tiết thanh toán'),
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
          SizedBox(height: 30,),
          Text('Hóa đơn', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.deepOrange),),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('UserID:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('UserID12354564', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('Thành tiền:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('100000', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('Ngày tạo:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('14/5/2023', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('Trạng thái:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('Thành Công', style: TextStyle(fontSize: 18, color: Colors.green),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('UserID:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('UserID12354564', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text('UserID:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Spacer(),
                Text('UserID12354564', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          SizedBox(height: 30,),//chỉ admin với hiện Button Cấp vip, còn user chỉ xem detail thôi
          TextButton(
              onPressed: ()=>{

              },
              child: Container(
                color: Colors.blue,
                  width: 100,
                  height: 40,
                  child: Center(child: Text('Cấp VIP', style: TextStyle(fontSize: 20,color: Colors.white),)),
              ),
          )
        ],
      ),
    );
  }
}
