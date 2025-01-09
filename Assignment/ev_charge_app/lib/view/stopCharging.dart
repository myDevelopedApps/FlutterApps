import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StopChargingController extends GetxController {
  final WebSocketChannel channel =
      WebSocketChannel.connect(Uri.parse('ws://your-central-system-url'));

  var transactionId = ''.obs;
  var isLoading = false.obs;

  void stopCharging() async {
    if (transactionId.isEmpty) {
      Get.snackbar(
        "Error",
        "Please provide a Transaction ID",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      // Send StopTransaction.req to the Central System
      channel.sink.add(_buildStopTransactionRequest());

      // Listen for StopTransaction.conf response
      channel.stream.listen((response) {
        if (_isStopTransactionSuccess(response)) {
          Get.snackbar(
            "Success",
            "Charging stopped for Transaction ID: ${transactionId.value}",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            "Failed to stop charging for Transaction ID: ${transactionId.value}",
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

  String _buildStopTransactionRequest() {
    return '''
    {
      "messageType": "StopTransaction",
      "transactionId": "${transactionId.value}",
      "meterStop": 1000,
      "timestamp": "${DateTime.now().toIso8601String()}",
      "reason": "Local"
    }
    ''';
  }

  bool _isStopTransactionSuccess(String response) {
    // Check response for success confirmation
    return response.contains('"status": "Accepted"');
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }
}

class StopChargingPage extends StatelessWidget {
  final StopChargingController controller = Get.put(StopChargingController());

 StopChargingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stop Charging',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
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
                    "Stop a Charging Session",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter the Transaction ID to stop charging:",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Transaction ID",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => controller.transactionId.value = value,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.stopCharging,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text("Stop Charging"),
                    ),
                  ),
                ],
              ),
            ),
            if (controller.isLoading.value)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
