import 'package:estimate/manager/manager.dart';
import 'package:estimate/models/sign/register_request_model.dart';
import 'package:estimate/presentation/ui/widgets/country_picker.dart';
import 'package:estimate/presentation/ui/widgets/helpers.dart';
import 'package:estimate/presentation/ui/widgets/inputPrefixes.dart';
import 'package:estimate/presentation/ui/widgets/inputs.dart';
import 'package:estimate/utils/common/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uuid/uuid.dart';

class PersonalInfo extends StatefulWidget {
  final bool? isClient;
  final RegisterRequestModel model;

  static final GlobalKey<_PersonalInfoState> personalInfoStateKey =
      GlobalKey<_PersonalInfoState>();

  PersonalInfo({this.isClient = false, required this.model})
      : super(key: personalInfoStateKey);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  CountryAndFlags pickerCountry = CountryAndFlags(
    name: "Armenia",
    flag: "🇦🇲",
    code: "AM",
    dialCode: "+374",
  );

  bool isCopmany = true; //or individual
  bool isIndividual = false;

  final countryController = TextEditingController();
  final scroll = ScrollController();

  @override
  void dispose() {
    countryController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.isClient!) {
      widget.model.clientRequest = ClientRequest();
    } else {
      widget.model.clientRequest = null;
    }
    widget.model.location = Location();
    widget.model.links = [];
    super.initState();
  }

  void onSave() {
    print("onSave");
    formState.currentState!.save();
    if (widget.isClient!) {
      widget.model.clientRequest!.clientType =
          isCopmany ? "COMPANY" : "INDIVIDUAL";
    }
    print("onClient company save");
    Uuid uuid = Uuid();
    widget.model.clientRequest!.id = uuid.v4();
    print(widget.model.toJson());
    var res = EstimateManager().authManager!.register(
          widget.model,
        );

    // var res = AuthManagment().register(widget.model);

    resetModel();
  }

  void resetModel() {
    widget.model.location = Location();
    widget.model.links = [];
    widget.model.clientRequest = ClientRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: true,
      child: LayoutBuilder(
        builder: (c, cn) => SingleChildScrollView(
          controller: scroll,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: cn.maxWidth,
              minHeight: cn.maxHeight,
            ),
            child: Form(
              key: formState,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  widget.isClient! ? checkAccauntTarget() : Container(),
                  if (widget.isClient! && isCopmany)
                    CustomFormInput(
                      hint: "Company name",
                      prefix: companyPrefix,
                      onSaved: (v) =>
                          widget.model.clientRequest!.companyName = v!,
                    ),
                  if (widget.isClient! && isCopmany)
                    CustomFormInput(
                      hint: "Positon",
                      prefix: positonPrefix,
                      onSaved: (v) =>
                          widget.model.clientRequest!.yourPosition = v!,
                    ),
                  CustomFormInput(
                    hint: "First name",
                    prefix: userPrefix,
                    onSaved: (v) => widget.model.firstname = v!,
                  ),
                  CustomFormInput(
                    hint: "Last name",
                    prefix: userPrefix,
                    onSaved: (v) => widget.model.lastName = v!,
                  ),
                  CustomFormInput(
                    controller: countryController,
                    hint: "Country",
                    onSaved: (v) =>
                        widget.model.location!.country = pickerCountry.name,
                    sufix: GestureDetector(
                      child: GestureDetector(
                        child:
                            SvgPicture.asset("assets/icons/dropDownIcon.svg"),
                        onTap: () async {
                          var res = await countyPickerDialog(context: context);
                          setState(() {
                            pickerCountry = res;
                            countryController.clear();
                            countryController.text = pickerCountry.name;
                          });
                        },
                      ),
                    ),
                    prefix: GestureDetector(
                      child: Text(pickerCountry.flag),
                      onTap: () async {
                        var res = await countyPickerDialog(context: context);
                        setState(() {
                          pickerCountry = res;
                          countryController.text = pickerCountry.name;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomFormInput(
                          onSaved: (v) => widget.model.location!.state = v!,
                          hint: "State",
                          textCentered: true,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 2,
                        child: CustomFormInput(
                          onSaved: (v) => widget.model.location!.city = v!,
                          hint: "City",
                          prefix: locationPrefix,
                        ),
                      ),
                    ],
                  ),
                  CustomFormInput(
                    onSaved: (v) => widget.model.location!.streetAddress = v!,
                    hint: "Street adress",
                    prefix: adressPrefix,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormInput(
                          onSaved: (v) => widget.model.location!.aptSuite = v!,
                          prefix: buildingPrefix,
                          hint: "Apt/Suite",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomFormInput(
                          onSaved: (v) => widget.model.location!.zipCode = v!,
                          hint: "Zip code",
                          prefix: zipPrefix,
                        ),
                      ),
                    ],
                  ),
                  SocialAdressInput(
                    onSaved: (v) => widget.model.links!.add(Links(name: v!)),
                    prefix: linkedinPrefix,
                  ),
                  SocialAdressInput(
                    onSaved: (v) => widget.model.links!.add(Links(name: v!)),
                    prefix: behancePrefix,
                  ),
                  SocialAdressInput(
                    onSaved: (v) => widget.model.links!.add(Links(name: v!)),
                    prefix: dribblePrefix,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget checkAccauntTarget() => Container(
        child: Row(
          children: [
            Expanded(
              child: TitledRadioButton(
                title: "Company",
                value: isCopmany,
                onChanged: (v) {
                  setState(() {
                    isCopmany = v;
                  });
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TitledRadioButton(
                title: "Individual",
                value: !isCopmany,
                onChanged: (v) {
                  setState(() {
                    isCopmany = !v;
                  });
                },
              ),
            ),
          ],
        ),
      );
}
