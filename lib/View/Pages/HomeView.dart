import 'package:flutter/material.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/CardView.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  double? width;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    // final ch = Get.put(HomeController());
    return Scaffold(
      key: scaffoldKey,
      body: const CardView(),
    );
  }
}

PreferredSize _appBar(
    BuildContext ctx, GlobalKey<ScaffoldState> key, HomeController c) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: _boxDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            _topBar(ctx, c),
            const SizedBox(height: 5),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    key.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      c.changeWidget();
                    },
                    icon: c.actionsicon),
                Center(
                  child: c.title,
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    borderRadius: const BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
    gradient: LinearGradient(
      colors: [
        ColorUsed.appBarColor,
        const Color.fromARGB(255, 18, 8, 46),
      ],
      // begin: Alignment.topCenter,
      // end: Alignment.bottomCenter,
    ),
  );
}

Widget _topBar(BuildContext context, HomeController home) {
  return Expanded(
    flex: 1,
    child: home.title,
  );
}

Widget _searchBox() {
  return SizedBox(
    height: 35,
    child: TextFormField(
      textAlign: TextAlign.start,
      // controller: _searchText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: InkWell(
          child: const Icon(Icons.close),
          onTap: () {},
        ),
        hintText: 'Search...',
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
  );
}

Widget _tabBar() {
  return TabBar(
    labelPadding: const EdgeInsets.all(0),
    labelColor: Colors.black,
    indicatorColor: Colors.black,
    unselectedLabelColor: Colors.teal.shade800,
    tabs: const [
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.home),
        text: 'Home',
      ),
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.group),
        text: 'Group',
      ),
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.notifications),
        text: 'Notifications',
      ),
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.menu),
        text: 'Menu',
      ),
    ],
  );
}

Widget _tabBarViewItem(IconData icon, String name) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: 100,
      ),
      Text(
        name,
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    ],
  );
}
