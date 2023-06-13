import 'package:flutter/material.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({Key? key}) : super(key: key);

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  late TextEditingController _countryController;
  late TextEditingController _cityController;
  late TextEditingController _streetController;
  late TextEditingController _apartController;
  late TextEditingController _entController;
  late TextEditingController _floorController;
  late TextEditingController _interController;
  late TextEditingController _indexController;

  @override
  void initState() {
    super.initState();
    _countryController = TextEditingController();
    _cityController = TextEditingController();
    _streetController = TextEditingController();
    _apartController = TextEditingController();
    _entController = TextEditingController();
    _floorController = TextEditingController();
    _interController = TextEditingController();
    _indexController = TextEditingController();
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
        automaticallyImplyLeading: false,
        title: const Text(
          "Shipping Address",
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
          SizedBox(
            width: 335,
            child: TextField(
              controller: _countryController,
              onChanged: (text) => setState(() {

              }),
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Country*',
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
          SizedBox(
            width: 335,
            child: TextField(
              controller: _cityController,
              onChanged: (text) => setState(() {

              }),
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'City*',
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
          SizedBox(
            width: 335,
            child: TextField(
              controller: _streetController,
              onChanged: (text) => setState(() {

              }),
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Street*',
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
                  controller: _apartController,
                  onChanged: (text) => setState(() {

                  }),
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Apartment',
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
                  controller: _entController,
                  onChanged: (text) => setState(() {

                  }),
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Entrance',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                child: TextField(
                  controller: _floorController,
                  onChanged: (text) => setState(() {

                  }),
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Floor',
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
                  controller: _interController,
                  onChanged: (text) => setState(() {

                  }),
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Intercom №',
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
              controller: _indexController,
              onChanged: (text) => setState(() {

              }),
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Index',
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
