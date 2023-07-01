import 'package:flutter/material.dart';

class ScreenNetflixSearch extends StatefulWidget {
  const ScreenNetflixSearch({Key? key}) : super(key: key);

  @override
  State<ScreenNetflixSearch> createState() => _ScreenNetflixSearchState();
}

class _ScreenNetflixSearchState extends State<ScreenNetflixSearch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Screen_netflix_search_sub();
  }
}

class Screen_netflix_search_sub extends StatefulWidget {
  const Screen_netflix_search_sub({Key? key}) : super(key: key);

  @override
  State<Screen_netflix_search_sub> createState() => _Screen_netflix_search_subState();
}

class _Screen_netflix_search_subState extends State<Screen_netflix_search_sub> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
