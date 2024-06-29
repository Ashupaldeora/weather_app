import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_provider.dart';
import 'package:weather_app/theme/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<WeatherProvider>(context);
    final providerFalse = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary
            ])),
        child: providerTrue.dataModel.location == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Stack(
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
                            Icons.light_mode,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme();
                          },
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
                              "${providerTrue.dataModel.region}, ${providerTrue.dataModel.country}",
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
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 180,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "5 day forecast",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount: providerTrue
                                .dataModel.forecast!.forecastDay.length,
                            itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(
                                  bottom: 15, left: 15, right: 15),
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12.withOpacity(0.07),
                                        blurRadius: 50,
                                        spreadRadius: -5)
                                  ],
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        providerTrue.dataModel.forecast!
                                            .forecastDay[index].formattedDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      Text(
                                        providerTrue.dataModel.forecast!
                                            .forecastDay[index].dayOfWeek,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        providerTrue.dataModel.forecast!
                                            .forecastDay[index].day.minTempC
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      Text("0 /"),
                                      Text(
                                        providerTrue.dataModel.forecast!
                                            .forecastDay[index].day.maxTempC
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text("0"),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/cloudy.png",
                                        height: 30,
                                      ),
                                      SizedBox(
                                        width: 70,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.visible,
                                          providerTrue
                                              .dataModel
                                              .forecast!
                                              .forecastDay[index]
                                              .day
                                              .conditionText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                        ],
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
                                  SizedBox(
                                    width: 170,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.visible,
                                      providerTrue.dataModel.condition
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
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
