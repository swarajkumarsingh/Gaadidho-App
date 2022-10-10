import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/widgets/box.dart';

class ShowSchedule extends StatelessWidget {
  const ShowSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 15),
        const Text(
          "Your Bike Wash Schedule",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          // width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: GlobalVariables.scheduleList.length,
            itemBuilder: (BuildContext context, int index) {
              return Box(index: index);
            },
          ),
        ),
      ],
    );
  }
}
