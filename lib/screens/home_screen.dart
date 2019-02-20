import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/beer_tab.dart';

import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/tabs/order_tab.dart';
import 'package:loja_virtual/tabs/places_tab.dart';
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
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Lojas"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PlacesTab(),
          //floatingActionButton: CartButton(),
        ),
        Container(color: Colors.yellow),
          Scaffold(
            appBar: AppBar(
              title: Text("Meus Pedidos"),
              centerTitle: true,
            ),
            body: OrdersTab(),
            drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}
