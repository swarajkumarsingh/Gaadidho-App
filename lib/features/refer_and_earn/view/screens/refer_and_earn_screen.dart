import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferAndEarnScreen extends StatelessWidget {
  static const String routeName = "/refer-and-earn";

  const ReferAndEarnScreen({Key? key}) : super(key: key);

  final num friendsReferred = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Refer and Earn Free Wash",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ReferInfoWidget(
            friendsReferred: friendsReferred, mediaQueryData: mediaQueryData),
      ),
    );
  }
}

class ReferInfoWidget extends StatelessWidget {
  const ReferInfoWidget({
    Key? key,
    required this.friendsReferred,
    required this.mediaQueryData,
  }) : super(key: key);

  final num friendsReferred;
  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    void shareApp() async {
      try {
        const urlPreview =
            "https://play.google.com/store/apps/details?id=com.wash.gaadidho";
        await Share.share(
            "GaadiDho is an Instant Bike Washing & Shining Subscription Service. GaadhiDho provides monthly subscription for Bike Wash, We are opening our Bike Washing Points on every 5 km to provide instant bike washing service.Free Download it from Google PlayStore  \n\n$urlPreview");
      } catch (e) {
        showSnackBar(context, "Unable to share, Please try again later.");
      }
    }

    void whatsappRedirect() async {
      try {
        var msg = "Hey there I need some help.";
        var url = "https://wa.me/+918789427835?text=$msg";
        // ignore: deprecated_member_use
        await launch(url);
      } catch (e) {
        showSnackBar(context, "Unable to get support, Please try again.");
      }
    }

    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.all(8.0),
      // height: 300,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Friends Referred",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        friendsReferred.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: whatsappRedirect,
                        icon: const Icon(
                          Icons.whatsapp_rounded,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 50),
                  Column(
                    children: [
                      const Text(
                        "Start Sharing",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            onPressed: whatsappRedirect,
                            icon: const Icon(
                              Icons.message,
                              color: Colors.pink,
                              size: 50,
                            ),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            onPressed: shareApp,
                            icon: const Icon(
                              Icons.redo,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Refer friends and earn a free bike wash\n NOTE: You Earn a free wash only\n after your friend buy a subscription.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          MainInfo(mediaQueryData: mediaQueryData),
        ],
      ),
    );
  }
}

class MainInfo extends StatelessWidget {
  const MainInfo({
    Key? key,
    required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SideImage(mediaQueryData: mediaQueryData),
        const InfoText(),
      ],
    );
  }
}

class SideImage extends StatelessWidget {
  const SideImage({
    Key? key,
    required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How it works?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Image.network(
          "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658429023/GaadiDHo/whtjtmckygs8q8uquhr0.jpg",
          width: mediaQueryData.size.width / 2,
          fit: BoxFit.fitHeight,
          height: 120,
        ),
      ],
    );
  }
}

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "1. Invite Friends",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 10),
        Text(
          "2. They install app using\n your link",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 10),
        Text(
          "3. They login and buy\n subscription",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 10),
        Text(
          "4. You get free wash",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
