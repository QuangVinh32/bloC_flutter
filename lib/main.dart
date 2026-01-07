import 'package:blocflutter/page/welcome_page.dart';
import 'package:blocflutter/test/test_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocflutter/bloc/counter_bloc.dart';
import 'package:blocflutter/bloc/counter_event.dart';
import 'package:blocflutter/bloc/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Color Demo',
      debugShowCheckedModeBanner: false,
      // home: BlocProvider(
      //   create: (_) => CounterBloc(),
      //   child: const CounterPage(),
      // ),
      home: PostPage(),
      // home: const WelcomePage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('BloC => Counter + Color')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // BlocBuilder chỉ bao quanh Text
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.message ?? '${state.count}',
                  style: TextStyle(
                    fontSize: 50,
                    color: state.color,
                    fontWeight: state.fontWeight,
                    fontStyle: state.fontStyle,
                    fontFamily: state.fontFamily,
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Buttons increment / decrement
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => bloc.add(DecrementCounter()),
                  child: const Text('-'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => bloc.add(IncrementCounter()),
                  child: const Text('+'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Buttons đổi màu và font
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => bloc.add(ChangeColor(Colors.yellow)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Yellow'),
                ),
                ElevatedButton(
                  onPressed: () => bloc.add(ChangeColor(Colors.red)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Red'),
                ),
                ElevatedButton(
                  onPressed: () => bloc.add(ChangeColor(Colors.green)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Red'),
                ),
                ElevatedButton(
                  onPressed: () => bloc.add(ChangeColor(Colors.blue)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Blue'),
                ),
                ElevatedButton(
                  onPressed: () => bloc.add(
                    ChangeFontStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  child: const Text('Normal'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      bloc.add(ChangeFontStyle(fontStyle: FontStyle.italic)),
                  child: const Text('Italic'),
                ),

                ElevatedButton(
                  onPressed: () =>
                      bloc.add(ChangeFontStyle(fontWeight: FontWeight.bold)),
                  child: const Text('Bold'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      bloc.add(ChangeFontStyle(fontFamily: 'Arial')),
                  child: const Text('Arial'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      bloc.add(ChangeFontStyle(fontFamily: 'Georgia')),
                  child: const Text('Georgia'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      bloc.add(ChangeFontStyle(fontFamily: 'Times New Roman')),
                  child: const Text('Times New Roman'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
