import 'package:flutter/material.dart';

class BottomBarItems {
  BottomBarItems({this.iconData, this.text});
  IconData iconData;
  String text;
}

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<BottomBarItems> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    BottomBarItems item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* Example Use Custom */

/*
String lastSelected = '0';

  void selectedTab(int index) {
    setState(() {
      lastSelected = '$index';
    });
  }

  void selectedFab(int index) {
    setState(() {
      lastSelected = 'FAB: $index';
    });
  } */

// Widget build(BuildContext context) {
//   return SafeArea(
//     child: Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.white,
//         onPressed: () {},
//         child: Image.asset('assets/img/home.png'),
//       ),
//       bottomNavigationBar: CustomBottomAppBar(
//         onTabSelected: _selectedTab,
//         items: [
//           BottomBarItems(
//             iconData: Icons.home,
//             text: 'home',
//           ),
//           BottomBarItems(
//             iconData: Icons.search,
//             text: 'search',
//           ),
//           BottomBarItems(
//             iconData: Icons.favorite_border,
//             text: 'favorite',
//           ),
//           BottomBarItems(
//             iconData: Icons.account_circle,
//             text: 'account',
//           ),
//         ],
//       ),
//       body: _lastSelected == '0' ? Login() : _lastSelected == '1' ? Registrasi() : Text('home'),
//     ),
//   );
// }