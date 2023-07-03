import 'package:firstapp/models/payment_model.dart';
import 'package:firstapp/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailHistory extends StatefulWidget {
  const DetailHistory({Key? key, required this.payment}) : super(key: key);
  final PaymentModel payment;
  @override
  State<DetailHistory> createState() => _DetailHistoryState();
}

class _DetailHistoryState extends State<DetailHistory> {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  late PaymentModel payment;
  @override
  void initState() {
    payment = widget.payment;
    super.initState();
  }

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
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Hóa đơn',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text(
                  'UserID:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                Text(
                  'UserID12354564',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                const Text(
                  'Thành tiền:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  payment.amount.ceil().toString(),
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                const Text(
                  'Ngày tạo:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  // Format date
                  formatter.format(payment.createdDate),
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                const Text(
                  'Trạng thái:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  payment.status,
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Text(
                  'UserID:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                Text(
                  'UserID12354564',
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
                  'UserID:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                Text(
                  'UserID12354564',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ), //chỉ admin với hiện Button Cấp vip, còn user chỉ xem detail thôi
          TextButton(
            onPressed: () async {
              // Show loading
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
              ApiService.updateVipUser(payment.id.toString()).then(
                (value) {
                  setState(() {
                    // Update status
                    payment = value;
                  });
                  Navigator.of(context).pop();
                },
              );
            },
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 40,
              child: const Center(
                  child: Text(
                'Cấp VIP',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
