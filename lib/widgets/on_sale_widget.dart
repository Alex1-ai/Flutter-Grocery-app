
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:glocery_app/services/utils.dart';
import 'package:glocery_app/widgets/heart_btn.dart';
import 'package:glocery_app/widgets/price_widget.dart';
import 'package:glocery_app/widgets/text_widget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FancyShimmerImage(
                    //   imageUrl:
                    //       "https://dictionary.cambridge.org/images/thumb/aprico_noun_002_01435.jpg",
                    //   height: size.width * 0.22,
                    //   width: size.width * 0.22,
                    //   boxFit: BoxFit.fill,
                    // ),
                    Image.network(
                      "https://media.istockphoto.com/id/1276593770/photo/apricots-apricot-isolate-apricots-with-slice-on-white-fresh-apricots-with-clipping-path-full.jpg?b=1&s=170667a&w=0&k=20&c=MwltAYBcSiD9j9TUar1zYVHVbphIsKQue-pg8UD32To=",
                      height: size.width * 0.22,
                      width: size.width * 0.22,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: "1KG",
                          color: color,
                          textSize: 22,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            HeartBTN(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                 PriceWidget(
                  textPrice: "1",
                      price:5.9,
                      salePrice: 2.99,
                      isOnSale: true,
                 ),
                const SizedBox(height: 5),
                TextWidget(
                  color: color,
                  text: "Product title",
                  textSize: 17,
                  isTitle: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
