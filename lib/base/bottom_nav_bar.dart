import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/bloc/bottom_nav_bloc.dart';
import 'package:ticket_app/bloc/bottom_nav_events.dart';
import 'package:ticket_app/bloc/bottom_nav_states.dart';
// import 'package:ticket_app/controller/bottom_nav_controller.dart';
// import 'package:ticket_app/provider/bottom_nav_provider.dart';
import 'package:ticket_app/screens/home/home_screen.dart';
import 'package:ticket_app/screens/profile/profile_screen.dart';
import 'package:ticket_app/screens/search/search_screen.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';
// import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  // getx dependency injection
  // final BottomNavController controller = Get.put(BottomNavController());

  BottomNavBar({super.key});

  // app list iterated using index
  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    // riverpod dependency injection
    // var selectedIndex = ref.watch(bottomNavBarNotifierProvider);

    return BlocBuilder<BottomNavBloc, BottomNavBarState>(builder: (context, state) {
      // print("state is $state");
      // var selectedIndex = (state as BottomNavBarSelected).selectedIndex;

      if (state is BottomNavBarSelected) {
        return Scaffold(
          body: appScreens[state.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (int index) {
                context.read<BottomNavBloc>().add(OnItemTapped(index));
              },
              // onTap: ref.watch(bottomNavBarNotifierProvider.notifier).onItemTapped,
              selectedItemColor: Colors.blueGrey,
              unselectedItemColor: const Color(0xFF526400),
              showSelectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                    activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled)),
                BottomNavigationBarItem(
                    label: "Search",
                    icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                    activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled)),
                BottomNavigationBarItem(
                    label: "Tickets",
                    icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                    activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled)),
                BottomNavigationBarItem(
                    label: "Profile",
                    icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                    activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled)),
              ]),
        );
      } else {
        return Container();
      }
    });
  }
}
