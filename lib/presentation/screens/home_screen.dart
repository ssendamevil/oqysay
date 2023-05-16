import 'package:binderbee/presentation/bloc/store/store_bloc.dart';
import 'package:binderbee/presentation/bloc/store/store_event.dart';
import 'package:binderbee/presentation/bloc/store/store_state.dart';
import 'package:binderbee/presentation/widgets/book_shelf.dart';
import 'package:binderbee/presentation/widgets/carousel_loading.dart';
import 'package:binderbee/presentation/widgets/carousel_slider.dart';
import 'package:binderbee/presentation/widgets/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late final StoreBloc _bloc;
  final List<String> images = [
    'https://dispatch.barnesandnoble.com/content/dam/ccr/homepage/daily/2023/05/02/26512_Quote_A1_Book_Club_05-02.jpg',
    "https://dispatch.barnesandnoble.com/content/dam/ccr/homepage/daily/2023/05/09/26513_Quote_A1_Atlanta_05-09.jpg",
    "https://dispatch.barnesandnoble.com/content/dam/ccr/homepage/daily/2023/05/09/26513_Quote_A3_Tom_Hanks_05-09.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppbar(),
      body: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          if(state.booksStatus == StoreRequest.inProgress){
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator()));
          }
          if(state.booksStatus == StoreRequest.failureRequest){
            return Column(
              children: [
                Text(state.failureMessage!),
                ElevatedButton(
                    onPressed: (){
                      _bloc.add(StoreGetAllBooksEvent());
                    },
                    child: const Text("Try again")
                )
              ],
            );
          }

          if(state.booksStatus == StoreRequest.unknown){
            return Column(
              children: [
                const Text("Unknown"),
                ElevatedButton(
                    onPressed: (){
                      _bloc.add(StoreGetAllBooksEvent());
                    },
                    child: Text("load all books")
                )
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                CarouselSliderLoaded(carouselList: images),
                BookShelf(books: state.books),
                BookShelf(books: state.books),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class HomeScreenView extends StatefulWidget {
//   const HomeScreenView({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreenView> createState() => _HomeScreenViewState();
// }
//
// class _HomeScreenViewState extends State<HomeScreenView> {
//   late StoreBloc _bloc;
//   final List<String> images = [
//     'https://dispatch.barnesandnoble.com/content/dam/ccr/homepage/daily/2023/05/02/26512_Quote_A1_Book_Club_05-02.jpg',
//     "https://dispatch.barnesandnoble.com/content/dam/ccr/homepage/daily/2023/05/09/26513_Quote_A1_Atlanta_05-09.jpg",
//     "https://dispatch.barnesandnoble.com/content/dam/ccr/homepage/daily/2023/05/09/26513_Quote_A3_Tom_Hanks_05-09.jpg"
//   ];
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _bloc = context.read<StoreBloc>()..add(StoreGetAllBooksEvent());
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const SearchAppbar(),
//       body: SingleChildScrollView(
//         child: BlocBuilder<StoreBloc, StoreState>(
//           builder: (context, state) {
//             if(state.booksStatus == StoreRequest.inProgress){
//               return const Center(
//                   child: CircularProgressIndicator()
//               );
//             }
//             if(state.booksStatus == StoreRequest.failureRequest){
//               return Column(
//                 children: [
//                   Text(state.failureMessage!),
//                   ElevatedButton(
//                       onPressed: (){
//                         _bloc.add(StoreGetAllBooksEvent());
//                       },
//                       child: const Text("Try again")
//                   )
//                 ],
//               );
//             }
//
//             if(state.booksStatus == StoreRequest.unknown){
//               return Column(
//                 children: [
//                   const Text("Unknown"),
//                   ElevatedButton(
//                       onPressed: (){
//                         _bloc.add(StoreGetAllBooksEvent());
//                       },
//                       child: Text("load all books")
//                   )
//                 ],
//               );
//             }
//             return Column(
//               children: [
//                 // CarouselSliderLoaded(carouselList: images),
//                 BookShelf(books: state.books),
//                 BookShelf(books: state.books),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

