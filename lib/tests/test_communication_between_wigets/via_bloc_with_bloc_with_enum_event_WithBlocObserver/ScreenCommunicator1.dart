import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ScreenCommunicator2.dart';
import 'WigetTreeCommunicationHelper.dart';


void main() {
  // Bloc.observer = CounterObserver();//BlocObserver를 사용위한 코드, flutter_bloc 사용을 위한 필수코드는 아님
  runApp(const ScreenCommunicator1());
}


class ScreenCommunicator1 extends StatelessWidget {
  const ScreenCommunicator1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  /*BloC 구현 컨테이너*/BlocProvider(
        create: (context) => CounterBloc(),
        child: ScreenStateSenderSub(),
      ),
    );
  }
}

class ScreenStateSenderSub extends StatelessWidget {
  ScreenStateSenderSub({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'name'),
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                ElevatedButton(
                  onPressed: () {
                    /*상태데이터 저장하며, setState() 되는 듯한*/
                    BlocProvider.of<CounterBloc>(context).add(
                      CounterEvent.increment,
                    );
                  },
                  child: const Text('CounterEvent.increment, 상태데이터 저장'),
                ),

                ElevatedButton(
                  onPressed: () {
                    /*상태데이터 저장하며, setState() 되는 듯한*/
                    BlocProvider.of<CounterBloc>(context).add(
                      CounterEvent.decrement,
                    );
                  },
                  child: const Text('CounterEvent.decrement, 상태데이터 저장'),
                ),

                ElevatedButton(
                  onPressed: () {
                    /*상태데이터 저장하며, setState() 되는 듯한*/
                    BlocProvider.of<CounterBloc>(context).add(
                      CounterEvent.reset,
                    );
                  },
                  child: const Text('CounterEvent.reset, 상태데이터 저장'),
                ),


                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenCommunicator2()));
                  },
                  child: const Text('Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenStateTaker()));'),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
