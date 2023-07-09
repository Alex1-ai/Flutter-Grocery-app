import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:glocery_app/services/utils.dart';
import 'package:glocery_app/widgets/categories_widget.dart';

import '../widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  List<Color> gridColor = [
    const Color(0xff53B175),
    const Color(0xfff8A44C),
    const Color(0xfff7A593),
    const Color(0xffD3B0E0),
    const Color(0xfffDE598),
    const Color(0xffB7DFF5)
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;

    var random = Random();
    int min = 0;
    int max = catInfo.length - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextWidget(
          text: "Categories",
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10, // vertical spacing
          mainAxisSpacing: 10, // horizontal spacing
          children: List.generate(
            catInfo.length,
            (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
                passedColor: gridColor[min + random.nextInt(max - min + 1)],
              );
            },
          ),
        ),
      ),
    );
  }
}
