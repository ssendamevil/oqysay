import 'package:flutter/material.dart';

class ListBookItem extends StatefulWidget {
  const ListBookItem({Key? key, required this.index}) : super(key: key);
  final int index;
  
  @override
  State<ListBookItem> createState() => _ListBookItemState();
}

class _ListBookItemState extends State<ListBookItem> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      width: 150,
      height: 300,
      child: Center(child: Text('${widget.index}'),),
    );
  }
}

