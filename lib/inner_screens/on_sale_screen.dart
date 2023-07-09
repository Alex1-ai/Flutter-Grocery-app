import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:glocery_app/services/utils.dart';
import 'package:glocery_app/widgets/on_sale_widget.dart';
import 'package:glocery_app/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    bool _isEmpty=false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
           onTap: (){
            Navigator.pop(context);
           }, 

           child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
           ),
      ),
      centerTitle: true,
      title: TextWidget(text: "Products on sale", color: color, textSize: 24.0, isTitle: true,),
      ),
      body: _isEmpty? Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(

                padding: const EdgeInsets.all(18.0),
                child: Image.asset("assets/images/box.png"),
              ),
              Text("No products on sale yet!\nStay tunned",style: TextStyle(
                color: color, fontSize: 30, fontWeight: FontWeight.w700,
              ),),
            ],
          ),
        ),
      ): GridView.count(           
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(16, (index) {
                return OnSaleWidget();
              }),
            ),
    );
  }
}