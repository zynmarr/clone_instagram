import 'package:clone_ig/screen/menu/history.dart';
import 'package:clone_ig/screen/menu/profile.dart';
import 'package:clone_ig/screen/menu/search.dart';
import 'package:clone_ig/screen/menu/upload.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          key: _scaffoldkey,
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.white,
          //   onPressed: () {},
          //   child: Image.asset('assets/img/home.png'),
          // ),
          bottomNavigationBar: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            labelColor: Colors.orangeAccent[700],
            // unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicatorPadding: EdgeInsets.all(15),
            tabs: <Widget>[
              Tab(
                child: Container(
                  margin: EdgeInsets.all(2),
                  height: 60,
                  child: Image.asset('assets/img/house.png'),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.all(2),
                  height: 60,
                  child: Image.asset('assets/img/search.png'),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.all(2),
                  height: 60,
                  child: Image.asset('assets/img/home.png'),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.all(2),
                  height: 60,
                  child: Image.asset('assets/img/love.png'),
                ),
              ), 
              Tab(
                child: Container(
                  margin: EdgeInsets.all(2),
                  height: 60,
                  child: Image.asset('assets/img/user.png'),
                ),
              ), 
            ],
          ),
         body: TabBarView(
          children: <Widget>[
            Menu(),
            Search(),
            Upload(),
            History(),
            Profile(),
          ],
        ),
        ),
      ),
    );
  }
}
