import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/beer_data.dart';
import 'package:loja_virtual/screens/beer_screen.dart';

class BeerTitle extends StatelessWidget {
  final String type;
  final BeerData beer;

  BeerTitle(this.type, this.beer);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => BeerScreen(beer))
        );
      },
      child: Card(
          child: type == "grid"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 0.8,
                      child: Image.network(
                          beer.images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(beer.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500
                            ),),
                            Text(
                                "R\$ ${beer.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Image.network(
                  beer.images[0],
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(beer.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),),
                      Text(
                        "R\$ ${beer.price.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
