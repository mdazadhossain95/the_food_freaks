import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/tabs/home_tab.dart';
import 'package:the_food_freaks/src/tabs/popular_tab.dart';
import 'package:the_food_freaks/src/tabs/store_tab.dart';
import 'package:the_food_freaks/src/widgets/search_bar.dart';

class MainTab extends StatefulWidget {
  MainTab({Key? key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.only(left: 20.0),
      children: <Widget>[
        const SizedBox(height: 15.0),
        SearchBar(),
        const SizedBox(height: 15.0),
        TabBar(
            controller: _tabController,
            indicatorColor: kColor1,
            labelColor: kColor1,
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                child: Text('Home',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('Popular',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('Resturants',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 21.0,
                    )),
              ),
            ]),
        SizedBox(
          height: MediaQuery.of(context).size.height - 20.0,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _tabController,
            children: const [
              HomeTab(),
              PopularTab(),
              StoreScreen(),
              // ResturantDetails(),
            ],
          ),
        )
      ],
    );
  }
}
