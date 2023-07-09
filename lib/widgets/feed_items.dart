import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glocery_app/services/utils.dart';
import 'package:glocery_app/widgets/heart_btn.dart';
import 'package:glocery_app/widgets/price_widget.dart';
import 'package:glocery_app/widgets/text_widget.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();
   @override
    void initState(){
      _quantityTextController.text ="1";
      super.initState();

    }
    
    @override
    void dispose(){
      _quantityTextController.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
   

    final Color color = Utils(context).color;

    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                FancyShimmerImage(
                  imageUrl:
                      "https://media.istockphoto.com/id/1276593770/photo/apricots-apricot-isolate-apricots-with-slice-on-white-fresh-apricots-with-clipping-path-full.jpg?b=1&s=170667a&w=0&k=20&c=MwltAYBcSiD9j9TUar1zYVHVbphIsKQue-pg8UD32To=",
                  height: size.width * 0.21,
                  width: size.width * 0.2,
                  boxFit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: "Title", 
                      color: color,
                       textSize: 20,
                       isTitle: true,),
                       HeartBTN(),

                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: PriceWidget(
                        textPrice: _quantityTextController.text,
                        price:5.9,
                        salePrice: 2.99,
                        isOnSale: true,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: FittedBox(
                              child: TextWidget(
                                text: "KG", 
                                color: color, 
                                textSize: 18,
                                 isTitle:true
                                ),
                                ),
                          ),

                              const SizedBox(width: 5,),
                              Flexible(
                                child: TextFormField(
                                controller: _quantityTextController,
                                key: const ValueKey("10"),
                                style: TextStyle(
                                  color: color,
                                  fontSize: 18,
                                 


                                ),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                enabled: true,
                                onChanged:(value){
                                  setState(() {
                                    
                                  });
                                } ,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                                ],
                              ),),
                        ],
                      ),
                    )


                  ],
                ),),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed:(){},
                  child: TextWidget(text: "Add to cart", color: color, textSize: 15),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                       Theme.of(context).cardColor, 
                    ),tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),),
                          )
                    ),
                  ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
