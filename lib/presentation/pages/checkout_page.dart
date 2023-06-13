import 'package:binderbee/presentation/pages/address_page.dart';
import 'package:binderbee/presentation/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../providers/navbar_provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _deliveryMethod = "Kazpost";
  @override
  Widget build(BuildContext context) {
    final nb = Provider.of<NavbarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
              color: Color(0xFFCECDCD),
              width: 1
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "Checkout",
          style: TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(_createAddressRoute());
                },
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.zero
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Address",
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery Method",
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30,),
                OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    padding: const EdgeInsets.only(top: 12, right: 5,left: 20, bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    side: const BorderSide(width: 1, color: Color(0xFF223263)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                          'assets/svgs/kazpost-kaz.svg',
                        width: 130,
                      ),
                      Text("3-12 days",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF524E4E)
                        ),
                      ),
                      Row(
                        children: [
                          Text("490",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF524E4E)
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Radio<String>(
                                fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF223263)),
                                value: "Kazpost",
                                groupValue: _deliveryMethod,
                                onChanged: (String? value){
                                  setState(() {
                                    _deliveryMethod = value;
                                  });
                                }
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),
                const SizedBox(height: 10,),
                OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.only(top: 12, right: 5,left: 20, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      side: BorderSide(width: 1, color: Color(0xFF223263)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Express delivery",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF223263)
                          ),
                        ),
                        Text("1-7 days",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF524E4E)
                          ),
                        ),
                        Row(
                          children: [
                            Text("1390",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF524E4E)
                              ),
                            ),
                            Transform.scale(
                              scale: 1.2,
                              child: Radio<String>(
                                  fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF223263)),
                                  value: "Express delivery",
                                  groupValue: _deliveryMethod,
                                  onChanged: (String? value){
                                    setState(() {
                                      _deliveryMethod = value;
                                    });
                                  }
                              ),
                            )
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Method",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10,),
                OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      padding: const EdgeInsets.only(top: 12, right: 5,left: 20, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      side: const BorderSide(width: 1, color: Color(0xFF223263)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Credit card",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/visa.svg',
                                  width: 50,
                                ),
                                const SizedBox(width: 5,),
                                SvgPicture.asset(
                                  'assets/svgs/Mastercard_2019_logo.svg',
                                  width: 40,
                                ),
                                const SizedBox(width: 5,),
                                SvgPicture.asset(
                                  'assets/svgs/kaspi-bank.svg',
                                  width: 60,
                                ),
                              ],
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(_createPaymentRoute());
                          },
                          child:
                          const Text(
                            "Add Card",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        )
                      ],
                    )
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height*0.35,
        child: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: Color(0xFFB8B8B8)),)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal(items)",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 19,
                            color: Color(0xFF3F3E3E)
                        ),
                      ),
                      Text(
                        '7.990T',
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 19,
                            color: Color(0xFF3F3E3E)
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated Shipping",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 19,
                            color: Color(0xFF3F3E3E)
                        ),
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 19,
                            color: Color(0xFF3F3E3E)
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                  child: Container(
                    height: 20,
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFB8B8B8)))
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Total",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 19,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        "7,900T",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 19,
                            fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 40,),
                Container(
                  width: MediaQuery.of(context).size.width*0.85,
                  height: 47  ,
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    child: Text(
                      "Pay 7.990",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF223263),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createPaymentRoute(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const PaymentPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

Route _createAddressRoute(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AddressPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}