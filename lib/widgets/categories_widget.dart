import 'package:flutter/material.dart';
import 'package:glocery_app/provider/dark_theme_provider.dart';
import 'package:glocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget(
      {Key? key,
      required this.passedColor,
      required this.catText,
      required this.imgPath})
      : super(key: key);
  final String catText, imgPath;
  final Color passedColor;
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        print("Category pressed");
      },
      child: Container(
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: passedColor.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill),
              ),
            ),
            TextWidget(
              text: catText,
              color: color,
              textSize: 20,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
