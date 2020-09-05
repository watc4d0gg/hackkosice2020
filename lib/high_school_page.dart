import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackkosice2020/highschools.dart';

class HighSchoolPage extends StatefulWidget {
  final HighSchool school;

  HighSchoolPage({Key key, this.school}) : super(key: key);

  @override
  HighSchoolPageState createState() => HighSchoolPageState();
}

class HighSchoolPageState extends State<HighSchoolPage> with TickerProviderStateMixin {
  TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    this._tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    this._tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              child: Image.asset("TODO"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                widget.school.name,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                  ),
                  Text(
                    widget.school.contact[0],
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 2.5, bottom: 10.0),
                      child: Icon(
                        Icons.people,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.5, top: 10.0, right: 10.0, bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.school.students.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "študentov",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 2.5),
                      child: IntrinsicHeight(
                        child: IntrinsicWidth(
                          child: Stack(
                            children: [
                              CircularProgressIndicator(
                                value: widget.school.succesrate / 100,
                                backgroundColor: Colors.grey,
                              ),
                              Center(
                                child: Text(
                                  "${widget.school.succesrate}%",
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 2.5, right: 10.0, bottom: 10.0),
                      child: Text(
                        "Miera prijatia",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            TabBar(
              onTap: (index) => this.setState(() => this._tabIndex = index),
              controller: this._tabController,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.assignment,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.school,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.tag_faces,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ]..add([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Informácie",
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                    child: Text(
                      widget.school.info,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Prijímacie skúšky",
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Štruktúra štúdia",
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Študentský život",
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ][this._tabIndex]),
        ),
      ),
    );
  }
}
