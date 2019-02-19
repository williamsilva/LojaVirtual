import 'package:cloud_firestore/cloud_firestore.dart';

class BeerData {
  String category;
  String id;

  String title;
  String description;

  double price;

  List images;
  List sizes;

  BeerData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"].toDouble();
    images = snapshot.data["images"];
    sizes = snapshot.data["sizes"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "title": title,
      "description": description,
      "price": price
    };
  }

}