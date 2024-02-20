// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/shared/common/label.dart';
import 'package:fossil_mobile/shared/constants/colors.dart';
import 'package:fossil_mobile/shared/constants/image_string.dart';
import 'package:go_router/go_router.dart';

class Report extends ConsumerWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.go('/');
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
            child: Label(
              text: 'Report',
              fontName: 'Readex Pro',
              fontSize: 16,
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
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  logoUrl,
                  width: 169,
                  height: 88,
                  fit: BoxFit.fill,
                  alignment: Alignment(0, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
