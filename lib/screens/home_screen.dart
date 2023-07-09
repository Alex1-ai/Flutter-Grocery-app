import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:glocery_app/inner_screens/feeds_screen.dart';
import 'package:glocery_app/inner_screens/on_sale_screen.dart';
import 'package:glocery_app/provider/dark_theme_provider.dart';
import 'package:glocery_app/services/global_methods.dart';
import 'package:glocery_app/services/utils.dart';
import 'package:glocery_app/widgets/feed_items.dart';
import 'package:glocery_app/widgets/on_sale_widget.dart';
import 'package:glocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<String> _offerImages = [
    'assets/images/offres/Offer1.jpg',
    'assets/images/offres/Offer2.jpg',
    'assets/images/offres/Offer3.jpg',
    'assets/images/offres/Offer4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final utils = Utils(context);
    Color color = utils.color;
    Size size = utils.getScreenSize;
    // GlobalMethods globalMethods = GlobalMethods();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: TextWidget(
            text: "MUG",
            color: color,
            textSize: 24,
            isTitle: true,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: color,
            ),
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                IconlyLight.search,
                color: color,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
            IconButton(
              icon: Icon(
                IconlyLight.notification,
                color: color,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(_offerImages[index], fit: BoxFit.fill);
                },
                autoplay: true,
                itemCount: _offerImages.length,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red),
                ),
                // control: SwiperControl(),
              ),
            ),
            SizedBox(
              height: 6,
            ),

            TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, OnSaleScreen.routeName);
                GlobalMethods.navigateTo(
                  ctx: context, 
                  routeName: OnSaleScreen.routeName,);
              
              },
              child: TextWidget(
                text: "View all",
                maxLines: 1,
                color: Colors.blue,
                textSize: 20,
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.only(top: 5),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: TextWidget(
            //       text: "View all",
            //       color: Colors.white,
            //       textSize: 20,
            //     ),
            //   ),
            // ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "On Sale".toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Our Products",
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                        ctx: context,
                         routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                        text: "Browse all", color: Colors.blue, textSize: 20),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(4, (index) {
                return FeedsWidget();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
