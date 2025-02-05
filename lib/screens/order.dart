import 'package:flutter/material.dart';
import 'package:home_service/order/OrderApprovalScreen.dart';
import 'package:home_service/order/PendingOrdersScreen.dart';
import 'package:home_service/order/paid_screen.dart';
import 'package:home_service/order/unpaid_screen.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 5,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
                40),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 240, 240),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TabBar(
                isScrollable: false, // توزيع التبويبات بالتساوي
                indicator: BoxDecoration(
                  color: Color.fromARGB(255, 193, 211, 231),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.blueGrey,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                tabs: [
                  Tab(
                    icon:
                        Icon(Icons.check_circle, size: 28, color: Colors.green),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('مدفوعة', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.cancel, size: 28, color: Colors.red),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('غير مدفوعة', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.timer, size: 28, color: Colors.orange),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('قيد الانتظار', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.assignment, size: 28, color: Colors.blue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('الحالية', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          physics: ClampingScrollPhysics(),
          children: [
            PaidScreen(),
            UnpaidScreen(),
            PendingOrdersScreen(),
            OrderApprovalScreen(),
          ],
        ),
      ),
    );
  }
}