import "package:flutter/material.dart";
//import "package:flutter/rendering.dart";
//import "package:flutter/widgets.dart";

void main() {
  runApp(const ShoeApp());
}

class ShoeApp extends StatefulWidget {
  const ShoeApp({super.key});

  @override
  State createState() => _ShoeAppState();
}

class _ShoeAppState extends State {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: const [Icon(Icons.shopping_cart)],

          title: const Text(
            "shoes",
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.white,
          //Icon(Icons.)
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              "https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg",
              height: 250,
            ),
            const Text(
              "Nike Air Force1 ''07                                                          ",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 35, 11, 192))),
                  child: const Text(
                    "SHOE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 35, 11, 192))),
                  child: const Text("FOOTWEAR",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 150,
              width: 340,
              child: Text(
                "Part of the job of shoes is to absorb impact as we walk, but bad shoes (or no shoes) can throw the whole body out of alignment. If shoes don't have enough padding or don't allow for an even stride, pain is an almost inevitable side effect. The ankles, knees, hip joints and lower back are all affected by bad shoes.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Row(children: [
              const Text(
                "Quantity  ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              GestureDetector(
                  onTap: () {
                    if (count > 1) {
                      count--;
                      setState(() {});
                    }
                  },
                  child: const Icon(Icons.remove)),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Center(
                  child: Text("$count"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  count++;
                  setState(() {});
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 35, 11, 192))),
                child: const Text(
                  "purchase",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
