import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import './../widgets/CustomDrawer.dart';
import './../components/PotentialShiftCard.dart';

class PrintableFormsPage extends StatefulWidget {
  // PrintableFormsPage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _PrintableFormsPageState createState() => new _PrintableFormsPageState();
}

class _PrintableFormsPageState extends State<PrintableFormsPage> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = ["Invoke Blank Form", "PSR", "RTC", "PNF"];
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(text) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            text,
            style: TextStyle(
                color: const Color(0xffb2D3F9E), fontWeight: FontWeight.bold),
          ),
          onTap: () {
            print("details");
          },
        );

    return Scaffold(
        appBar: new GradientAppBar(
            title: new Text("Printable Forms"),
            backgroundColorStart: const Color(0xffb3098CF),
            backgroundColorEnd: const Color(0xffb2D3E9D)),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xffb3098CF),
                    ),
                    prefixStyle: TextStyle(color: const Color(0xffb6e81ef)),
                    labelStyle: TextStyle(color: const Color(0xffb6e81ef)),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                      borderSide: const BorderSide(
                          color: const Color(0xffb6e81ef), width: 1.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    print(items[index]);
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            left: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xffb6e81ef),
                              const Color(0xffb81c4e8),
                            ],
                          )),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: makeListTile(items[index]),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                child: Column(children: <Widget>[
                              Icon(
                                Icons.search,
                                color: const Color(0xffb3098CF),
                              ),
                            ])),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        drawer: new CustomDrawer());
  }
}
