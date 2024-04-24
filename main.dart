import 'package:dice/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "detail": (context) => DetailPage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff10002b),
        title: Text(
          "MARVEL UNIVERSE",
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              letterSpacing: 7,
              fontWeight: FontWeight.w300),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xff240046),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "AVENGERS",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: person.map((e) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: 450,
                        // width: 150,
                        child: Align(
                          child: Container(
                            margin: EdgeInsets.only(left: 30, top: 10),
                            height: 300,
                            width: 230,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff591798),
                                  Color(0xff3c096c),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 30,
                                  spreadRadius: 3,
                                  offset: Offset(5, 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50, top: 20),
                        height: 220,
                        width: 180,
                        child: Image.asset(e["image"]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50, top: 270),
                        height: 120,
                        width: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e["name"],
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              e["fn"],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white38,
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "detail",
                                    arguments: e);
                              },
                              child: Text("Know more"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map detail = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff10002b),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Marvel Character"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 400,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 10, spreadRadius: 5),
                ],
              ),
              child: Image.asset(detail["image"]),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              height: 400,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 10,
                  )
                ],
              ),
              child: Align(
                child: Text(
                  detail["name"],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 5),
              margin: EdgeInsets.all(10),
              height: 400,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Text(detail["d"]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
