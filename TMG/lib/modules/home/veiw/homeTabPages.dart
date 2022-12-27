
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/modules/home/veiw/home_screen.dart';
import 'package:tmg/modules/profile/veiw/profile_screen.dart';
import 'package:tmg/modules/setting/veiw/setting_screen.dart';
import 'package:tmg/provider/main_provider.dart';

class HomeTabPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (_) => MainProvider(),
      child: _HomeTabPagesProviderBody(),
    );
  }
}

class _HomeTabPagesProviderBody extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _HomeTabPagesProviderBodyState();
  }
}

class _HomeTabPagesProviderBodyState extends State<_HomeTabPagesProviderBody> {

  int _currentIndex = 1;
  List<Widget> _pages = List<Widget>();

  List<Widget> tabPages = [Home(), Profile(), Setting()];
  @override
  void initState() {
    _pages.add(Profile());
    _pages.add(Home());
    _pages.add(Setting());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (_, MainProvider myProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body:_pages[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: kBottomNavigationBarHeight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  backgroundColor: MyColors.lightGreyColor,
                  selectedItemColor: MyColors.primaryColor,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon:
                            Padding(
                              padding: const EdgeInsets.only(top: 1.5),
                              child: Icon(Icons.person,size: 24,),
                            ),
                          label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 1.5),
                          child: Icon(Icons.settings_outlined),
                        ), label: '')
                  ]),
            ),
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor:  MyColors.lightGreyColor,
            child: Icon(Icons.home,color: _currentIndex == 1 ? MyColors.primaryColor : Colors.grey[700] ),
            onPressed: () => setState(() {
              _currentIndex = 1;
            }),
          ),
        ),
      );
    });
  }
}
