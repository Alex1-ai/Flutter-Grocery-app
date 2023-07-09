import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:glocery_app/services/utils.dart';
import 'package:glocery_app/widgets/feed_items.dart';
import 'package:glocery_app/widgets/text_widget.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = "/FeedsScreenState";
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
   final TextEditingController? _searchTextController = TextEditingController();
   final FocusNode _searchTextFocusNode = FocusNode();
   @override
  void dispose() {
    // TODO: implement dispose
    _searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar:AppBar(
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
      title: TextWidget(
        
        text: " All Products", 
        color: color, textSize: 20.0,
         isTitle: true,
         ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: kBottomNavigationBarHeight,
                  child: TextField(
                    focusNode:_searchTextFocusNode ,
                    controller:_searchTextController ,
                    onChanged: (value){
                      setState(() {
                        
                      });
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.greenAccent, width: 1)
                        ),
                       enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.greenAccent, width: 1)
                        ),
                        hintText: "Search for products...",
                        prefixIcon: Icon(Icons.search),
                        suffix: IconButton(onPressed: 
                        (){
                          _searchTextController!.clear();
                          _searchTextFocusNode.unfocus();
                              
                        },
                         icon: Icon(Icons.close, color:_searchTextFocusNode.hasFocus?  Colors.redAccent: color))
                        
                    
                    ),
                              
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                childAspectRatio: size.width / (size.height * 0.59),
                children: List.generate(10, (index) {
                  return FeedsWidget();
                }),
              ),
      
          ],
        ),
      ),

    );
  }
}