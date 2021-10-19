import 'package:flutter/material.dart';
import 'package:gel_converter/logic/metric_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _enteredAmount = 0;
  String? _toCurrency;
  String? _toLinear1;
  String? _toLinear2;

  double _convertedAmount = 0;
  FocusNode _focusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  final List<String> _linearParameters = [
    'sm',
    'm',
    'km',
  ];

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _focusNode.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Metrics Converter',
            style: TextStyle(fontSize: 26, color: Colors.blue),
          ),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'Number:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 50,
                  width: 140,
                  child: Center(
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _textEditingController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.blue,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          var amount = double.tryParse(text);
                          if (amount != null) {
                            _enteredAmount = amount;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: 340,
                      width: 340,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(180),
                            topRight: Radius.circular(180),
                            bottomLeft: Radius.circular(180),
                            bottomRight: Radius.circular(180),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'From:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 28),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                width: 100,
                                height: 50,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    selectedItemBuilder: (_) =>
                                        _linearParameters
                                            .map((e) => Center(child: Text(e)))
                                            .toList(),
                                    iconEnabledColor: Colors.blue,
                                    value: _toLinear1,
                                    borderRadius: BorderRadius.circular(35),
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 24),
                                    items: _linearParameters
                                        .map(
                                          (linear) => DropdownMenuItem<String>(
                                            value: linear,
                                            child: Text(
                                              linear,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        _toLinear1 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 26),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                '     To:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 28),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                width: 100,
                                height: 50,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    selectedItemBuilder: (_) =>
                                        _linearParameters
                                            .map((e) => Center(child: Text(e)))
                                            .toList(),
                                    iconEnabledColor: Colors.blue,
                                    value: _toLinear2,
                                    borderRadius: BorderRadius.circular(35),
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 24),
                                    items: _linearParameters
                                        .map(
                                          (linear2) => DropdownMenuItem<String>(
                                            value: linear2,
                                            child: Text(
                                              linear2,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        _toLinear2 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'Result',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Container(
                  height: 45,
                  width: 130,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(180),
                        topRight: Radius.circular(180),
                        bottomLeft: Radius.circular(180),
                        bottomRight: Radius.circular(180),
                      )),
                  // alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "$_convertedAmount",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                        ),
                      ),
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shadowColor: Colors.blue,
                        ),
                        onPressed: () {
                          if (_toLinear1 == null || _toLinear2 == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please choose the metrics!'),
                              ),
                            );
                          } else {
                            setState(() {
                              _convertedAmount = MetricHelper().convertTo(
                                  _enteredAmount, _toLinear1, _toLinear2);
                            });
                          }
                        },
                        child: const Text(
                          'CONVERSION',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                        ),
                      ),
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shadowColor: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            _focusNode.unfocus();
                            _textEditingController.clear();
                            _enteredAmount = 0;
                            _toLinear1 = null;
                            _toLinear2 = null;
                            _convertedAmount = 0;
                          });
                        },
                        child: const Text(
                          'RESET',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ])
          ],
        )),
      ),
    );
  }
}
