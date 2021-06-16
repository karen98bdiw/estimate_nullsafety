import 'package:auto_size_text/auto_size_text.dart';
import 'package:estimate/base/routes.dart';
import 'package:estimate/presentation/ui/widgets/buttons.dart';
import 'package:estimate/utils/common/constats.dart';

import 'package:flutter/material.dart';

class SignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: formScaffoldPadding,
          child: LayoutBuilder(
            builder: (c, cn) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: cn.maxHeight, minWidth: cn.maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    top(context),
                    buttons(context),
                    bottom(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBtn(
            icon: Container(),
            color: blueShape,
            title: "Get Started",
            onClick: () {
              Navigator.of(context).pushNamed(EstimateRoutes.LOGIN_SCREEN);
            },
            fill: true,
          ),
          SizedBox(
            height: 15,
          ),
          CustomBtn(
            icon: Container(),
            textColor: mainBtnColor,
            outlineColor: mainBtnColor,
            outlined: true,
            title: "Sign Up",
            onClick: () {
              Navigator.of(context).pushNamed(EstimateRoutes.REGISTER_SCREEN);
            },
            fill: true,
          ),
        ],
      );

  Widget top(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.bottomLeft,
                  child: AutoSizeText(
                    "ESTIMATORS",
                    style: TextStyle(
                      color: blueShape,
                      fontSize: 40,
                      height: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Image.asset(
                  "assets/images/logo.gif",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "The Perfect Space for Project Estimating",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "ESTIMATORS is the world’s most powerful relationship and workflow managment tool",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ],
      );

  Widget bottom() => RichText(
        text: TextSpan(children: [
          TextSpan(
            text:
                "By Proceeding you acknowledge that you have read, understood and agree to our",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              child: Text(
                "Terms and Conditions",
                style: TextStyle(
                  fontSize: 17,
                  color: blueShape,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {},
            ),
          ),
        ]),
      );
}
