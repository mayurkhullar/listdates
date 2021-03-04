import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DatesList(),
    );
  }
}

class DatesList extends StatefulWidget {
  @override
  _DatesListState createState() => _DatesListState();
}

class _DatesListState extends State<DatesList> {
  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.utc(2021, 03, 01);
    DateTime endDate = DateTime.utc(2021, 02, 01);

    getDaysInBetween() {
      final int difference = startDate.difference(endDate).inDays;
      print(difference);
      return difference;
    }

    final items = List<DateTime>.generate(getDaysInBetween(), (i) {
      DateTime date = startDate;

      return date.add(Duration(days: i));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Dates List'),
        leading: IconButton(
          icon: Icon(Icons.double_arrow_outlined),
          onPressed: () {
            getDaysInBetween();
          },
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text('Day ${items[index].day}'),
                    trailing: Text(
                        '${items[index].day}/${items[index].month}/${items[index].year}'),
                  ),
                )
              ],
            );
          }),
    );
  }
}
