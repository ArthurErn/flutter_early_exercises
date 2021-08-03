import 'package:drawer/builder/head_drawer.dart';
import 'package:flutter/material.dart';
import 'selected_item.dart';
import 'search_field.dart';

class DrawerNav extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.deepPurple[400],
        child: ListView(padding: padding, children: <Widget>[
          HeadDrawer(), //aqui vai o header
          const SizedBox(height: 20),
          BuildSearchField(),
          const SizedBox(
            height: 20,
          ),
          buildItem(text: 'Pessoas', icon: Icons.people, onClicked: () => selectedItem(context, 0)),
          const SizedBox(height: 12),
          buildItem(text: 'Favoritos', icon: Icons.favorite_outline_sharp, onClicked: () => selectedItem(context, 1)),
          const SizedBox(height: 12),
          buildItem(text: 'Updates', icon: Icons.update, onClicked: () => selectedItem(context, 2)),
          const SizedBox(height: 20),
          Divider(color: Colors.white60),
          const SizedBox(height: 20),
          buildItem(text: 'Plugins', icon: Icons.account_tree_outlined, onClicked: () => selectedItem(context, 3)),
          const SizedBox(height: 12),
          buildItem(text: 'Notificações', icon: Icons.notifications_active_outlined, onClicked: () => selectedItem(context, 4)),
        ]),
      ),
    );
  }

  Widget buildItem({String text, IconData icon, VoidCallback onClicked}) {
    final color = Colors.white;
    final hoverColor = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
