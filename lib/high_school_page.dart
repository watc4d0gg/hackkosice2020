import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackkosice2020/highschools.dart';
import 'package:url_launcher/url_launcher.dart';

class HighSchoolPage extends StatefulWidget {
  final HighSchool school;

  HighSchoolPage({Key key, this.school}) : super(key: key);

  @override
  HighSchoolPageState createState() => HighSchoolPageState();
}

class HighSchoolPageState extends State<HighSchoolPage>
    with TickerProviderStateMixin {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /*NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                // These are the slivers that show up in the "outer" scroll view.
                return <Widget>[
                  SliverOverlapAbsorber(
                    // This widget takes the overlapping behavior of the SliverAppBar,
                    // and redirects it to the SliverOverlapInjector below. If it is
                    // missing, then it is possible for the nested "inner" scroll view
                    // below to end up under the SliverAppBar even when the inner
                    // scroll view thinks it has not been scrolled.
                    // This is not necessary if the "headerSliverBuilder" only builds
                    // widgets that do not overlap the next sliver.
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverAppBar(
                      title: const Text('Books'), // This is the title in the app bar.
                      pinned: true,
                      expandedHeight: 150.0,
                      // The "forceElevated" property causes the SliverAppBar to show
                      // a shadow. The "innerBoxIsScrolled" parameter is true when the
                      // inner scroll view is scrolled beyond its "zero" point, i.e.
                      // when it appears to be scrolled below the SliverAppBar.
                      // Without this, there are cases where the shadow would appear
                      // or not appear inappropriately, because the SliverAppBar is
                      // not actually aware of the precise position of the inner
                      // scroll views.
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        // These are the widgets to put in each tab in the tab bar.
                        tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                // These are the contents of the tab views, below the tabs.
                children: _tabs.map((String name) {
                  return SafeArea(
                    top: false,
                    bottom: false,
                    child: Builder(
                      // This Builder is needed to provide a BuildContext that is
                      // "inside" the NestedScrollView, so that
                      // sliverOverlapAbsorberHandleFor() can find the
                      // NestedScrollView.
                      builder: (BuildContext context) {
                        return CustomScrollView(
                          // The "controller" and "primary" members should be left
                          // unset, so that the NestedScrollView can control this
                          // inner scroll view.
                          // If the "controller" property is set, then this scroll
                          // view will not be associated with the NestedScrollView.
                          // The PageStorageKey should be unique to this ScrollView;
                          // it allows the list to remember its scroll position when
                          // the tab view is not on the screen.
                          key: PageStorageKey<String>(name),
                          slivers: <Widget>[
                            SliverOverlapInjector(
                              // This is the flip side of the SliverOverlapAbsorber
                              // above.
                              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.all(8.0),
                              // In this example, the inner scroll view has
                              // fixed-height list items, hence the use of
                              // SliverFixedExtentList. However, one could use any
                              // sliver widget here, e.g. SliverList or SliverGrid.
                              sliver: SliverFixedExtentList(
                                // The items in this example are fixed to 48 pixels
                                // high. This matches the Material Design spec for
                                // ListTile widgets.
                                itemExtent: 48.0,
                                delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                    // This builder is called for each child.
                                    // In this example, we just number each list item.
                                    return ListTile(
                                      title: Text('Item $index'),
                                    );
                                  },
                                  // The childCount of the SliverChildBuilderDelegate
                                  // specifies how many children this inner list
                                  // has. In this example, each tab has a list of
                                  // exactly 30 items, but this is arbitrary.
                                  childCount: 30,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),*/
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: FractionalOffset.bottomCenter,
                image: NetworkImage(widget.school.picture),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.school.name,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    widget.school.contact[0],
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 10.0, right: 2.5, bottom: 10.0),
                child: Icon(
                  Icons.people,
                  size: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 2.5, top: 10.0, right: 20.0, bottom: 10.0),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TabBar(
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
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: Text(widget.school.info),
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
                Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0),
                    child: Column(children: [
                      Text("Vyskúšajte si cvičné testy"),
                      InkWell(
                        child: new Text("Test MAT"),
                        onTap: () => launch(widget.school.practiceTests[0]),
                      )
                    ])),
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
    );
  }
}
