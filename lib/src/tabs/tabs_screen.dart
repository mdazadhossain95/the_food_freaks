import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/tabs/tabone.dart';
import 'package:the_food_freaks/src/widgets/search_bar.dart';
import 'package:the_food_freaks/src/tabs/gridview.dart';
import 'package:the_food_freaks/src/tabs/storescreen.dart';
import 'package:the_food_freaks/src/tabs/resturantdetails.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
                child: Text('Stores',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('Resturant',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 21.0,
                    )),
              )
            ]),
        SizedBox(
          height: MediaQuery.of(context).size.height - 20.0,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _tabController,
            children: const [
              TabOne(),
              GridViewScreen(),
              StoreScreen(),
              ResturantDetails()
            ],
          ),
        )
      ],
    );
  }
}
