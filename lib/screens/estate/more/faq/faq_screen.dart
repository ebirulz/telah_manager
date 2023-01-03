import 'package:flutter/material.dart';
import 'package:manager/util/colors.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {

  List<bool> _dataExpansionPanel = [false, true, false, false, false];

  late List<String> _content;

  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_left,
              size: 20,
            ),
          ),
          title: Text("FAQ",),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(bottom: 20),
            children: <Widget>[
              ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _dataExpansionPanel[index] = !isExpanded;
                  });
                },
                animationDuration: Duration(milliseconds: 500),
                children: <ExpansionPanel>[
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text("Where is my order",
                            style: TextStyle(
                                color: isExpanded
                                    ? AppColors.defaultBlue
                                    : AppColors.borderLine,
                                fontWeight: isExpanded ? FontWeight.w600: FontWeight.w500
                            ),
                          ),
                        );
                      },
                      body: Container(
                        padding:
                        EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                          Text("Content here sample"),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[4]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text("Where is my order",
                            style: TextStyle(
                                color: isExpanded
                                    ? AppColors.defaultBlue
                                    : AppColors.borderLine,
                                fontWeight: isExpanded ? FontWeight.w600: FontWeight.w500
                            ),
                          ),
                        );
                      },
                      body: Container(
                        padding:
                        EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                          Text("Content here sample"),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[4]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text("Where is my order 4",
                            style: TextStyle(
                                color: isExpanded
                                    ? AppColors.defaultBlue
                                    : AppColors.borderLine,
                                fontWeight: isExpanded ? FontWeight.w600: FontWeight.w500
                            ),
                          ),
                        );
                      },
                      body: Container(
                        padding:
                        EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                          Text("Content here sample 56"),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[4]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text("Where is my order 2",
                            style: TextStyle(
                                color: isExpanded
                                    ? AppColors.defaultBlue
                                    : AppColors.borderLine,
                                fontWeight: isExpanded ? FontWeight.w600: FontWeight.w500
                            ),
                          ),
                        );
                      },
                      body: Container(
                        padding:
                        EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                          Text("Content here "),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[3]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text("Where is my order 3",
                            style: TextStyle(
                                color: isExpanded
                                    ? AppColors.defaultBlue
                                    : AppColors.borderLine,
                                fontWeight: isExpanded ? FontWeight.w600: FontWeight.w500
                            ),
                              ),
                        );
                      },
                      body: Container(
                        padding:
                        EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                          Text("Content here sample"),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[4]),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text("Visit our site", style: TextStyle(color: AppColors.defaultBlue, fontWeight: FontWeight.w600),
                      ),
                ),
              )
            ],
          ),
        ));
  }
}
