import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent, // White background for the AppBar
        elevation: 0, // Remove the shadow of the AppBar
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.arrow_back,
            ), // Back icon
            onPressed: () {
              Navigator.of(context).pop(); // Action for the back icon
            },
          ),
        ),
        leadingWidth: 40,
        title: Container(
          height: 40, // Height of the TextField
          decoration: BoxDecoration(
            color:
                Colors.grey.shade200, // Light grey background for the TextField
            borderRadius: BorderRadius.circular(50), // Curved corners
          ),
          child: TextField(
            style: Theme.of(context).textTheme.displaySmall,
            autofocus: true,
            onSubmitted: (value) {
              Provider.of<WeatherProvider>(context, listen: false)
                  .loadData(value);
              Provider.of<WeatherProvider>(context, listen: false).setImage();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              hintText: 'Search cities',
              hintStyle:
                  Theme.of(context).textTheme.displaySmall, // Hint text color
              border: InputBorder.none, // Remove the border
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ), // Search icon
            ),
          ),
        ),
      ),
    );
  }
}
