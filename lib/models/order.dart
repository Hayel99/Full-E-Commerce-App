import 'package:google_maps_flutter/google_maps_flutter.dart';

class Order {
  final String id;
  final int count;
  final String date;
  final double totalAmount;

  Order(
      {required this.id,
      required this.count,
      required this.date,
      required this.totalAmount,
     });

  static List<Order> orders = [
    Order(
        id: 'A0016889',
        count: 5,
        date: '20-Dec-2021, 1:00 Pm',
        totalAmount: 2050),
    Order(
        id: 'B8563255',
        count: 10,
        date: '30-Dec-2021, 8:00 Pm',
        totalAmount: 550),
    Order(
        id: 'C5829931',
        count: 8,
        date: '22-Dec-2021, 3:00 Pm',
        totalAmount: 2800)
  ];
}
