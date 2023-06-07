import 'package:binderbee/presentation/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../domain/models/book.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../bloc/cart/cart_state.dart';
import '../providers/navbar_provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return ProductPageView(book: book,);
  }
}

class ProductPageView extends StatefulWidget {
  const ProductPageView({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  String? _deliveryMethod = "In stock";
  void _addToCart(Book book) {
    context.read<CartBloc>().add(AddBookToCartEvent(book));
  }

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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            nb.selectedIndex = 0;
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.favorite_border_sharp,
              size: 27,
            )
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(productImageList: [widget.book.image],),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                widget.book.title,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15,),
            const Text(
              "Author",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.w300,
                fontSize: 15
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Color(0xFFE7B638),),
                Icon(Icons.star, color: Color(0xFFE7B638),),
                Icon(Icons.star, color: Color(0xFFE7B638),),
                Icon(Icons.star, color: Color(0xFFE7B638),),
                Icon(Icons.star_border),
              ],
            ),
            const SizedBox(height: 5,),
            const Text("2 Reviews", style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.w500, fontSize: 14),),
            const SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "2,400₸",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          fontSize: 24
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text(
                      "Availability",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Icon(Icons.check, size: 30,),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "In Stock Online",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Transform.scale(
                                scale: 1.2,
                                child: Radio<String>(
                                  fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF223263)),
                                  value: "In stock",
                                  groupValue: _deliveryMethod,
                                  onChanged: (String? value){
                                    setState(() {
                                      _deliveryMethod = value;
                                    });
                                  }
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 30,),
                        const SizedBox(width: 14,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Buy Online, Pick Up in Store",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Transform.scale(
                                scale: 1.2,
                                child: Radio<String>(
                                    fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF223263)),
                                    value: "Pick up",
                                    groupValue: _deliveryMethod,
                                    onChanged: (String? value){
                                      setState(() {
                                        _deliveryMethod = value;
                                      });
                                    }
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    const Text(
                      "Overview",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      "Oscar Wilde’s only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England...",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text(
                      "Product Details",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "ISBN-13:",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            Text(
                              "9784561235478",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Publisher:",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            Text(
                              "Sourcebooks",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Publication Date:",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            Text(
                              "01/04/2023",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Pages:",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            Text(
                              "448",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Sales rank:",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              "11,613",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Product dimensions:",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              "6.25(w)x9.25(h)x1.37(d)",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Language:",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              "English",
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                      ],
                    )
                  ],
                )
              ),
            ),
            const SizedBox(height: 70,),
            BlocListener<CartBloc, CartState>(
              listener: _stateListener,
              child: Container(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10,),
              child: SizedBox(
                width: 335,
                height: 47,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF223263),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: ()=> _addToCart(widget.book),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        primary: Colors.transparent),
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
    );
  }
  void _stateListener(BuildContext context, CartState state){
    switch(state.state){
      case CartStateType.failure: {
        Fluttertoast.showToast(msg: "Error");
      }
      break;
      case CartStateType.success: {
        Fluttertoast.showToast(msg: "Added to cart");
      }
      break;
    }
  }
}

