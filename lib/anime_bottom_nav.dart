import 'package:flutter/material.dart';
import 'package:otaku_nakama/anime_home.dart';
import 'package:otaku_nakama/anime_schedule.dart';
import 'package:otaku_nakama/http_helper.dart';

class AnimeNavBar extends StatefulWidget {
  const AnimeNavBar({super.key});

  @override
  State<AnimeNavBar> createState() => _AnimeNavBarState();
}

class _AnimeNavBarState extends State<AnimeNavBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  late HttpHelper helper;
  @override
  void initState() {
    helper = HttpHelper();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Otaku Nakama"),
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.calendar_month),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          AnimeHome(),
          AnimeSchedule(),
        ],
      ),
    );
  }
}
