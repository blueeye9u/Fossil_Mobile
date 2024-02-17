// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/common/button.dart';
import 'package:fossil_mobile/common/label.dart';
import 'package:fossil_mobile/constants/colors.dart';
import 'package:fossil_mobile/features/home/components/company.dart';
import 'package:fossil_mobile/features/home/provider/company_provider.dart';
import 'package:fossil_mobile/shared/http/app_exception.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 1.0),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [secondaryColor, secondaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 33.0,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Transform.translate(
          offset: Offset(-30, 5),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Label(
              text: 'Home',
              fontName: 'Readex Pro',
              color: mainColor,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 2,
        toolbarHeight: 70,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/fossil-logo.png',
                    width: 350,
                    height: 120,
                    fit: BoxFit.contain,
                    alignment: Alignment(0, 0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(45, 30, 0, 0),
                    child: Label(
                      text: 'Select Company',
                      fontName: 'Readex Pro',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _widgetContent(context, ref),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  onPress: () {},
                  buttonText: "Go",
                  btnWidth: 160,
                  btnHeight: 45,
                  borderRadius: BorderRadius.circular(24),
                  textColor: Colors.white,
                  fontSize: 20,
                  color: secondaryColor,
                  color_1: secondaryColor)
            ]),
      ),
    );
  }

  Widget _widgetLoading(BuildContext context, WidgetRef ref) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _widgetContent(BuildContext context, WidgetRef ref) {
    final state = ref.watch(companyNotifierProvider);

    return state.when(
      loading: () {
        return _widgetLoading(context, ref);
      },
      companyLoaded: (companies) {
        return CompanySelect(companies: companies);
      },
      error: (AppException error) {
        return _widgetLoading(context, ref);
      },
    );
  }
}
