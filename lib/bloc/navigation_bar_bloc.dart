import 'dart:async';

// The Bloc is created for state management of Home Page on changing NavigationBar
class NavigationBarBloc {
  final StreamController<int> _navigationPageController =StreamController<int>();
  Stream<int> get navigationItemStream => _navigationPageController.stream;

  void dispose (){
    _navigationPageController.close();
  }
  void setNavigationItem (int navigationItem) => _navigationPageController.add(navigationItem);


 Stream<int> mapEventToState(int currentNavigationItem) async* {

   yield currentNavigationItem ;
 }

}