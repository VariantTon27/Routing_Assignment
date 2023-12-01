import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _yourName = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _yourName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("firstPageScaffoldKey"),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 172, 64, 57),
        title: Text("First Page"),
        centerTitle: true,
        leading: const Icon(Icons.code),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 76, 146, 204),
              Colors.green
            ], // Set your gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _yourName,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: ('Type Your Name'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SecondPage(name: _yourName.text),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 32, 39, 46),
                  ),
                  child: Text("Proceed"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  String? name;
  SecondPage({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Second Page"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 19, 70, 117),
              Color.fromARGB(255, 204, 163, 76)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              "Good day, $name!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24, // Adjusted font size
                color: Colors.white,
                height: 10, // Adjusted text color
              ),
            ),
            const SizedBox(height: 180), // Adjusted height
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 32, 39, 46),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15), // Adjusted height
                child: Text(
                  "Go Back",
                  style: TextStyle(
                    fontSize: 10, // Adjusted font size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
