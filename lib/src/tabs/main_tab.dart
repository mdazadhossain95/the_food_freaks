import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/connectivity_provider.dart';
import 'package:the_food_freaks/src/no_internet.dart';
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
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return pageUI();
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (context, model, child) {
        // ignore: unnecessary_null_comparison
        if (model.isOnline != null) {
          return model.isOnline
              ? ListView(
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
                      child: Text('Restaurants',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 21.0,
                          )),
                    ),
                    // Tab(
                    //   child: Text('Foods',
                    //       style: TextStyle(
                    //         fontFamily: 'Oswald',
                    //         fontSize: 21.0,
                    //       )),
                    // ),
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
                    // FoodsTab(),
                  ],
                ),
              )
            ],
          )
              : const NoInternet();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
