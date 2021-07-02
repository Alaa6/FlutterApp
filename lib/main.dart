// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './itemDetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutterooo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
          child: RondomWords(),
        ),
      ),
    );
  }
}

class RondomWords extends StatefulWidget {
  RondomWords({Key key}) : super(key: key);

  @override
  _RondomWordsState createState() => _RondomWordsState();
}

class _RondomWordsState extends State<RondomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _saved = <WordPair>{};
  String englishWord = "";

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _favoriteItems,
          )
        ],
      ),
      body: _buildSuggestions(), // ListView

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Adding item"),
                ),
                body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter item name',
                        ),
                        onChanged: (text) {
                          setState(() {
                            englishWord = '$text';
                          });
                        },
                      ),
                      Text(englishWord),
                    ])));
          }));
        },
      ),
    ));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          //itemBuilder

          if (i.isOdd) return Divider(); // divider (line)
          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs()
                .take(10)); // generateWordPairs in  english_words package
          }

          return _buildRow(_suggestions[index]); // ListTile
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        // title
        pair.asPascalCase,
        style: _biggerFont, // style
      ),
      trailing: Icon(
        //7aga hzwdha
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
      onLongPress: _goToDetails,
    );
  }

  void _favoriteItems() {
    

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final tiles = _saved.map(
        (WordPair pair) {
          final snackBar = SnackBar(
      content: Text('you delete the item (  $pair  ) !') ,
      action: SnackBarAction(
        label: 'Undo' ,
        onPressed: (){
          setState(() {
            _saved.add(pair);  
          });
        },
      ),
      );
          return ListTile(
              title: Text(pair.asPascalCase,
                  style: _biggerFont, textDirection: TextDirection.ltr),
              onLongPress: () => showDialog<String>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => AlertDialog(
                        title: Text("UnFavorite Item"),
                        content: Text(
                            "Do you sure to delete this Item from your favorites"),
                        actions: [
                          TextButton(
                              onPressed: () => {
                                    setState(() {
                                      _saved.remove(pair);
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      Navigator.of(context).pop();
                                    })
                                  },
                              child: Text("Yes")),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("No"))
                        ],
                        elevation: 24.0,
                        //  shape: CircleBorder(),
                      
                      )));
        },
      ); // arrayextButton

      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(context: context, tiles: tiles).toList()
          : <Widget>[];

      return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Suggestions'),
        ),
        body: ListView(
          // children: tiles.toList() ,
          children: divided,
        ),
      );
    }));
  }

  void _goToDetails() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ItemDetails();
      //  SizedBox(
      //   width: 250,
      //   height: 250,
      // child:
      //     Stack(
      //   alignment: AlignmentDirectional.topStart,
      //   fit: StackFit.expand,
      //   children: [
      //     Container(
      //       // width: 250,
      //       // height: 250,
      //       color: Colors.white,
      //       // margin: EdgeInsets.all(25.0),
      //       padding: EdgeInsets.all(40.0),
      //     ),
      //     // Text(englishWord) ,
      //     Positioned(
      //       top: 20,
      //       left: 0,
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         height: 50,
      //         child: Center(
      //           child: Text(
      //             'Custom Header',
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 20.0,
      //                 decoration: TextDecoration.none,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         // padding: EdgeInsets.all(10.0),
      //         // margin: EdgeInsets.all(20.0),
      //         decoration: BoxDecoration(
      //           color: Colors.pink,
      //         ),
      //       ),
      //     ),
      //     Container(
      //         // width: 250,
      //         // height: 250,
      //         padding: const EdgeInsets.all(5.0),
      //         alignment: Alignment.bottomCenter,
      //         decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //             begin: Alignment.topCenter,
      //             end: Alignment.bottomCenter,
      //             colors: <Color>[
      //               Colors.black.withAlpha(0),
      //               Colors.black12,
      //               Colors.black45
      //             ],
      //           ),
      //         ),
      //         child: Center(
      //             child: Text(
      //           'Foreground Text',
      //           style: TextStyle(
      //             color: Colors.black.withOpacity(0.5),
      //             fontSize: 20.0,
      //             decoration: TextDecoration.none,
      //           ),
      //         )))
      //   ],
      // );
      // );
    }));
  }

  Future<void> _showDialog() {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("UnFavorite Item"),
              content:
                  Text("Do you sure to delete this Item from your favorites"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Yes")),
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text("No"))
              ],
            ));
  }
}
