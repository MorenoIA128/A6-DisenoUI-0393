import 'package:flutter/material.dart';
import 'package:moreno0393/data/product_data.dart';
import 'package:moreno0393/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          height: height * 0.95,
          width: width * 0.95,
          color: Color(0xff010027),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        onPageChanged: (page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 400,
                                width: 400,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(products[index].img),
                                  ),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AuthScreen()));
                                    },
                                    child: Text(
                                      "Skip",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              Text(
                                products[index].title,
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                products[index].description,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ],
                          );
                        })),
                SizedBox(
                  height: 10,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 10,
                          width: currentPage == index ? 25 : 10,
                          color: currentPage == index
                              ? Color(0xff5effed)
                              : Colors.white,
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    currentPage == 2
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuthScreen()));
                            },
                            child: Icon(Icons.arrow_forward_ios))
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
