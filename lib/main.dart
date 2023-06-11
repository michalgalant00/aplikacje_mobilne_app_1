import 'package:flutter/material.dart';
import 'second-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) => const MyHomePage(title: 'Aplikacja nr 1'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sliderValue = 0.0;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _poziomController = TextEditingController();

  bool _isSliderEnabled = false;

  @override
  void initState() {
    super.initState();
    _poziomController.text = _sliderValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  'https://mymodernmet.com/wp/wp-content/uploads/archive/Woz2XwujXPs2sO7TtUXN_Hedgehog3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  hintText: 'Wprowadź imię',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę wprowadź imię';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  hintText: 'Wprowadź nazwisko',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę wprowadź nazwisko';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _poziomController,
                decoration: const InputDecoration(
                  hintText: 'Wprowadź poziom',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę wprowadź poziom';
                  }
                  return null;
                },
                // enabled: _isSliderEnabled,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = double.parse(value);
                  });
                },
              ),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 25,
                label: _sliderValue.round().toString(),
                onChanged: _isSliderEnabled
                    ? (double value) {
                  setState(() {
                    _sliderValue = value;
                    _poziomController.text = _sliderValue.toString();
                  });
                }
                    : null,
              ),
              Text(
                'Poziom: ${_sliderValue.round()}',
                style: const TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          sliderValue: _sliderValue,
                        ),
                      ),
                    ).then((value) {
                      setState(() {
                        _isSliderEnabled = true;
                      });
                    });
                  }
                },
                child: const Text('Zapisz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
