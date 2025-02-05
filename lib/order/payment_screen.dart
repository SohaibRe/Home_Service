import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدفع'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختر طريقة الدفع',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet,
                    color: Colors.green),
                title: const Text('محفظة إلكترونية'),
                subtitle: const Text('استخدم محفظتك الإلكترونية للدفع'),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // الانتقال إلى صفحة الدفع بالمحفظة الإلكترونية
                  Navigator.pushNamed(context, '/wallet_payment');
                },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(Icons.money, color: Colors.orange),
                title: const Text('الدفع نقدًا'),
                subtitle: const Text('الدفع عند الاستلام'),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // الانتقال إلى صفحة الدفع نقدًا
                  Navigator.pushNamed(context, '/cash_payment');
                },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Image.asset('images/le.png', width: 50, height: 50),
                title: const Text('ادفع لي'),
                subtitle: const Text('خدمة ادفع لي (مصرف التجارة والتنمية)'),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  Navigator.pushNamed(context, '/pay_yall_payment');
                },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Image.asset('images/sa.png', width: 50, height: 50),
                title: const Text('خدمة سداد'),
                subtitle: const Text('خدمة سداد من شركة المدار'),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  Navigator.pushNamed(context, '/sadad_payment');
                },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Image.asset('images/mo.png', width: 50, height: 50),
                title: const Text('موبي كاش'),
                subtitle: const Text('موبي كاش (مصرف الوحدة)'),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  Navigator.pushNamed(context, '/money_cash_payment');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
