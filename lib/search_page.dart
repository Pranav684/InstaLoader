import 'package:flutter/material.dart';
import 'package:insta_loader/result_page.dart';
import './load_data.dart';
import './user_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            // padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 202, 202, 202),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: ListTile(
              leading: SizedBox(
                width: 300,
                child: TextFormField(
                  controller: userName,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'search for the User Id here...',
                  ),
                ),
              ),
              trailing: Icon(Icons.search),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              getInstaData(userName.text, context);
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
