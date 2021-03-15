import 'dart:math';

import 'package:flutter/material.dart';
import 'package:job/pages/webview.dart';

class DetailUrl {
  final String url;
  const DetailUrl({
    this.url,
  });
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var list = [
    'https://gravatar.com/avatar/4a4ed596f9b2f91b92954b84193bdca6?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/94415cd065f6a14f9bf9eb3c23a9a7ac?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/bf8e8df43c0cb13db3eff6f46d95b385?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/8c0e7ab47ef19c79e95c6b26c7c84672?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/7b36188f3f5796591ee560e94f42a4c7?s=400&d=robohash&r=x'
  ];

  // generates a new Random object
  final _random = new Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: Container(
                      color: Colors.grey,
                      child: Image.network(
                        "${list[_random.nextInt(list.length)]}",
                        height: MediaQuery.of(context).size.width * 0.65,
                        width: MediaQuery.of(context).size.width * 0.65,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Card(
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                        ],
                      ),
                      title: Text('Nama'),
                      subtitle: Text('Ahmad Yahya Asy-syidqie'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Card(
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mail),
                        ],
                      ),
                      title: Text('Email'),
                      subtitle: Text('ahmadyahyay@gmail.com'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new Detail(
                            value: DetailUrl(
                              url: 'http://github.com/yaqie',
                            ),
                          ),
                        );
                        Navigator.of(context).push(route);
                      },
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.link),
                        ],
                      ),
                      title: Text('Github Link'),
                      subtitle: Text('http://github.com/yaqie'),
                      trailing: Icon(Icons.arrow_right_alt),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new Detail(
                            value: DetailUrl(
                              url: 'https://www.linkedin.com/in/yaqie/',
                            ),
                          ),
                        );
                        Navigator.of(context).push(route);
                      },
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.link),
                        ],
                      ),
                      title: Text('Linkedin Link'),
                      subtitle: Text('https://www.linkedin.com/in/yaqie/'),
                      trailing: Icon(Icons.arrow_right_alt),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
