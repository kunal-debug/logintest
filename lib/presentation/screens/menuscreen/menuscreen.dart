import 'package:flutter/material.dart';
import 'package:logintest/provider/menuItem/menuitem_provider.dart';
import 'package:logintest/utilities/common_methods.dart';
import 'package:provider/provider.dart';

import '../../../data/model/menuitem/menuitem_model.dart';
import '../../components/appbar/common_appbar.dart';

class MenuScreen extends StatefulWidget {
  final id;
  MenuScreen(this.id);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MenuitemProvider>(context, listen: false)
        .getMenuList(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MenuItemList',
        onBackButtonPressed: () {
          back2Previous(context);
        },
        showBackButton: true,
      ),
      body: Consumer<MenuitemProvider>(
        builder: (context, menuProvider, child) {
          return menuProvider.menuItems.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: ListView(
                    children: _buildMenuItems(menuProvider),
                  ),
                );
        },
      ),
    );
  }

// Combined method to build both parent and standalone menu items
  List<Widget> _buildMenuItems(MenuitemProvider menuProvider) {
    final List<Widget> menuWidgets = [];

    // Find top-level menu items and add them to the list
    for (var item in menuProvider.menuItems) {
      if (item.parentMenuId == null) {
        // Check if the current item has children
        final children = menuProvider.menuItems
            .where((child) => child.parentMenuId == item.menuId.toString())
            .toList();

        if (children.isNotEmpty) {
          // If there are children, create an ExpansionTile
          menuWidgets.add(_buildExpandableMenuItem(item, children));
        } else {
          // If there are no children, just add as a ListTile
          menuWidgets.add(ListTile(
            title: Text(item.menuName),
          ));
        }
      }
    }

    // Find and add standalone items (optional)
    for (var item in menuProvider.menuItems) {
      if (item.parentMenuId != null &&
          !menuProvider.menuItems
              .any((parent) => parent.menuId.toString() == item.parentMenuId)) {
        menuWidgets.add(ListTile(
          title: Text(item.menuName),
        ));
      }
    }

    return menuWidgets;
  }

  // Create an expandable tile for each menu item
  Widget _buildExpandableMenuItem(MenuItem item, List<MenuItem> children) {
    return ExpansionTile(
      title: Text(item.menuName),
      children: [
        ...children.map((child) => ListTile(
              title: Text(child.menuName),
            )),
      ],
    );
  }
}
