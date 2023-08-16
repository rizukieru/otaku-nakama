import 'package:flutter/material.dart';

import 'anime_detail.dart';
import 'http_helper.dart';

class AnimeSchedule extends StatefulWidget {
  const AnimeSchedule({super.key});

  @override
  _AnimeScheduleState createState() => _AnimeScheduleState();
}

class _AnimeScheduleState extends State<AnimeSchedule>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  int _selectedIndex = 0;
  late HttpHelper helper;
  String urlDay = "&filter=sunday";
  int? animeCount;
  List? animeSchedule;

  @override
  void initState() {
    super.initState();
    helper = HttpHelper();
    animeCount = 0;
    animeSchedule = [];
    initialize(urlDay);
    _nestedTabController = TabController(length: 7, vsync: this);
    _nestedTabController.addListener(() {
      setState(() {
        _selectedIndex = _nestedTabController.index;
      });
      print("Selected index: $_selectedIndex");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  Future initialize(String getUrlDay) async {
    helper.getSchedules(getUrlDay).then((response) {
      setState(() {
        animeCount = response.length;
        animeSchedule = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double cardHeight = screenHeight / 2.15;
    double cardWidth = screenWidth / 2;
    var singleChildScrollView = SingleChildScrollView(
      child: SizedBox(
        height: 500,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: cardWidth / cardHeight),
            itemCount: animeCount,
            itemBuilder: (BuildContext context, int position) {
              return GestureDetector(
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => AnimeDetail(
                              anime: animeSchedule![position],
                            ));
                    Navigator.push(context, route);
                  },
                  child: SizedBox(
                    height: 280,
                    width: 170,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      margin: const EdgeInsets.all(4.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image(
                            image: ResizeImage(
                                NetworkImage(animeSchedule![position]
                                    .images
                                    .jpg
                                    .imageUrl),
                                width: 150,
                                height: 225),
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              '${animeSchedule![position].title}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          onTap: (index) {
            setState(() {
              switch (index) {
                case 0:
                  urlDay = '&filter=sunday';
                  break;
                case 1:
                  urlDay = '&filter=monday';
                  break;
                case 2:
                  urlDay = '&filter=tuesday';
                  break;
                case 3:
                  urlDay = '&filter=wednesday';
                  break;
                case 4:
                  urlDay = '&filter=thursday';
                  break;
                case 5:
                  urlDay = '&filter=friday';
                  break;
                case 6:
                  urlDay = '&filter=saturday';
                  break;
                default:
                  urlDay = '&filter=unknown';
              }
              initialize(urlDay);
            });
          },
          isScrollable: true,
          tabs: const <Widget>[
            Tab(
              text: "Sun",
            ),
            Tab(
              text: "Mon",
            ),
            Tab(
              text: "Tue",
            ),
            Tab(
              text: "Wed",
            ),
            Tab(
              text: "Thu",
            ),
            Tab(
              text: "Fri",
            ),
            Tab(
              text: "Sat",
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.75,
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              singleChildScrollView,
              singleChildScrollView,
              singleChildScrollView,
              singleChildScrollView,
              singleChildScrollView,
              singleChildScrollView,
              singleChildScrollView,
            ],
          ),
        )
      ],
    );
  }
}
