import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glocery_app/services/utils.dart';
import 'package:glocery_app/widgets/heart_btn.dart';
import 'package:glocery_app/widgets/text_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
   final _quantityTextController = TextEditingController();
   @override
  void initState() {
    // TODO: implement initState
    _quantityTextController.text = '1';
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _quantityTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   

    
    final utils = Utils(context);
    Color color = utils.color;
    Size size = utils.getScreenSize;
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  // color: Theme.of(context).backgroundColor.withOpacity(0.3),
                  color: Theme.of(context).cardColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        
                      ),
            
            
                      child: FancyShimmerImage(
                          imageUrl:
                              "https://media.istockphoto.com/id/1276593770/photo/apricots-apricot-isolate-apricots-with-slice-on-white-fresh-apricots-with-clipping-path-full.jpg?b=1&s=170667a&w=0&k=20&c=MwltAYBcSiD9j9TUar1zYVHVbphIsKQue-pg8UD32To=",
                          
                          boxFit: BoxFit.fill,
                        ),
                    ),
            
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Title",
                           color: color, 
                           textSize: 20, 
                           isTitle: true,
                           ),
                          SizedBox(height:16.0),
                          SizedBox(
                            width: size.width *0.3,
                            child: Row(
                              children: [
                                _quantityController(
                                  fct: (){}, 
                                  icon:CupertinoIcons.minus,
                                   color: Colors.red),
                                Flexible(
                                  flex: 1,
                                  child: TextField(
                                    controller: _quantityTextController,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide()
                                      ),
                                    
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')
                                      ),
                                    ],
                                    onChanged: (v){
                                      setState(() {
                                        if(v.isEmpty){
                                          _quantityTextController.text='1';
                                        }else{
                                          return;
                                        }
                                      });
                                    },
                                  ),
                                ),
                               _quantityController(
                                  fct: (){}, 
                                  icon:CupertinoIcons.add,
                                   color: Colors.green),
                              ],
                            ),
                          ),
            
                      ],
                    ),
                    const Spacer(),
            
                    Padding( 
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
            
                            },
                            child: Icon(CupertinoIcons.cart_badge_minus, color: Colors.red, size:25,),
                            
                          ),
                          SizedBox(height: 5,),
                          HeartBTN(),
                          TextWidget(text: "\$0.29", color: color, textSize: 18, maxLines: 1,)
                          
                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quantityController( {
    required Function fct,
     required IconData icon,
      required Color color
      }){
    return Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Material(
                                    color: color,
                                    borderRadius: BorderRadius.circular(12),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: (){
                                        fct();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Icon(
                                          icon,
                                           color: Colors.white,
                                           size: 20,),
                                      ),
                                    ),
                                                              
                                  ),
                                ),
                              );
  }
}