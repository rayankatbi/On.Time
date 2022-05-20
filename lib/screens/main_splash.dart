import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/screens/main_page.dart';
import 'package:todoapp/widgets/custom_text.dart';

class MainSplash extends StatelessWidget {
  const MainSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1F1338),
              Color(0xff3A3372),
              // Style.mov,
              Color(0xff3C1F7B),
              Color(0xff241641),
            ]),
      ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                title: 'On.Time',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                size: 45,
              ),
              CustomText(
                title: 'Make yourself\n more on time',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                size: 35,
              ),
              SizedBox(
                width: width * 0.9,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      //maximumSize: Size(50.0,100.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: Style.white,
                      onPrimary: Style.darkMov),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  },
                  child: CustomText(
                    title: 'Start',
                    size: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
