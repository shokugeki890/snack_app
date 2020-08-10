
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snackapp/DetailPage.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Food List'),
      ),
      body: _PageList(),
    );
  }
}
final baseTextStyle = const TextStyle(color:  Colors.white, fontFamily: 'arial');
final bigHeaderTextStyle = baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);
final descTextStyle = baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);
final footerTextStyle = baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);


class _PageList extends StatefulWidget {
  @override
  __PageStateListState createState() => __PageStateListState();
}

class __PageStateListState extends State<_PageList> {

  List<String> theme = [
    'Ramen',
    'Curry Rice',
    'Okonomiyaki',
    'Miso Soup'
  ];
  List<String> subTheme=[
    'Ramen Is A Japanese Noodle Soup Dish',
    'A Curry With Rice Japanese Style',
    'A Tasty Egg With Veggies & Meat',
    'A Tasty Soup With Seafood & Veggies'
  ];
  List<String>images=[
    'assets/images/ramen.jpeg',
    'assets/images/curry_rice.jpg',
    'assets/images/okonomiyaki.jpg',
    'assets/images/miso_soup.jpg'
  ];
  List<String> num=[
    '50',
    '50',
    '50',
    '50'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: theme.length,
        itemBuilder: (BuildContext contex, int index ){
          final title = theme[index].toString();
          final subTitle = subTheme[index].toString();
          final numbers = num[index].toString();
          final image = images[index].toString();
          return Container(
            height: 200.0,
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  backgroundImage(image),
                  Container(
                    child: topContent(title, subTitle, numbers),
                  )
                ],
              ),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>DetailPage(
                        itemTheme: title,
                        itemSub:subTitle,
                        qty:numbers,
                        itemImage:image)
                ));
              }
            ),
          );
        }
      ),
    );
  }

  backgroundImage(String image) {
    return new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image:DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                    BlendMode.luminosity),
                image: AssetImage(image)
            )
        )
    );
  }

  topContent(String name, String detail, String stock) {
    return new Container(
      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            name, style: bigHeaderTextStyle,
          ),
          Text(
            detail,style: descTextStyle,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.redAccent,
          ),
          Text(
            stock, style: footerTextStyle,
          )
        ],
      ),
    );
  }



}






