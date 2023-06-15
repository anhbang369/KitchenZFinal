import 'dart:convert';

import 'package:firstapp/pages/menu.dart';
import 'package:firstapp/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_vn/momo_vn.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Map<String, dynamic>? paymentIntent;

  //MoMo
  late MomoVn _momoPay;
  late PaymentResponse _momoPaymentResult;
  // ignore: non_constant_identifier_names
  late String _paymentStatus;
  @override
  void initState() {
    super.initState();
    _momoPay = MomoVn();
    _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _paymentStatus = "";
    initPlatformState();
  }
  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {
    });
  }

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
          future: ApiService.getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isVip == true) {
                return const Center(
                    child: Text('Bạn đã là thành viên Premium'));
              } else {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 15, left: 15, top: 10),
                        child: Image.network(
                            'https://img.icons8.com/nolan/96/cash-receipt.png'),
                      ),
                      Text(
                        'Premium',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [Colors.blue, Colors.orange],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(const Rect.fromLTWH(0, 0, 200, 40)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                        child: Text(
                          'Mang đến cho bạn những trãi nghiệm tốt nhất, cũng như được cung cấp một số đặc quyền chỉ dành cho thành viên Premium',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 40,),
                      const Text(
                        '60.000 VND',
                        style:
                            TextStyle(fontSize: 50, color: Colors.deepOrange),
                      ),
                      SizedBox(height: 5,),
                      const Text(
                        'Thanh toán 30 ngày một lần',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        child: Container(
                          color: Colors.blueAccent,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Image(image: AssetImage('assets/visa.jpg'),width: 40,height: 40,),
                              ),
                              Container(
                                child: TextButton(
                                  child: Text('Thanh toán Visa', style: TextStyle(color: Colors.white, fontSize: 16),),
                                  onPressed: () async {
                                    await makePayment();
                                  },
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                  child: Container(
                                    color: Color(0xFFD82D8B),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 4),
                                          child: Image(image: AssetImage('assets/MoMo.png'),width: 40,height: 40,),
                                        ),
                                        TextButton(
                                          child: Text('Thanh toán MoMo', style: TextStyle(color: Colors.white),),
                                          onPressed: () async {
                                            MomoPaymentInfo options = MomoPaymentInfo(
                                                merchantName: "KitchenZ",
                                                appScheme: "MOxx",
                                                merchantCode: 'MOMOMWNB20210129',
                                                partnerCode: 'MOMOMWNB20210129',
                                                amount: 60000,
                                                orderId: '12321312',
                                                orderLabel: 'Gói combo',
                                                merchantNameLabel: "HLGD",
                                                fee: 10,
                                                description: 'Thanh toán gói Vip',
                                                username: '0387788906',
                                                partner: 'merchant',
                                                extra: "{\"key1\":\"value1\",\"key2\":\"value2\"}",
                                                isTestMode: false
                                            );
                                            try {
                                              _momoPay.open(options);
                                            } catch (e) {
                                              debugPrint(e.toString());
                                            }
                                          },
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 4),
                                          child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text(_paymentStatus.isEmpty ? "CHƯA THANH TOÁN" : _paymentStatus)
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('60000', 'VND');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Adnan'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        ApiService.updateVip().then((user) {
          if (user.isVip == true) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        Text("Thanh toán thành công"),
                      ],
                    ),
                  ],
                ),
              ),
            );
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Menu(title: '')));
          }
        }).catchError((error) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      Text("Cập nhật user thất bại"),
                    ],
                  ),
                ],
              ),
            ),
          );
        });

        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51N1idNG02NFclnWKeUJsxyW6AxxvqxpPqtnIYwtp4MatOraH5ouvLMXSEQDSsUEBSwGeFrkPBIiTgouXFO735f2h003JannDdP',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 1;
    return calculatedAmout.toString();
  }

  //MoMo
  @override
  void dispose() {
    super.dispose();
    _momoPay.clear();
  }
  void _setState() {
    _paymentStatus = 'Đã chuyển thanh toán';
    if (_momoPaymentResult.isSuccess == true) {
      _paymentStatus += "\nTình trạng: Thành công.";
      _paymentStatus += "\nstatus: " + _momoPaymentResult.status.toString();
      _paymentStatus += "\nmessage: " + _momoPaymentResult.message.toString();
      _paymentStatus += "\nphone: " + _momoPaymentResult.phoneNumber.toString();
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra!;
      _paymentStatus += "\ntoken: " + _momoPaymentResult.token.toString();
    }
    else {
      _paymentStatus += "\nTình trạng: Thất bại.";
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra.toString();
      _paymentStatus += "\nMã lỗi: " + _momoPaymentResult.status.toString();
    }
  }
  void _handlePaymentSuccess(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(msg: "THÀNH CÔNG: " + response.phoneNumber.toString(), toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(msg: "THẤT BẠI: " + response.message.toString(), toastLength: Toast.LENGTH_SHORT);
  }

}
