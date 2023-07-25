import 'package:alc_book/src/categories/widgets/search_bar_preview.dart';
import 'package:alc_book/src/constants/colors.dart';
import 'package:alc_book/src/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:page_transition/page_transition.dart';

import '../../book_pdf/book_pdf.dart';
import '../../constants/books.dart';

class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final ScrollController _searchBarScollController = ScrollController();
  List searchedBooks = [];

  void runSearchbarFilter(String searchText) {
    List searchResult = [];

    if (searchText.isEmpty) {
      searchResult = [];
    } else {
      searchResult = BookList.allBooks
          .where((song) =>
              song.searchWord.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    setState(() {
      searchedBooks = searchResult;
    });
  }

  double getSearchbarheight() {
    return searchedBooks.length * 180;
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final screenHeight = MediaQuery.of(context).size.height;

    return FloatingSearchBar(
      hint: 'Search books',
      // scrollPadding: EdgeInsets.all(0),
      transitionDuration: const Duration(milliseconds: 300),
      transitionCurve: Curves.easeInOut,
      height: 55,
      borderRadius: BorderRadius.circular(12),
      margins: const EdgeInsets.only(top: 50, left: 30, right: 30),
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : 0.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 700,
      debounceDelay: const Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      automaticallyImplyDrawerHamburger: false,
      // automaticallyImplyBackButton: false,
      actions: const [],

      leadingActions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      onQueryChanged: (value) {
        runSearchbarFilter(value);
      },
      builder: (BuildContext context, Animation<double> transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            height: getSearchbarheight() > screenHeight * 0.75
                ? screenHeight * 0.75
                : getSearchbarheight(),
            color: AppColors.white,
            duration: const Duration(milliseconds: 200),
            child: Scrollbar(
              interactive: true,
              thickness: 5,
              radius: const Radius.circular(7),
              controller: _searchBarScollController,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _searchBarScollController,
                      itemCount: searchedBooks.length,
                      itemBuilder: (context, i) {
                        return SearchBarPreview(book: searchedBooks[i]);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
