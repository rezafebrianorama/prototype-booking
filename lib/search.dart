import 'package:apps_booking/globals.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.listSearch}) : super(key: key);

  final dynamic listSearch;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _search = TextEditingController();
  late FocusNode searchFocus;
  List lastSeen = [];
  List populer = [];

  @override
  void initState() {
    lastSeen = widget.listSearch['last_seen'];
    populer = widget.listSearch['populer'];
    searchFocus = FocusNode();
    searchFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: primaryColor,
            padding:
                const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: TextField(
              focusNode: searchFocus,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'search',
                  hintStyle: const TextStyle(
                      color: Colors.black45, letterSpacing: 1.2),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.white, width: 0.8),
                  ),
                  suffixIcon: IconButton(
                      color: _search.text.isNotEmpty
                          ? Colors.black45
                          : Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        setState(() {
                          _search.clear();
                        });
                      },
                      icon: const Icon(
                        Icons.cancel,
                      )),
                  prefixIcon: IconButton(
                      color: Colors.black45,
                      iconSize: 30,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      ))),
              controller: _search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Terakhir dilihat (${lastSeen.length})',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                for (int i = 0; i < lastSeen.length; i++)
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(lastSeen[i]['nama']),
                    ),
                  )
              ],
            ),
          ),
          const Divider(thickness: 1),
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 15),
            child: Text(
              'Populer saat ini',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          for (int x = 0; x < populer.length; x++)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      populer[x]['image'],
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        populer[x]['nama'].toString().toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        populer[x]['keterangan'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
