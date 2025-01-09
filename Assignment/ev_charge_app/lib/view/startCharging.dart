import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StartChargingController extends GetxController {
  final WebSocketChannel channel =
      WebSocketChannel.connect(Uri.parse('ws://your-central-system-url'));

  var connectorId = ''.obs;
  var idTag = ''.obs;
  var isLoading = false.obs;

  void startCharging() async {
    if (connectorId.isEmpty || idTag.isEmpty) {
      Get.snackbar(
        "Error",
        "Please provide both Connector ID and ID Tag",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      // Send Authorize.req to the Central System
      channel.sink.add(_buildAuthorizeRequest());

      // Listen for Authorize.conf response
      channel.stream.listen((response) {
        if (_isAuthorized(response)) {
          // Send StartTransaction.req if authorized
          channel.sink.add(_buildStartTransactionRequest());
          Get.snackbar(
            "Success",
            "Charging started successfully for Connector ID: ${connectorId.value}",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Authorization Failed",
            "The ID Tag is not authorized.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
        }
        isLoading.value = false;
      });
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to communicate with the Central System.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      isLoading.value = false;
    }
  }

  String _buildAuthorizeRequest() {
    return '''
    {
      "messageType": "Authorize",
      "idTag": "${idTag.value}"
    }
    ''';
  }

  String _buildStartTransactionRequest() {
    return '''
    {
      "messageType": "StartTransaction",
      "connectorId": "${connectorId.value}",
      "idTag": "${idTag.value}",
      "timestamp": "${DateTime.now().toIso8601String()}",
      "meterStart": 0
    }
    ''';
  }

  bool _isAuthorized(String response) {
    // Check response for authorization confirmation
    // Example: Parse JSON to check "status" field
    return response.contains('"status": "Accepted"');
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }
}

class StartChargingPage extends StatelessWidget {
  final StartChargingController controller = Get.put(StartChargingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Start Charging',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Obx(
        () => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Start a Charging Session",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter the details below to start charging:",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Connector ID",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => controller.connectorId.value = value,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "ID Tag",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => controller.idTag.value = value,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: controller.startCharging,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Start Charging"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
