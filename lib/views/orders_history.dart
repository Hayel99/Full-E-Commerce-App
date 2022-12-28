import 'package:ecommerce_app/models/order.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class OrdersHistory extends StatefulWidget {
  const OrdersHistory({Key? key}) : super(key: key);

  @override
  State<OrdersHistory> createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders History')),
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: Order.orders.length,
          itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order #${Order.orders[index].id}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '\$${Order.orders[index].totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Order.orders[index].date,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
