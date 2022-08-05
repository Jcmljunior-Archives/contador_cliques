import 'package:flutter/material.dart';
import 'package:primeiro_app/shared/containers/home_container.dart';

import '../container.dart';
import '../../features/counter/controller/counter_controller.dart';
import '../../features/counter/model/counter_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeContainer _controller = container<HomeContainer>();

  @override
  void initState() {
    container<CounterController>().addListener(update);

    super.initState();
  }

  @override
  void dispose() {
    container<CounterController>().removeListener(update);

    super.dispose();
  }

  update() => setState(() => {});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: container.allReady(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Primeiro App'),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: _controller.counter.values.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                      'Id: ${_controller.counter.values.elementAt(index).id}'),
                                  Text(
                                      'Valor: ${_controller.counter.values.elementAt(index).value}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () =>
                                _controller.counter.incrementByIndex(index),
                            child: const Icon(Icons.add),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          ElevatedButton(
                            onPressed: _controller.counter.values
                                        .elementAt(index)
                                        .value <
                                    1
                                ? null
                                : () =>
                                    _controller.counter.decrementByIndex(index),
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _controller.counter.remove(
                                  _controller.counter.values.elementAt(index));
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Theme.of(context).errorColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _controller.counter.add(
                  CounterModel(
                    id: _controller.counter.values.isEmpty
                        ? 1
                        : _controller.counter.values.last.id + 1,
                    value: 0,
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
            ],
          );
        }
      },
    );
  }
}
