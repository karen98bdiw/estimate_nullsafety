import 'package:auto_size_text/auto_size_text.dart';
import 'package:estimate/models/sign/register_request_model.dart';
import 'package:estimate/presentation/ui/pages/auth/info_registring_screens.dart';
import 'package:estimate/presentation/ui/widgets/apply_picker.dart';
import 'package:estimate/presentation/ui/widgets/buttons.dart';
import 'package:estimate/presentation/ui/widgets/country_picker.dart';
import 'package:estimate/presentation/ui/widgets/helpers.dart';
import 'package:estimate/presentation/ui/widgets/inputs.dart';
import 'package:estimate/utils/common/app_constats.dart';
import 'package:estimate/utils/common/constats.dart';
import 'package:estimate/utils/common/country.dart';
import 'package:estimate/utils/common/enums.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;

  bool obscureRepeatPassword = true;
  bool isAgreeWithAgreement = false;
  bool isClient = false;
  bool isTallent = false;

  final RegisterRequestModel model = RegisterRequestModel();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  CountryAndFlags pickerCountry = CountryAndFlags(
    name: "Armenia",
    flag: "🇦🇲",
    code: "AM",
    dialCode: "+374",
  );

  Map<String, dynamic> apply = {"name": "Tallent"};

  @override
  void dispose() {
    passwordController.clear();
    passwordController.dispose();

    super.dispose();
  }

  onSingUp() {
    if (!_formState.currentState!.validate()) return;

    _formState.currentState!.save();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (c) => InfoRegistringScreen(isClient: isClient, model: model),
      ),
    );
    print("model:${model.toJson()}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: mainWhiteBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/linearBackground.svg",
                fit: BoxFit.fill,
              ),
              Padding(
                padding: formScaffoldPadding,
                child: LayoutBuilder(
                  builder: (c, cn) => SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: cn.maxWidth,
                        minHeight: cn.maxHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: titleColor,
                            ),
                          ),
                          _form(),
                          _checkAction(),
                          bottom(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottom() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          agreement(),
          SizedBox(
            height: 15,
          ),
          CustomBtn(
            icon: Container(),
            title: "Sign Up",
            onClick: onSingUp,
          ),
          SizedBox(
            height: 5,
          ),
          MoveToSignType(
            toType: SignType.Sign,
          ),
        ],
      );

  Widget _checkAction() => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Apply as",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClient = !isClient;
                                isTallent = false;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: blueShape,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Client",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TitledCheckBox(
                          showTitle: false,
                          onChanged: (v) {
                            setState(() {
                              isClient = v;
                              isTallent = false;
                            });
                          },
                          value: isClient,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              Map<String, dynamic>? res =
                                  await applyPicker(context: context);
                              if (res != null) {
                                setState(() {
                                  apply = res;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: mainBtnColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      apply["name"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/dropDownIcon.svg",
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TitledCheckBox(
                          showTitle: false,
                          onChanged: (v) {
                            setState(() {
                              isTallent = v;
                              isClient = false;
                            });
                          },
                          value: isTallent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _form() => Form(
        key: _formState,
        child: Column(
          children: [
            CustomFormInput(
              validator: MultiValidator([
                PatternValidator(AppContstats.Regexp_Email,
                    errorText: "Please write valid email!"),
                RequiredValidator(errorText: "Please write email!"),
              ]),
              onSaved: (v) => model.email = v,
              hint: "Email",
              prefix: SvgPicture.asset(
                "assets/icons/emailPrefix.svg",
              ),
            ),
            CustomFormInput(
              validator: RequiredValidator(errorText: "Please write phone!"),
              onSaved: (newValue) =>
                  model.phoneNumber = pickerCountry.dialCode + newValue!,
              hint: "Phone Number",
              formatters: [FilteringTextInputFormatter.digitsOnly],
              prefix: GestureDetector(
                child: Text(pickerCountry.flag + " " + pickerCountry.dialCode),
                onTap: () async {
                  CountryAndFlags? res =
                      await countyPickerDialog(context: context);
                  setState(() {
                    pickerCountry = res;
                  });
                },
              ),
            ),
            CustomFormInput(
              validator: RequiredValidator(errorText: "Please write password"),
              onSaved: (v) => model.password = v,
              controller: passwordController,
              hint: "Create Password",
              obscureText: obscurePassword,
              prefix: SvgPicture.asset(
                "assets/icons/passwordPrefix.svg",
              ),
              sufix: GestureDetector(
                onTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                child: SvgPicture.asset("assets/icons/passwordSuffix.svg"),
              ),
            ),
            CustomFormInput(
              validator: (newValue) => newValue!.isEmpty
                  ? "Please repeat password!"
                  : newValue == passwordController.text
                      ? null
                      : "Password did't match!",
              onSaved: (v) => model.confirmPassword = v,
              obscureText: obscureRepeatPassword,
              sufix: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureRepeatPassword = !obscureRepeatPassword;
                  });
                },
                child: SvgPicture.asset("assets/icons/passwordSuffix.svg"),
              ),
              hint: "Repeat Password",
              prefix: SvgPicture.asset(
                "assets/icons/passwordPrefix.svg",
              ),
            ),
          ],
        ),
      );

  Widget agreement() => Container(
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isAgreeWithAgreement = !isAgreeWithAgreement;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.height * 0.025,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mainBorderColor),
                ),
                child: isAgreeWithAgreement
                    ? Center(
                        child: SvgPicture.asset(
                          "assets/icons/doneIcon.svg",
                        ),
                      )
                    : Container(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: AutoSizeText(
                "I agree to Estimate’s Terms & Conditions and Privacy Policy ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
}
