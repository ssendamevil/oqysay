import 'package:binderbee/presentation/language_selection/app_localization.dart';
import 'package:flutter/material.dart';

import '../language_selection/app_localization.dart';


class SearchAppbar extends StatelessWidget with PreferredSizeWidget {
  const SearchAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_sharp)),
        const SizedBox(width: 15,)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
