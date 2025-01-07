import 'package:flutter/material.dart';

void main() {
  runApp(LifelineCartApp());
}

class LifelineCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LifelineCartScreen(),
    );
  }
}

class LifelineCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card & Wallets', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LifelineCart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Card Status: Inactive',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Guide', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Activate Card Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Activate your LifelineCard',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '₹ 3499 - Life Time',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹ 9999/Year',
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text('Offer Ends Soon!'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Activate Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Features Section
            Text(
              'Our Features',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FeatureCard(icon: Icons.account_balance_wallet, label: 'Udhar'),
                FeatureCard(icon: Icons.payments, label: 'CP EMI'),
                FeatureCard(icon: Icons.business, label: 'Business Funds'),
              ],
            ),
            SizedBox(height: 16),

            // Wallet Section
            Text(
              'Wallet',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            WalletCard(
              title: 'Lifeline Card Wallet',
              amount: '4356',
              actions: ['Withdraw', 'Transfer'],
            ),
            WalletCard(
              title: 'Lifeline Coin',
              amount: '4356',
              subtitle: 'Lifeline Magic Coin',
            ),
            WalletCard(
              title: 'Cashback Coin',
              amount: '4356',
              subtitle: 'Add Credit Coin',
              subtitleColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;

  FeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue[100],
          child: Icon(icon, color: Colors.blue, size: 30),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class WalletCard extends StatelessWidget {
  final String title;
  final String amount;
  final String? subtitle;
  final Color? subtitleColor;
  final List<String>? actions;

  WalletCard({
    required this.title,
    required this.amount,
    this.subtitle,
    this.subtitleColor,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          if (subtitle != null) ...[
            SizedBox(height: 4),
            Text(
              subtitle!,
              style: TextStyle(color: subtitleColor ?? Colors.black),
            ),
          ],
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              if (actions != null)
                Row(
                  children: actions!
                      .map(
                        (action) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(action),
                          ),
                        ),
                      )
                      .toList(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
