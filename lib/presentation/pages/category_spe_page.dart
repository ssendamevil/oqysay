import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../domain/models/book.dart';
import '../language_selection/app_localization.dart';
import '../providers/navbar_provider.dart';

class CategorySpePage extends StatefulWidget {
  const CategorySpePage({Key? key, required this.categoryName, required this.books}) : super(key: key);
  final String categoryName;
  final List<Book> books;
  @override
  State<CategorySpePage> createState() => _CategorySpePageState();
}

class _CategorySpePageState extends State<CategorySpePage> {
  final List<String> types = ["Paper back", "Hardcover", "AudioBook", "eBook"];
  RangeValues _currentRangeValues = const RangeValues(0, 100000);

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
            nb.selectedIndex = 6;
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          widget.categoryName,
          style: const TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){},
                                child: const Text(
                                    'Reset',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    color: Color(0xFFFF0101)
                                  ),
                                )
                            ),
                            const Text("Filter",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close, size: 30,)
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Type",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              const SizedBox(height: 20,),
                              SizedBox(
                                height: 40,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, int index) {
                                      return OutlinedButton(
                                        onPressed: (){},
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(width: 1, color: Color(0xFF223263)),
                                        ),
                                        child: Text(
                                          types[index],
                                          style: const TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 18,
                                              color: Color(0xFF223263),
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10,),
                                    itemCount: 4
                                ),
                              ),
                              const SizedBox(height: 30,),
                              const Text("Price Range",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              const SizedBox(height: 20,),
                              RangeSlider(
                                values: _currentRangeValues,
                                max: 100000,
                                divisions: 100000,
                                labels: RangeLabels(
                                  _currentRangeValues.start.round().toString(),
                                  _currentRangeValues.end.round().toString(),
                                ),
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _currentRangeValues = values;
                                  });
                                },
                              ),
                              const SizedBox(height: 50,),

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
              );
            },
            icon: const Icon(FontAwesomeIcons.filter))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15,
          childAspectRatio: (3 / 6),
          children: List.generate(
            widget.books.length,
            (index){
              return Column(
                children: [
                  SizedBox(
                    width: 135,
                    height: 210,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(widget.books[index].image, fit: BoxFit.cover,)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: 135,
                    child: Column(
                      children: [
                        Text( widget.books[index].title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Author",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              fontSize: 14
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "2700₸",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                  )

                ],
              );
            }
          ),
        ),
      ),

    );
  }
}
