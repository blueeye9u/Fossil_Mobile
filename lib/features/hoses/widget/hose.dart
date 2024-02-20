// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/shared/common/button.dart';
import 'package:fossil_mobile/shared/common/label.dart';
import 'package:fossil_mobile/shared/constants/colors.dart';
import 'package:fossil_mobile/shared/constants/image_string.dart';
import 'package:fossil_mobile/shared/route/app_router.dart';
import 'package:go_router/go_router.dart';

class HosePage extends ConsumerWidget {
  HosePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<String> list = <String>[
      'Unleaded Gasonline',
      'Unleaded Yard',
      'On Road Diesel',
      'Diesel Yard'
    ];
    String dropdownValue = list.first;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
              child: Label(
                text: 'FossilFluid',
                fontName: 'Readex Pro',
                fontSize: 20,
                color: mainColor,
              ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                    width: 100,
                    height: 145,
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                          child: Label(
                            text: 'Name: Mike Conkle',
                            fontName: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 4, 0, 0),
                          child: Label(
                            text: 'Mobile: 318-560-1817',
                            fontName: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 4, 0, 0),
                          child: Label(
                            text: 'Email: mike@millenoil.com',
                            fontName: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Label(
                            text: 'Company Name: Millen Oil',
                            fontName: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ])),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            logoUrl,
                            width: 350,
                            height: 120,
                            fit: BoxFit.contain,
                            alignment: Alignment(0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), // Generated code for this Row Widget...
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(45, 30, 0, 0),
                      child: Label(
                        text: 'Select Hose To Use',
                        fontName: 'Readex Pro',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: primaryColor,
                                )),
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  isExpanded: true,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  icon: Icon(Icons.keyboard_arrow_down,
                                      color: primaryColor),
                                  elevation: 16,
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    // setState(() {
                                    //   dropdownValue = value!;
                                    // });
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Generated code for this Row Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          onPress: () {
                            context.go(SetVehiclePageRoute.path);
                          },
                          buttonText: "Go",
                          btnWidth: 160,
                          btnHeight: 45,
                          borderRadius: BorderRadius.circular(24),
                          textColor: Colors.white,
                          fontSize: 20,
                          color: secondaryColor,
                          color_1: secondaryColor)
                    ],
                  ),
                ),
                // Generated code for this Row Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Label(
                        text: '14:50 Feb 01, 2024',
                        fontName: 'Readex Pro',
                        fontSize: 18,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(42, 0, 0, 0),
                        child: Label(
                          text: 'Version 1.18.35(3)',
                          textAlign: TextAlign.center,
                          fontName: 'Readex Pro',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ])
        ]));
  }
}
