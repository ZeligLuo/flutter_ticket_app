abstract class BottomNavBarState {}

class BottomNavBarInitial extends BottomNavBarState{}

class BottomNavBarSelected extends BottomNavBarState {
  final int selectedIndex;
  BottomNavBarSelected(this.selectedIndex);
}