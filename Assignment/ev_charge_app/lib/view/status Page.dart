import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StatusController extends GetxController {
  var statusList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var lastHeartbeat = DateTime.now().obs;
  var centralSystemTime = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    fetchStatusData(); // Load dummy status data
    simulateHeartbeat(); // Simulate heartbeat updates
  }

  void fetchStatusData() async {
    isLoading.value = true;

    // Simulate fetching status data with a delay
    await Future.delayed(const Duration(seconds: 2));

    // Dummy status data
    statusList.value = [
      {
        "connectorId": 1,
        "status": "Available",
        "errorCode": "NoError",
        "info": "Ready to charge"
      },
      {
        "connectorId": 2,
        "status": "Charging",
        "errorCode": "NoError",
        "info": "Charging in progress"
      },
      {
        "connectorId": 3,
        "status": "Faulted",
        "errorCode": "EVCommunicationError",
        "info": "Communication error detected"
      },
      {
        "connectorId": 4,
        "status": "Unavailable",
        "errorCode": "PowerFailure",
        "info": "Connector not operational"
      },
    ];

    isLoading.value = false;
  }

  void simulateHeartbeat() {
    // Simulate heartbeat updates every 10 seconds
    ever(lastHeartbeat, (_) {
      centralSystemTime.value = DateTime.now();
    });

    Future.delayed(const Duration(seconds: 10), () {
      lastHeartbeat.value = DateTime.now();
      simulateHeartbeat();
    });
  }

  void syncTime() {
    // Simulate time synchronization
    centralSystemTime.value = DateTime.now();
    Get.snackbar(
      "Success",
      "Time synchronized successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}

class StatusPage extends StatelessWidget {
  final StatusController controller = Get.put(StatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Charge Point Status',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
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
                      "Charge Point Status",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.statusList.length,
                        itemBuilder: (context, index) {
                          final status = controller.statusList[index];
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    _getStatusColor(status['status']),
                                child: Icon(
                                  _getStatusIcon(status['status']),
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                "Connector ID: ${status['connectorId']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status: ${status['status']}"),
                                  Text("Error Code: ${status['errorCode']}"),
                                  Text("Info: ${status['info']}"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildHeartbeatAndTimeSection(controller),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildHeartbeatAndTimeSection(StatusController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Heartbeat and Time Synchronization",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last Heartbeat: ${DateFormat('yyyy-MM-dd HH:mm').format(controller.lastHeartbeat.value)}",
                  ),
                  Text(
                    "Central System Time: ${DateFormat('yyyy-MM-dd HH:mm').format(controller.centralSystemTime.value)}",
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: controller.syncTime,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey, fixedSize: Size(50, 50)),
                child: const Text("Sync Time"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Available":
        return Colors.green;
      case "Charging":
        return Colors.blue;
      case "Faulted":
        return Colors.red;
      case "Unavailable":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case "Available":
        return Icons.check_circle;
      case "Charging":
        return Icons.flash_on;
      case "Faulted":
        return Icons.error;
      case "Unavailable":
        return Icons.block;
      default:
        return Icons.info;
    }
  }
}
