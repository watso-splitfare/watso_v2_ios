import 'package:flutter/material.dart';
import 'package:watso_v2/common/widgets/Boxes.dart';
import 'package:watso_v2/common/widgets/Layout.dart';

import '../../common/constants/styles.dart';
import '../../common/widgets/Buttons.dart';

class TaxiRecruitmentPage extends StatefulWidget {
  const TaxiRecruitmentPage({super.key, required this.pageId});

  final String pageId;

  @override
  State<TaxiRecruitmentPage> createState() => _TaxiRecruitmentPageState();
}

class _TaxiRecruitmentPageState extends State<TaxiRecruitmentPage> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        body: OutlineBox(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("택시 Icon")),
        ),
        Divider(
          color: Colors.black,
          height: 0.5,
        ),
        Container(
          color: WatsoColor.primary,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 50),
              Text(
                "터미널 -> 캠퍼스",
                style: WatsoFont.subtitle,
              ),
              SizedBox(width: 50, child: Text("1/4명"))
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          height: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TileContentBox(title: "출발시간", content: "12:00"),
              TileContentBox(title: "예상금액", content: "8000원"),
              TileContentBox(title: "개인부담금액", content: "2000원"),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          height: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("대충 설명글"),
              PrimaryBtn(
                onPressed: () {},
                text: "신청하기",
              )
            ],
          ),
        ),
      ],
    )));
  }
}
