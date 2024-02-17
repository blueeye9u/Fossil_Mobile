// Your UI code, for example, in CompanySelect.dart

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:fossil_mobile/constants/colors.dart';
import 'package:fossil_mobile/features/home/model/company.dart';

// ignore: must_be_immutable
class CompanySelect extends StatelessWidget {
  final List<Company> companies;

  CompanySelect({Key? key, required this.companies});

  @override
  Widget build(BuildContext context) {
    List<S2Choice<String>> options = companies.map((company) {
      return S2Choice<String>(
          value: company.companyNumber, // Convert to String if needed
          title: company.companyName);
    }).toList();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: primaryColor, width: 2)),
          child: SmartSelect<String>.single(
            title: 'Select Company',
            choiceItems: options,
            onChange: (state) {
              // Handle the selected company
              state.value;
            },
            selectedValue: '',
            modalType: S2ModalType.bottomSheet,
            choiceActiveStyle: S2ChoiceStyle(padding: EdgeInsets.all(0)),
          ),
        ),
      ),
    );
  }
}
