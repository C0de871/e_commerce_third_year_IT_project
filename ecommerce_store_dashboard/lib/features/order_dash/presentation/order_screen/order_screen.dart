import 'dart:developer';

import 'package:ecommerce_store_dashboard/features/order_dash/presentation/cubit/get_order_dash_cubit.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/presentation/cubit/get_order_dash_state.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Card Example'),
        centerTitle: true,
      ),
      body: BlocConsumer<GetOrderDashCubit, GetOrderDashState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is GetOrderDashSuccess){
            log("********success");
          return const OrderScreenBody();}
          else{
            log("********failure");

            return const Center(
              child: Text(
              "Waiting........."
              
              ),);
          }
        },
      ),
    );
  }
}

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrderCardHeader(),
        const Divider(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 20,
            itemBuilder: (context, index) {
              return OrderCard(
                orderId: 'ID${index + 1}',
                number: '${index + 1}',
                orderDate: '2023-01-26',
                owner: 'John Doe',
                totalPrice: '\$${(index + 1) * 10}',
                status: 'Pending',
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
    return const Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
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
            Expanded(
              child: Text(
                'Status',
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

class OrderCard extends StatefulWidget {
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
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late Map<String, dynamic> selectedValue;

  final List<Map<String, dynamic>> items = [
    {'value': 'Pending', 'color': Colors.red, 'borderColor': Colors.redAccent},
    {
      'value': 'Shipped',
      'color': Colors.green,
      'borderColor': Colors.greenAccent
    },
    {
      'value': 'Delivered',
      'color': Colors.blue,
      'borderColor': Colors.blueAccent
    },
    {
      'value': 'Canceled',
      'color': Colors.orange,
      'borderColor': Colors.orangeAccent
    },
    {
      'value': 'Returned',
      'color': Colors.purple,
      'borderColor': Colors.purpleAccent
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = items.firstWhere((item) => item['value'] == widget.status);
  }

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
                widget.orderId,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                widget.orderDate,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                widget.owner,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                widget.totalPrice,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Text(
                widget.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<Map<String, dynamic>>(
                  value: selectedValue,
                  onChanged: (Map<String, dynamic>? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: items.map((item) {
                    return DropdownMenuItem<Map<String, dynamic>>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color:
                              item['color'].withOpacity(0.3), // جعل اللون خافت
                          border: Border.all(
                              color: Colors.transparent,
                              width: 0), // إزالة الحدود
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item['value'],
                          style: TextStyle(color: item['color']), // نص غامق
                        ),
                      ),
                    );
                  }).toList(),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // جعل الخلفية شفافة
                      border: Border.all(
                          color: Colors.transparent, width: 0), // إزالة الحدود
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      // color: Colors.transparent, // جعل الخلفية شفافة
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
