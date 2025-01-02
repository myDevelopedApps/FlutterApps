import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_lifecycle/screen2.dart';

class WidgetLifecycle extends StatefulWidget {
  const WidgetLifecycle({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<WidgetLifecycle> createState() {
    log("in creataState()");
    return _WidgetLifecycleState();
  }
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  String str = "C2W";
  @override
  Widget build(BuildContext context) {
    log("In Build()");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Screen2(text: str),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                log("in setstate");
                str = (str == "C2W") ? "Core2Web" : "C2W";
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Screen2(text: str)));
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)),
            child: const Text("change Text"),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    log("In initState()");
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   log("In didChangeDependencies()");
  // }

  @override
  void deactivate() {
    super.deactivate();
    log("In deactive()");
  }

  @override
  void dispose() {
    super.dispose();
    log("In dispose()");
  }
}
