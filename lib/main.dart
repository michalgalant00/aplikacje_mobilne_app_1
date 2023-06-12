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
      home: const MyHomePage(title: 'Aplikacja nr 1'),
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
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  int _sliderValue = 0;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _poziomController = TextEditingController();

  bool _isSliderEnabled = false;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _poziomController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            onChanged: () {
              setState(() {
                _isFormValid = _formKey.currentState!.validate();
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Center(
                      child: Image.network(
                        'https://mymodernmet.com/wp/wp-content/uploads/archive/Woz2XwujXPs2sO7TtUXN_Hedgehog3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Visibility(
                      visible: _isSliderEnabled,
                      child: Positioned(
                        top: 16.0,
                        left: 16.0,
                        child: Text(
                          '$_sliderValue',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'Wprowadź imię',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _scaffoldMessengerKey.currentState!.showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Proszę wprowadź imię',
                          ),
                        ),
                      );
                      return '';
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
                      _scaffoldMessengerKey.currentState!.showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Proszę wprowadź nazwisko',
                          ),
                        ),
                      );
                      return '';
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
                      _scaffoldMessengerKey.currentState!.showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Proszę wprowadź poziom',
                          ),
                        ),
                      );
                      return '';
                    }
                    int? intValue = int.tryParse(value);
                    if (intValue == null ||
                        intValue < 0 ||
                        intValue > 100 ||
                        intValue % 4 != 0) {
                      _scaffoldMessengerKey.currentState!.showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Proszę wprowadź liczbę całkowitą z zakresu 0-100, podzielną przez 4',
                          ),
                        ),
                      );
                      return '';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                Slider(
                  value: _sliderValue.toDouble(),
                  min: 0,
                  max: 100,
                  divisions: 25,
                  label: _sliderValue.round().toString(),
                  onChanged: _isSliderEnabled
                      ? (value) {
                    setState(() {
                      _sliderValue = value.round();
                      _poziomController.text = _sliderValue.toString();
                    });
                  }
                      : null,
                ),
                ElevatedButton(
                  onPressed: _isFormValid
                      ? () {
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
                      if (value != null) {
                        setState(() {
                          _sliderValue = value['sliderEnabled'] ? _sliderValue : 0;
                          _poziomController.text = _sliderValue.toString();
                          _isSliderEnabled = value['sliderEnabled'];
                        });
                      }
                    });
                  }
                      : null,
                  child: const Text('Zapisz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
