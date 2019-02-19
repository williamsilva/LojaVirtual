import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/beer_tab.dart';

import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/widgets/cart_button.dart';
import 'package:loja_virtual/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Cervejas"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: BeerTab(),
          floatingActionButton: CartButton(),
        )
      ],
    );
  }
}
