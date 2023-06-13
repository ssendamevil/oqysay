import 'package:binderbee/presentation/bloc/cart/cart_bloc.dart';
import 'package:binderbee/presentation/bloc/cart/cart_state.dart';
import 'package:binderbee/presentation/pages/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../language_selection/app_localization.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shape: const Border(
              bottom: BorderSide(
                  color: Color(0xFFCECDCD),
                  width: 1
              ),
            ),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppLocalization.of(context).getTranslatedValues("cart")}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600
                  ),
                ),
                (state.cartItems.isEmpty) ?
                Text(
                  '${AppLocalization.of(context).getTranslatedValues("no_items")}',
                  style: const TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ) :
                Row(
                  children: [
                    Text(
                      "${state.cartItems.length} items",
                      style: const TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3F3E3E)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Text(
                      "7,990₸",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: state.cartItems.isEmpty ?
              Center(child: Text('${AppLocalization.of(context).getTranslatedValues("there_is_no_products")}'))
              : ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, int index) {
                    return CartItem(book: state.cartItems[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10,);
                  },
                  itemCount: state.cartItems.length
              )
          ),
          bottomNavigationBar: BottomAppBar(
            height: MediaQuery.of(context).size.height*0.3,
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
                                fontSize: 18,
                                color: Color(0xFF3F3E3E)
                            ),
                          ),
                          Text(
                            '7.990T',
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 18,
                                color: Color(0xFF3F3E3E)
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estimated Shipping",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 18,
                              color: Color(0xFF3F3E3E)
                            ),
                          ),
                          Text(
                            "Free",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 18,
                                color: Color(0xFF3F3E3E)
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estimated Tax",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 18,
                                color: Color(0xFF3F3E3E)
                            ),
                          ),
                          Text(
                            "0,00T",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 17,
                                color: Color(0xFF3F3E3E)
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                      child: Container(
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
                                fontSize: 17,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            "7,900T",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 17,
                                fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Color(0xFFB8B8B8)))
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.85,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(_createRoute());
                        },
                        child: Text(
                          "CHECKOUT",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
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
      },
    );
  }
}

Route _createRoute(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const CheckoutPage(),
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
