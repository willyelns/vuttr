import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String value) onSearch;
  final String hintText;

  const SearchBar({Key? key, required this.onSearch, required this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearch,
      decoration: InputDecoration(
        hintText: 'search',
        prefixIcon: Icon(Icons.search),
        // suffix: Row(
        //   children: [
        //     Text('search with tag'),
        //     Checkbox(
        //         value: false,
        //         onChanged: (value) {
        //           setState(() {});
        //         })
        //   ],
        // ),
      ),
    );
  }
}
