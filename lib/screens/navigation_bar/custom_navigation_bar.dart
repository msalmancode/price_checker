import 'package:flutter/material.dart';
import 'package:price_checker/components/snackbar.dart';
import 'package:price_checker/screens/SetPrice/set_price_screen.dart';
import 'package:price_checker/screens/dashboard/components/dialogs_class.dart';
import 'package:price_checker/screens/dashboard/dashboard_screen.dart';
import 'package:price_checker/utils/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({Key? key}) : super(key: key);

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final passwordController = TextEditingController();

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    SetPriceScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      showPasswordDialog(
        context,
        controller: passwordController,
        onConfirmTap: () {
          if (passwordController.text == 'J@n@n5500') {
            setState(() => _selectedIndex = index);
          } else {
            showSnackBar('Failed', 'Incorrect password', isError: true);
          }
        },
      );
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.sell_outlined),
            title: const Text("Price Checker"),
            selectedColor: primaryColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.payments_outlined),
            title: const Text("Set Price"),
            selectedColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
