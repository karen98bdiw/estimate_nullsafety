import 'package:estimate/models/sign/register_request_model.dart';
import 'package:estimate/presentation/ui/pages/auth/additional_info_screen.dart';
import 'package:estimate/presentation/ui/pages/auth/personal_info_screen.dart';
import 'package:estimate/presentation/ui/widgets/buttons.dart';
import 'package:estimate/presentation/ui/widgets/helpers.dart';
import 'package:estimate/utils/common/constats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoRegistringScreen extends StatefulWidget {
  final bool isClient;
  final RegisterRequestModel model;

  InfoRegistringScreen({
    required this.isClient,
    required this.model,
  });

  @override
  _InfoRegistringScreenState createState() => _InfoRegistringScreenState();
}

class _InfoRegistringScreenState extends State<InfoRegistringScreen> {
  int actionNumber = 0; //will controll the number of reg screen;
  bool someValue = false;

  var actions;

  @override
  void initState() {
    actions = [
      if (!widget.isClient)
        AddintionalInfo(
          model: widget.model,
        ),
      PersonalInfo(
        model: widget.model,
        isClient: widget.isClient,
      ),
    ];

    super.initState();
  }

  void onSave() {
    PersonalInfo.personalInfoStateKey.currentState!.onSave();
  }

  void onAdditionalInfoSave() {
    AddintionalInfo.additionalInfoState.currentState!.onSave();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: mainWhiteBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/linearBackground.svg",
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 30,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    top(),
                    Expanded(
                      child: actions[actionNumber],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ScreenActionChangeButton(
                      onBackButtonClick: () {
                        if (actionNumber - 1 > -1) {
                          setState(() {
                            actionNumber--;
                          });
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      onButtonClick: () {
                        if (actionNumber < actions.length - 1) {
                          setState(() {
                            onAdditionalInfoSave();
                            actionNumber++;
                          });
                        } else {
                          onSave();
                        }
                      },
                      buttonTitle:
                          actionNumber == actions.length - 1 ? "SAVE" : "NEXT",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget top() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormScreenTitle("Profile (${widget.isClient ? "Client" : "Talent"})"),
          if (!widget.isClient) RegisterScreenNumbers(actionNumber),
        ],
      );
}
