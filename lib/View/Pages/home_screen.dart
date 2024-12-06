import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Locale/LanguageController.dart';
import '../../size_config.dart';
import '../components/body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final c = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    // we have to call this on our starting page
    SizeConfig.init(context);
    return Scaffold(
      // appBar: buildAppBar(context),
      body: Body(),
    );
  }

// Languagecontroller;
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/Settings.svg",
        ),
        onPressed: () {
          c.changeLanguage('en');
        },
      ),
      actions: [buildAddButton(context)],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: getProportionateScreenWidth(32),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
