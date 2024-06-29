import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<WeatherProvider>(context);
    final providerFalse = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: providerTrue.dataModel.location == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff83B1FB),
                    Color(0xff5B95F6),
                    Color(0xff5B95F6),
                  ])),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        toolbarHeight: 80,
                        centerTitle: true,
                        backgroundColor: Colors.transparent,
                        title: Text(
                          "Weather App",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        leading: IconButton(
                          icon: Icon(
                            Icons.widgets_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        actions: [
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              providerTrue.dataModel.location.toString(),
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              providerTrue.dataModel.localTime.toString(),
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 550,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 180,
                            ),
                            Text(
                              "5 day forecast",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                            Expanded(
                                child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 240,
                      child: Container(
                        height: 220,
                        width: 370,
                        decoration: BoxDecoration(
                            // color: Colors.yellow,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 10),
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff83B1FB),
                                  Color(0xff5B95F6),

                                  // Color(0xff5B95F6),
                                ]),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, bottom: 28),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    providerTrue.dataModel.condition.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      providerTrue.dataModel.temperatureCelsius
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                    Text(
                                      "0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ],
                                ),
                                Text(
                                  "${providerTrue.dataModel.temperatureFahrenheit} F",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  providerTrue.dataModel.lastUpdated.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: 190,
                      left: 50,
                      child: Image.asset(
                        "assets/images/cloudy.png",
                        height: 150,
                      )),
                ],
              ),
            ),
    );
  }
}
