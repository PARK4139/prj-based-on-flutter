import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'WigetTreeCommunicationHelper.dart';




void main() {
  // Bloc.observer = CounterObserver();//BlocObserver를 사용위한 코드, flutter_bloc 사용을 위한 필수코드는 아님
  runApp(const ScreenSubmitForm());
}



class ScreenSubmitForm extends StatelessWidget {
  const ScreenSubmitForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  /*BloC 구현 컨테이너*/BlocProvider(
        create: (context) => ScreenBloc(),
        child: ScreenSubmitFormSub(),
      ),
    );
  }
}

class ScreenSubmitFormSub extends StatelessWidget {
  ScreenSubmitFormSub({super.key});

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
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    /*상태데이터 저장하며, setState() 되는 듯한*/
                    BlocProvider.of<ScreenBloc>(context).add(
                      CreateScreenEvent(
                        name: nameController.text,
                        age: ageController.text,
                      ),
                    );
                  },
                  child: const Text('CreateScreenEvent'),
                ),
                /*상태데이터 가져와서 화면 뿌리기 */
                BlocBuilder<ScreenBloc, ScreenState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Text('name : ${state.name}'),
                        Text('Age : ${state.country}'),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
