import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() {
  runApp(const OrderScreen());
}

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Card Example'),
        centerTitle: true,
      ),
      body: const OrderScreenBody(),
    );
  }
}

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top OrderCard as table header
        const OrderCardHeader(),
        const Divider(),
        // List of cards as table rows
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 20,
            itemBuilder: (context, index) {
              return OrderCard(
                orderId: 'ID${index + 1}',
                status: 'Pending',
                orderDate: '2023-01-26',
                owner: 'John Doe',
                totalPrice: '\$${(index + 1) * 10}',
                number: '${index + 1}',
              );
            },
          ),
        ),
      ],
    );
  }
}

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Order ID',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Text(
                'Status',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Text(
                'Order Date',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Text(
                'Owner',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Text(
                'Total Price',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Text(
                'Number',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String status;
  final String orderDate;
  final String owner;
  final String totalPrice;
  final String number;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.status,
    required this.orderDate,
    required this.owner,
    required this.totalPrice,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                orderId,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  value: status,
                  onChanged: (String? newValue) {},
                  items: <String>['Pending', 'Pan', 'Pand', 'Pann', 'Pa']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),  
                  // buttonDecoration: BoxDecoration(
                  //   color: Colors.transparent,
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  // dropdownDecoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8),
                  //   color: Colors.white,
                  // ),
                  // dropdownElevation: 8,
                ),
              ),
            ),
            Expanded(
              child: Text(
                orderDate,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                owner,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                totalPrice,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
