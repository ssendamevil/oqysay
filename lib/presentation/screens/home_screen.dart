import 'package:binderbee/presentation/bloc/store/store_bloc.dart';
import 'package:binderbee/presentation/bloc/store/store_event.dart';
import 'package:binderbee/presentation/bloc/store/store_state.dart';
import 'package:binderbee/presentation/widgets/book_shelf.dart';
import 'package:binderbee/presentation/widgets/carousel_loading.dart';
import 'package:binderbee/presentation/widgets/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreenView();
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late StoreBloc _bloc;

  @override
  void initState() {
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
                CarouselLoading(),
                SizedBox(height: 50,),
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

