import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late TextEditingController _numberCardController;
  late TextEditingController _mmyyController;
  late TextEditingController _cvvController;
  late TextEditingController _cardholderController;

  @override
  void initState() {
    super.initState();
    _numberCardController = TextEditingController();
    _mmyyController = TextEditingController();
    _cvvController = TextEditingController();
    _cardholderController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
          "Payment Method",
          style: TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/visa.svg',
                width: 80,
              ),
              const SizedBox(width: 20,),
              SvgPicture.asset(
                'assets/svgs/Mastercard_2019_logo.svg',
                width: 70,
              ),
              const SizedBox(width: 20,),
              SvgPicture.asset(
                'assets/svgs/kaspi-bank.svg',
                width: 90,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: 335,
            child: TextField(
              controller: _numberCardController,
              onChanged: (text) => setState(() {

              }),
              obscureText: false,
              decoration: InputDecoration(
                  focusColor: Color(0xFF223263),
                  suffixIcon: Icon(Icons.credit_card),
                  suffixIconColor: Color(0xFF223263),
                  hintText: '0000 0000 0000 0000',
                  hintStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8B8B8B),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF807F7F),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF223263),
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFECE9E9),
                  contentPadding: const EdgeInsets.only(left: 25.0, right: 5.0, top: 15.0, bottom: 15.0)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                child: TextField(
                  controller: _mmyyController,
                  onChanged: (text) => setState(() {

                  }),
                  obscureText: false,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      suffixIconColor: Color(0xFF223263),
                      hintText: 'mm/yy',
                      hintStyle: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8B8B8B),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF807F7F),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF223263),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFECE9E9),
                      contentPadding: const EdgeInsets.only(left: 25.0, right: 5.0, top: 15.0, bottom: 15.0)
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              SizedBox(
                width: 160,
                child: TextField(
                  controller: _cvvController,
                  onChanged: (text) => setState(() {

                  }),
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'CVV/CVC',
                      hintStyle: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8B8B8B),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF807F7F),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF223263),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFECE9E9),
                      contentPadding: const EdgeInsets.only(left: 25.0, right: 5.0, top: 15.0, bottom: 15.0)
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 335,
            child: TextField(
              controller: _cardholderController,
              onChanged: (text) => setState(() {

              }),
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Cardholder name',
                  hintStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8B8B8B),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF807F7F),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF223263),
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFECE9E9),
                  contentPadding: const EdgeInsets.only(left: 25.0, right: 5.0, top: 15.0, bottom: 15.0)
              ),
            ),
          ),
          const SizedBox(height: 50,),
          Container(
            width: MediaQuery.of(context).size.width*0.81,
            height: 47,
            child: ElevatedButton(
              onPressed: (){

              },
              child: Text(
                "Save",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC38821),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
