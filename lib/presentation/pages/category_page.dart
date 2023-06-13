import 'package:binderbee/presentation/bloc/store/store_bloc.dart';
import 'package:binderbee/presentation/bloc/store/store_event.dart';
import 'package:binderbee/presentation/widgets/book_shelf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/book.dart';
import '../bloc/store/store_state.dart';
import '../language_selection/app_localization.dart';
import '../widgets/category_shelf.dart';
import '../widgets/search_appbar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return CategoryPageView(categoryName: categoryName,);
  }
}

class CategoryPageView extends StatefulWidget {
  const CategoryPageView({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;

  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  late StoreBloc _storeBloc;
  @override
  void initState() {
    super.initState();
    _storeBloc = context.read<StoreBloc>()..add(StoreGetAllBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: SizedBox(
                height: 45,
                child: TextField(
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                  decoration: InputDecoration(
                      hintText: '${AppLocalization.of(context).getTranslatedValues("search_for_a_book")}',
                      suffixIcon: const Icon(Icons.search),
                      hintStyle: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF787676),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xFF969696)
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      fillColor: const Color(0xFFEEEEEE)),
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt_sharp)),
                const SizedBox(width: 15,)
              ],
            ),
            body: Container(
              child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    Text(
                      widget.categoryName,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 40,),
                    CategoryShelf(books: state.books, categoryName: widget.categoryName,)
                  ],
              ),
            ),
          );
        }
    );
  }
}

