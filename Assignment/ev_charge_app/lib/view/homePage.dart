import 'package:ev_charge_app/view/configurationPage.dart';
import 'package:ev_charge_app/view/startCharging.dart';
import 'package:ev_charge_app/view/status%20Page.dart';
import 'package:ev_charge_app/view/stopCharging.dart';
import 'package:ev_charge_app/view/transactionPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tecell EV Dashboard',
            style: GoogleFonts.ptSans(fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, Sunil",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Manage your EV charging solutions effortlessly.",
              style: GoogleFonts.abel(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardCard(
                    icon: Icons.ev_station,
                    title: "Start Charging",
                    color: Colors.green,
                    onTap: () {
                      Get.to(() => StartChargingPage());
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.stop_circle,
                    title: "Stop Charging",
                    color: Colors.red,
                    
                    onTap: () {
                      // Navigate to Stop Charging Page
                      Get.to(() => StopChargingPage());
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.analytics,
                    title: "Transactions",
                    color: Colors.blueAccent,
                    onTap: () {
                      // Navigate to Transactions Page
                      Get.to(() => TransactionsPage());
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.settings,
                    title: "Configuration",
                    color: Colors.deepPurple,
                    onTap: () {
                      // Navigate to Configuration Page
                      Get.to(() => ConfigurationPage());
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.file_present,
                    title: "Diagnostics",
                    color: Colors.orange,
                    onTap: () {
                      // Navigate to Diagnostics Page
                      Get.to(() => ConfigurationPage());
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.info,
                    title: "Status",
                    color: Colors.teal,
                    onTap: () {
                      // Navigate to Status Page
                      Get.to(() => StatusPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 207, 204, 204),
                offset: Offset(0, 3),
                spreadRadius: 1,
                blurRadius: 0.5)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
