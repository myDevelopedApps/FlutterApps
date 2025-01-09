import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsController extends GetxController {
  var transactions = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDummyTransactions(); // Use dummy data
  }

  void fetchDummyTransactions() async {
    isLoading.value = true;

    // Simulating a delay for fetching data
    await Future.delayed(const Duration(seconds: 2));

    // Dummy transaction data
    transactions.value = [
      {"id": 1, "energy": 20, "timestamp": "2025-01-08T10:00:00Z"},
      {"id": 2, "energy": 35, "timestamp": "2025-01-08T11:00:00Z"},
      {"id": 3, "energy": 50, "timestamp": "2025-01-08T12:00:00Z"},
      {"id": 4, "energy": 40, "timestamp": "2025-01-08T13:00:00Z"},
      {"id": 5, "energy": 60, "timestamp": "2025-01-08T14:00:00Z"},
    ];

    isLoading.value = false;
  }
}

class TransactionsPage extends StatelessWidget {
  final TransactionsController controller = Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transactions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = controller.transactions[index];
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              leading: Icon(Icons.bolt, color: Colors.blue),
                              title:
                                  Text("Transaction ID: ${transaction['id']}"),
                              subtitle: Text(
                                "Energy: ${transaction['energy']} kWh\n"
                                "Timestamp: ${transaction['timestamp']}",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Energy Usage Over Time",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: _buildGraph(controller.transactions),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildGraph(List<Map<String, dynamic>> transactions) {
    if (transactions.isEmpty) {
      return const Center(child: Text("No data available"));
    }

    final spots = transactions
        .asMap()
        .entries
        .map((entry) =>
            FlSpot(entry.key.toDouble(), entry.value['energy'].toDouble()))
        .toList();

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(),
        borderData: FlBorderData(
          show: true,
          border: const Border.symmetric(
            horizontal: BorderSide(color: Colors.grey),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 4,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
