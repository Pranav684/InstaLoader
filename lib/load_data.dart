import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insta_loader/result_page.dart';

import './user_data.dart';

import 'package:flutter_insta/flutter_insta.dart';
import 'package:http/http.dart' as http;

getInstaData(String userName, context) async {
  // FlutterInsta flutterInsta = FlutterInsta();
  // await flutterInsta.getProfileData(userName); //instagram username
  String url = 'https://www.instagram.com/';
  print('going to trigger the api');
  var res = await http.get(Uri.parse(Uri.encodeFull(url +
      userName +
      "/?__a=1&__d=dis"))); // adding /?__a=1&__d=dis at the end will return json data
  print('status------');
  print(res.statusCode);
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var graphql = data['graphql'];
    var user = graphql['user'];
    var biography = user['biography'];
    bio = biography;
    var myfollowers = user['edge_followed_by'];
    var myfollowing = user['edge_follow'];
    followers = myfollowers['count'].toString();
    following = myfollowing['count'].toString();
    website = user['external_url'];
    profile_img_url = user['profile_pic_url_hd'];
    feedImagesUrl = user['edge_owner_to_timeline_media']['edges']
        .map<String>((image) => image['node']['display_url'] as String)
        .toList();
    username = userName;
    var user_posts = user['edge_owner_to_timeline_media'];
    posts = user_posts['count'];

    print(bio);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const ResultPage()),
    );
  } else {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color.fromARGB(255, 129, 197, 253),
      content: Text('Something wrong please try again'),
    ));
  }
}
