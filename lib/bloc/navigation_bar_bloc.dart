import 'dart:async';

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