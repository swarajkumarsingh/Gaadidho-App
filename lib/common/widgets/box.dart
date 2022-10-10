import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';

class Box extends StatelessWidget {
  final int index;
  const Box({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 110,
          height: 110,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: GlobalVariables.scheduleList[index]['status'] == "Completed"
                ? const Color.fromRGBO(251, 226, 228, 1)
                : const Color.fromRGBO(235, 242, 226, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalVariables.scheduleList[index]['isFree'] == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "1st Service",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Image.network(
                          "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658339974/GaadiDHo/r9umy35elqblw63hqjvg.png",
                          width: 35,
                          height: 25,
                        )
                      ],
                    )
                  : Text(
                      GlobalVariables.scheduleList[index]['leading'],
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
              Text(
                "${GlobalVariables.scheduleList[index]['date']}\n ${GlobalVariables.scheduleList[index]['day']}",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(left: 3),
                height: 23,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Icon(
                      GlobalVariables.scheduleList[index]['status'] ==
                              "Completed"
                          ? Icons.check_circle_outlined
                          : Icons.schedule,
                      size: 20,
                      color: GlobalVariables.scheduleList[index]['status'] ==
                              "Completed"
                          ? GlobalVariables.primaryColor
                          : Colors.orange,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      GlobalVariables.scheduleList[index]['status'],
                      style: TextStyle(
                          color: GlobalVariables.scheduleList[index]
                                      ['status'] ==
                                  "Completed"
                              ? GlobalVariables.primaryColor
                              : Colors.orange,
                          fontSize: 10,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 18,
        )
      ],
    );
  }
}
