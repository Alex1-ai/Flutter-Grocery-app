import 'package:flutter/material.dart';
import 'package:glocery_app/consts/theme_data.dart';
import 'package:glocery_app/inner_screens/feeds_screen.dart';
import 'package:glocery_app/inner_screens/on_sale_screen.dart';
import 'package:glocery_app/provider/dark_theme_provider.dart';
import 'package:glocery_app/screens/btm_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: ButtomBarScreen(),

          routes: {
            OnSaleScreen.routeName: (ctx)=>const OnSaleScreen(),
            FeedsScreen.routeName: (ctx)=>const FeedsScreen(),
          },
        );
      }),
    );
  }
}
