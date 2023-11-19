import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watso_v2/common/constants/styles.dart';

import '../../common/widgets/Boxes.dart';
import '../../common/widgets/Layout.dart';

class TaxiMainPage extends StatefulWidget {
  const TaxiMainPage({super.key});

  @override
  State<TaxiMainPage> createState() => _TaxiMainPageState();
}

class _TaxiMainPageState extends State<TaxiMainPage> {
  DateTime _selectedDate = DateTime.now();

  _beforeDate() {
    setState(() {
      _selectedDate = _selectedDate.subtract(Duration(days: 1));
    });
  }

  _afterDate() {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OutlineBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: _beforeDate,
                    ),
                    Text(
                      "${_selectedDate.year}년 ${_selectedDate.month}월 ${_selectedDate.day}일",
                      style: WatsoFont.title,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: _afterDate,
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                  height: 0.5,
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: WatsoColor.primary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            "터미널-캠퍼스",
                            style: WatsoFont.subtitle,
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        width: 0.5,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "캠퍼스-터미널",
                            style: WatsoFont.subtitle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: OutlineBox(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.local_taxi_sharp),
                      Text(
                        "탑승 가능한 택시",
                        style: WatsoFont.title,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("빠른 시간 순"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.black),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            context.go('/post/$index');
                          },
                          child: Container(
                            color: Colors.grey[200],
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "출발 시간",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("PM 11:00"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "출발지",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("터미널"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "도착지",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("캠퍼스"),
                                  ],
                                ),
                                Text(
                                  "1/4 명",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text("모집중"),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.black,
                          height: 0.5,
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      child: Center(
                          child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          print("택시 추가");
                        },
                      ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
