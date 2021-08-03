import 'package:flutter/material.dart';
import '../pages/people_page.dart';
import '../pages/favorite_page.dart';

  void selectedItem(BuildContext context, int index) {
      Navigator.of(context).pop();
      switch (index) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PeoplePage()
          ));
          break;
        case 1:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FavoritePage()
          ));
          break;
      }
    }
