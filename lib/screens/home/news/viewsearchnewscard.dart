import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdart/model/dependentmodel.dart';
import 'package:vdart/model/newsmodel.dart';
import 'package:vdart/screens/home/news/newscardsearch.dart';
import 'package:vdart/screens/home/news/newscontent.dart';

class ViewNewsSearchBar extends StatefulWidget {
  @override
  _ViewNewsSearchBar createState() => _ViewNewsSearchBar();
}

class _ViewNewsSearchBar extends State<ViewNewsSearchBar> {
  TextEditingController searchController = TextEditingController();
  List<NewsModel> newslist = [];
  bool isSearchEmpty = true;
  double ht, wt;
  @override
  void initState() {
    getNewsfromDB();
  }

  getNewsfromDB() async {
    print("Entered News");
    var fetchedData = await getDataFromDB();
    setState(() {
      newslist = fetchedData;
      print(newslist);
      newslist.forEach((element) {
        print(element.newstitle);
      });
    });
  }

  Future<List<NewsModel>> getDataFromDB() async {
    List<NewsModel> d = [];
    var maps = [
      {
        'newstitle': 'Annual Leave Policy',
        'newslike': 0,
        'newsdate': DateTime.now()
      },
      {
        'newstitle': 'Use of Company Ploicy',
        'newslike': 0,
        'newsdate': DateTime.now()
      },
      {
        'newstitle': 'Promotion Announcement',
        'newslike': 0,
        'newsdate': DateTime.now()
      },
      {
        'newstitle': 'Annual Leave Policy',
        'newslike': 0,
        'newsdate': DateTime.now()
      },
      {
        'newstitle': 'Annual Leave Policy',
        'newslike': 0,
        'newsdate': DateTime.now()
      }
    ];
    if (maps.length > 0) {
      maps.forEach((map) {
        d.add(NewsModel.fromMap(map));
      });
    }
    return d;
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Grove",
        color: Colors.white,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Container(
                    height: wt / 4,
                    child: Card(
                        color: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 20, left: 3, right: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                child: Image.asset('assets/images/arrowl.png',
                                    height: 20, width: 20),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 8),
                                  padding: EdgeInsets.only(left: 16),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade50,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.search,
                                          size: 30,
                                          color: Colors.blueGrey[800]),
                                      Expanded(
                                        child: TextField(
                                          controller: searchController,
                                          maxLines: 1,
                                          onChanged: (value) {
                                            handleSearch(value);
                                          },
                                          autofocus: false,
                                          cursorColor: Colors.blueGrey[400],
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              fontSize: wt / 26,
                                              fontWeight: FontWeight.w400),
                                          textInputAction:
                                              TextInputAction.search,
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'Search news',
                                            hintStyle: TextStyle(
                                                color: Colors.blueGrey[400],
                                                fontSize: wt / 24,
                                                fontWeight: FontWeight.w400),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                            !isSearchEmpty ? Icons.close : null,
                                            size: 26,
                                            color: Colors.blueGrey[400]),
                                        onPressed: cancelSearch,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  )),
            ),
            body: Padding(
                padding: EdgeInsets.all(9.0),
                child: ListView(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "01 Sep 2020",
                        style: TextStyle(
                            fontSize: wt / 20, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  ..._buildDependentList(),
                ]))));
  }

  List<Widget> _buildDependentList() {
    List<Widget> dataComponentsList = [];
    newslist.sort((a, b) {
      return b.newsdate.compareTo(a.newsdate);
    });
    if (searchController.text.isNotEmpty) {
      newslist.forEach((data) {
        if (data.newstitle
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
          dataComponentsList.add(NewsCardComponent(
            data: data,
            onTapAction: openCardToRead,
          ));
      });
      return dataComponentsList;
    } else {
      newslist.forEach((data) {
        dataComponentsList.add(NewsCardComponent(
          data: data,
          onTapAction: openCardToRead,
        ));
      });
    }
    return dataComponentsList;
  }

  openCardToRead(NewsModel data) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewsContent(data: data)));
    /* setState(() {
      headerShouldHide = true;
    });*/
    /*  await Future.delayed(Duration(milliseconds: 230), () {});
    Navigator.push(
        context,
        FadeRoute(
            page: ViewNotePage(
                triggerRefetch: refetchNotesFromDB, currentNote: noteData)));
    await Future.delayed(Duration(milliseconds: 300), () {});*/

    /* setState(() {
      headerShouldHide = false;
    });*/
  }

  void handleSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        isSearchEmpty = false;
      });
    } else {
      setState(() {
        isSearchEmpty = true;
      });
    }
  }

  void cancelSearch() {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      searchController.clear();
      isSearchEmpty = true;
    });
  }
}
