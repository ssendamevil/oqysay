import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/store/store_bloc.dart';
import '../bloc/store/store_event.dart';
import '../bloc/store/store_state.dart';
import '../widgets/book_shelf.dart';
import '../widgets/search_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late StoreBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = context.read<StoreBloc>()..add(StoreGetAllBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppbar(),
      body: SingleChildScrollView(
        child: BlocBuilder<StoreBloc, StoreState>(
          builder: (context, state) {
            if(state.booksStatus == StoreRequest.inProgress){
              return const CircularProgressIndicator();
            }
            if(state.booksStatus == StoreRequest.failureRequest){
              return Column(
                children: [
                  Text(state.failureMessage!),
                  ElevatedButton(
                      onPressed: (){
                        _bloc.add(StoreGetAllBooksEvent());
                      },
                      child: Text("Try again")
                  )
                ],
              );
            }

            if(state.booksStatus == StoreRequest.unknown){
              return Column(
                children: [
                  Text("Unknown"),
                  ElevatedButton(
                      onPressed: (){
                        _bloc.add(StoreGetAllBooksEvent());
                      },
                      child: Text("load all books")
                  )
                ],
              );
            }
            return Column(
              children: [
                BookShelf(books: state.books),
                BookShelf(books: state.books),
              ],
            );
          },
        ),
      ),
    );
  }
}

