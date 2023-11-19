import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Color List'),
        ),
        body: ColorList(),
      ),
    );
  }
}

class ColorList extends StatefulWidget {
  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  final List<String> colorNames = ['Red', 'Green', 'Blue', 'Yellow', 'Purple', 'Orange', 'Pink'];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          // Swiped Right
          if (_pageController.page! > 0) {
            _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }
        } else if (details.primaryVelocity! < 0) {
          // Swiped Left
          if (_pageController.page! < colorNames.length - 1) {
            _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }
        }
      },
      child: Container(
        child: PageView.builder(
          controller: _pageController,
          itemCount: colorNames.length,
          itemBuilder: (context, index) {
            return Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  color: getColorByName(colorNames[index]),
                  child: Center(
                    child: Text(
                      colorNames[index],
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color getColorByName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'pink':
        return Colors.pink;
      default:
        return Colors.black;
    }
  }
}
