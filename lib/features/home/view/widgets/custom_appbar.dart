import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: RichText(
              text: TextSpan(
                // text: 'Hello ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Gaadi',
                    style: TextStyle(
                        color: GlobalVariables.gaadiLogoColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  TextSpan(
                    text: 'Dho',
                    style: TextStyle(
                        color: GlobalVariables.dhoLogoColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.all(2),
          //       decoration: BoxDecoration(
          //         color: const Color.fromRGBO(88, 219, 105, 1),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Row(
          //         children: [
          //           const Icon(
          //             Icons.currency_bitcoin,
          //             color: Colors.amber,
          //             size: 32,
          //           ),
          //           Container(
          //             margin: const EdgeInsets.symmetric(horizontal: 9),
          //             child: const Text(
          //               "50",
          //               style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(2),
          //       margin: const EdgeInsets.only(left: 12),
          //       decoration: BoxDecoration(
          //         color: const Color.fromRGBO(88, 219, 105, 1),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: const Icon(
          //         Icons.notification_add,
          //         color: Colors.amber,
          //         size: 32,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
