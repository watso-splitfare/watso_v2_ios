import 'package:flutter/material.dart';

import '../../common/widgets/Boxes.dart';

class TaxiMainPage extends StatefulWidget {
  const TaxiMainPage({super.key});


  @override
  State<TaxiMainPage> createState() => _TaxiMainPageState();
}

class _TaxiMainPageState extends State<TaxiMainPage> {
  int _selectedIndex = 0;
  DateTime _selectedDate = DateTime.now();

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    return Scaffold(
        backgroundColor: Color(0xFFF7F7FA),
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Color(0xFFF7F7FA),
          elevation: 0,
          foregroundColor: Colors.black,

          title: Text("택시왔소",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("검색");
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print("더보기");
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                          "${_selectedDate.year}년 ${_selectedDate
                              .month}월 ${_selectedDate.day}일",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
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
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                "터미널-캠퍼스",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          Text("탑승 가능한 택시", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          ElevatedButton(onPressed: () {},
                            child: Text("빠른 시간 순"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              foregroundColor: Colors.black,
                              side: BorderSide(color: Colors.black),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),

                              ),
                            ),),
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.grey[200],
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("출발 시간", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      Text("PM 11:00"),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("출발지", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      Text("터미널"),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("도착지", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      Text("캠퍼스"),
                                    ],
                                  ),
                                  Text("1/4 명", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  ElevatedButton(onPressed: () {},
                                    child: Text("탑승하기"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[300],
                                      foregroundColor: Colors.black,
                                      side: BorderSide(color: Colors.black),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                    ),),
                                ],
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
                              )
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],

          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: '이용서비스',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '내 정보',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        )
    );
  }
}

