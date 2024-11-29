import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/pages/application/bloc/app_blocs.dart';
import 'package:e_learning_klass/pages/application/bloc/app_events.dart';
import 'package:e_learning_klass/pages/home/home_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    Center(
      child: Text('Class'),
    ),
    Center(
      child: Text('Schedule'),
    ),
    Center(
      child: Text('Toolbox'),
    ),
  ];

  return _widget[index];
}

var bottomTabs = const [
  BottomNavigationBarItem(
    label: "Home",
    icon: Icon(FluentIcons.home_24_regular),
    activeIcon: Icon(FluentIcons.home_24_filled),
  ),
  BottomNavigationBarItem(
    label: "Class",
    icon: Icon(FluentIcons.class_24_regular),
    activeIcon: Icon(FluentIcons.class_24_filled),
  ),
  BottomNavigationBarItem(
    label: "Schedule",
    icon: Icon(FluentIcons.calendar_24_regular),
    activeIcon: Icon(FluentIcons.calendar_24_filled),
  ),
  BottomNavigationBarItem(
    label: "Toolbox",
    icon: Icon(FluentIcons.toolbox_24_regular),
    activeIcon: Icon(FluentIcons.toolbox_24_filled),
  ),
];

Widget buildBottomNavBar(
  BuildContext context,
  int index,
) {
  return BottomNavigationBar(
    backgroundColor: AppColors.primaryBackground,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: AppColors.primaryElementStatus,
    unselectedItemColor: AppColors.primaryFourthElementText,
    currentIndex: index,
    onTap: (value) {
      context.read<AppBloc>().add(TriggerAppEvent(value));
    },
    items: bottomTabs,
  );
}
