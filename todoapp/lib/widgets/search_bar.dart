import 'package:flutter/material.dart';

class SearchBarInput extends StatefulWidget {
  final TextEditingController textEditingController;

  final Function(String value) searchData;

  SearchBarInput({
    super.key,
    required this.textEditingController,
    required this.searchData,
  });

  @override
  State<SearchBarInput> createState() => _SearchBarInputState();
}

class _SearchBarInputState extends State<SearchBarInput> {
  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
