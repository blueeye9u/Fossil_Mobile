// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/shared/common/button.dart';
import 'package:fossil_mobile/shared/common/label.dart';
import 'package:fossil_mobile/shared/constants/colors.dart';
import 'package:fossil_mobile/shared/common/text_field.dart';
import 'package:fossil_mobile/shared/constants/image_string.dart';
import 'package:fossil_mobile/shared/route/app_router.dart';
import 'package:go_router/go_router.dart';

class SetVehiclePage extends ConsumerWidget {
  const SetVehiclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController vehcileNumController = TextEditingController();
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
            // Navigator.of(context).pop();
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
            child: Label(
              text: 'Unleaded Gasoline',
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
      body: // Generated code for this Column Widget...
          Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Label(
                  text: 'Enter Vehicle Number',
                  fontName: 'Readex Pro',
                  fontSize: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: CustomInputField(
                      labelText: "",
                      controller: vehcileNumController,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    onPress: () {},
                    buttonText: "Cancel",
                    btnWidth: 160,
                    btnHeight: 45,
                    borderRadius: BorderRadius.circular(24),
                    textColor: Colors.white,
                    fontSize: 20,
                    color: secondaryColor,
                    color_1: secondaryColor),
                CustomButton(
                    onPress: () {
                      context.go(SetOdometerPageRoute.path);
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 300, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      logoUrl,
                      width: 250,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
