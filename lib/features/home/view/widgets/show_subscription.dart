import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/features/home/view/widgets/show_recharge_plan.dart';

class ShowSubscription extends StatelessWidget {
  const ShowSubscription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "Bike Wash Subscription",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          // color: Colors.red,
          height: 132,
          width: double.infinity,
          child: ListView.builder(
            itemCount: GlobalVariables.carouselImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return ShowRecharge(
                  networkUrl: GlobalVariables.carouselImages[index]);
            },
          ),
        ),
      ],
    );
  }
}
