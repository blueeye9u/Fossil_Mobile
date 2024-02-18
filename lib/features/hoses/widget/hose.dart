// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/common/label.dart';
import 'package:fossil_mobile/constants/colors.dart';

class HosePage extends ConsumerWidget {
  HosePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
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
              ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
            top: true,
            child: Column(mainAxisSize: MainAxisSize.max, children: [
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
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 4, 0, 0),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 4, 0, 0),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                              child: Label(
                                text: 'Company Name: Millen Oil',
                                fontName: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ]))
                  ])
            ])));
  }
}
