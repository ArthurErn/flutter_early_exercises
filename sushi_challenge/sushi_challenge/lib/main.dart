import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'images.dart';

final random = Random();
void main() {
  runApp(MaterialApp(
    home: SushiChallenge(),
    title: 'Sushi Challenge',
    debugShowCheckedModeBanner: false,
  ));
}

enum SushiSize { S, M, L }

extension on SushiSize {
  String getName() {
    switch (this) {
      case SushiSize.M:
        return 'M';
      case SushiSize.S:
        return 'P';
      case SushiSize.L:
        return 'G';
    }
    throw UnimplementedError('Invalid Sushi size');
  }
}

class SushiListItem {
  final double price;
  final List<String> ingredients;
  final int startsCount;
  final String name;
  final String image;
  final SushiSize size;

  SushiListItem({
    @required this.price,
    @required this.ingredients,
    @required this.startsCount,
    @required this.name,
    @required this.image,
    @required this.size,
  });
}

class SushiChallenge extends StatefulWidget {
  @override
  _SushiChallengeState createState() => _SushiChallengeState();
}

class _SushiChallengeState extends State<SushiChallenge> {
  final List<SushiListItem> items = [];

  PageController _controller;
  double scrollOffSet = 0.0;

  SushiListItem _selectedItem;

  void populateItems() {
    if (items.isNotEmpty) {
      return;
    }
    for (int i = 0; i < ImageUtils.sushiAssets.length; i++) {
      items.add(SushiListItem(
        name: ImageUtils.sushiAssets.keys.elementAt(i),
        image: ImageUtils.sushiAssets.values.elementAt(i),
        startsCount: random.nextInt(5),
        price: 56 * random.nextDouble(),
        size:
            SushiSize.values.elementAt(random.nextInt(SushiSize.values.length)),
        ingredients: ImageUtils.sushiIngreditentsAssets,
      ));
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = PageController(initialPage: 0, viewportFraction: .645);
    _controller.addListener(() {
      setState(() => scrollOffSet = _controller.page);
      print(scrollOffSet);
    });

    populateItems();
    _selectedItem = items.first;
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = Colors.indigo[800];
    final backgroundColor = Colors.black;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Center(
            child: Container(
                height: size.height * .85,
                width: size.width * .8,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(220),
                  gradient: LinearGradient(
                      stops: [.3, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [backgroundColor, cardColor.withOpacity(.2)]),
                )),
          ),
          PageView.builder(
              itemCount: items.length,
              onPageChanged: (index) {
                setState(() {
                  _selectedItem = items[index];
                });
              },
              controller: _controller,
              itemBuilder: (context, index) {
                double alignment = math
                    .exp(-math.pow(scrollOffSet - index, -4) / items.length);
                bool fromLeft = scrollOffSet.round() > index;

                final item = items.elementAt(index);

                return Align(
                    alignment: Alignment(0, alignment),
                    child: Transform.rotate(
                        angle:
                            fromLeft ? -(alignment * .99) : (alignment * .99),
                        child: Container(
                          width: 130,
                          height: 130,
                          //margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(item.image),
                          )),
                        )));
              }),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: size.height * .7),
              child: SushiListItemInfoWidget(
                item: _selectedItem,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SushiListItemInfoWidget extends StatelessWidget {
  final SushiListItem item;

  const SushiListItemInfoWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          item.name,
          style: TextStyle(fontSize: 26, color: Colors.grey, fontWeight: FontWeight.bold)),

        Padding(
          padding: EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(Icons.star, color: Colors.white);
            }
            )),
        )
      ],
    );
  }
}
