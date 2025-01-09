import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigurationController extends GetxController {
  var configurations = <Map<String, dynamic>>[].obs;
  var selectedKey = ''.obs;
  var newValue = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDummyConfigurations(); // Load dummy data
  }

  void fetchDummyConfigurations() {
    // Dummy configuration data
    configurations.value = [
      {"key": "HeartbeatInterval", "value": "60", "readOnly": false},
      {"key": "ConnectionTimeout", "value": "30", "readOnly": false},
      {"key": "MeterValueSampleInterval", "value": "5", "readOnly": false},
      {"key": "FirmwareVersion", "value": "1.2.3", "readOnly": true},
    ];
  }

  void updateConfiguration() {
    if (selectedKey.isEmpty || newValue.isEmpty) {
      Get.snackbar(
        "Error",
        "Please select a key and enter a new value.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    // Update the value locally
    final index = configurations.indexWhere((config) => config['key'] == selectedKey.value);
    if (index != -1) {
      configurations[index]['value'] = newValue.value;
      Get.snackbar(
        "Success",
        "Configuration updated for key: ${selectedKey.value}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}

class ConfigurationPage extends StatelessWidget {
  final ConfigurationController controller = Get.put(ConfigurationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configuration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Current Configurations",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.configurations.length,
                  itemBuilder: (context, index) {
                    final config = controller.configurations[index];
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        title: Text(config['key']),
                        subtitle: Text("Value: ${config['value']}"),
                        trailing: config['readOnly']
                            ? const Text("Read-Only",
                                style: TextStyle(color: Colors.grey))
                            : IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  controller.selectedKey.value = config['key'];
                                  showDialog(
                                    context: context,
                                    builder: (_) =>
                                        _buildEditDialog(context, controller),
                                  );
                                },
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditDialog(
      BuildContext context, ConfigurationController controller) {
    return AlertDialog(
      title: Text("Edit Configuration: ${controller.selectedKey.value}"),
      content: TextField(
        decoration: const InputDecoration(
          labelText: "New Value",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) => controller.newValue.value = value,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            controller.updateConfiguration();
            Navigator.of(context).pop();
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
