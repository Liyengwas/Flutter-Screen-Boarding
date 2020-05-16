import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutteronboarding/data/data.dart';

void main(){

  runApp(MyApp());

}

//stateless widget
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Screen Onboarding",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }

}

//stateful widget
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<SliderImageModel> slides = new List<SliderImageModel>();
  //variable that will check on the stauts of the Slider Image
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  //Widget in between SKIP and NEXT
  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.5),
      height: isCurrentPage ? 12.0 : 6.0,
      width: isCurrentPage ? 12.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.blue :Colors.grey,
            borderRadius: BorderRadius.circular(12)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
           //on page changed function
          onPageChanged: (val){
           setState(() {
             currentIndex = val;
           });
          },
           itemBuilder:(context, index){
          return SliderImage(
            imageAssetPath: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc(),
          );
           }),
      //BottomView Sheet goes here
      bottomSheet: currentIndex != slides.length-1 ? Container(
        height: Platform.isAndroid ? 70:60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                pageController.animateToPage(slides.length -1, duration: Duration(milliseconds: 500), curve: Curves.linear);
              },
                child: Text("SKIP")
            ),
            Row(
              children: <Widget>[
                //initialize for loop here
                for(int i = 0; i<slides.length; i++) currentIndex == i ? pageIndexIndicator(true) :pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
              onTap: (){
                pageController.animateToPage(currentIndex +1, duration: Duration(milliseconds: 500), curve: Curves.linear);
              },
                child: Text("NEXT")
            ),
          ],
        ),
      ) : Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: Platform.isAndroid ? 70:60,
        color: Colors.green,
        child: Text("GET STARTED NOW",style: TextStyle(
          color: Colors.greenAccent,
          fontWeight: FontWeight.w600
        ),)
        ),
    );
  }
}


//slider widget
class SliderImage extends StatelessWidget {

  String imageAssetPath, title, desc;
  SliderImage({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //align the items to the middle
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPath),
          SizedBox(height: 45,),
          Text(title),
          SizedBox(height: 15,),
          Text(desc)
        ],
      ),
    );
  }
}
