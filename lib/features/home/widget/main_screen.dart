// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/features/home/provider/main_screen_provider.dart';
import 'package:fossil_mobile/features/home/widget/home.dart';
import 'package:fossil_mobile/features/reports/widget/report.dart';
import 'package:fossil_mobile/features/settings/widget/setting.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    Widget body;
    switch (indexBottomNavbar) {
      case 0:
        body = const Profile();
        break;
      case 1:
        body = HomePage();
        break;
      case 2:
        body = const Report();
        break;
      default:
        // Handle unexpected index
        body = const Center(child: Text('Unknown Screen'));
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        onTap: (value) {
          ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_document), label: 'Reports'),
        ],
      ),
      body: body,
    );
  }
}
