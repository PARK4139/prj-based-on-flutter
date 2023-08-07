import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'WigetTreeCommunicationHelper.dart';
 void main() {
  // Bloc.observer = CounterObserver();//BlocObserver를 사용위한 코드, flutter_bloc 사용을 위한 필수코드는 아님
   runApp(const ScreenCommunicator());
}


/*bloc 을 사용하는데 있어 cubit 을 사용하는 방법*/
// 상태관리에 이 방법이 가장 마음에 든다.
// 한동안 수준이 더 향상되기 전까지는 이것만 쓸 것 같다.

class ScreenCommunicator extends StatelessWidget {
  const ScreenCommunicator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: /*BloC 구현 컨테이너*/ BlocProvider(
        create: (context) => ScreenCubit(),
        child: ScreenSubmitFormSub(),
      ),
    );
  }
}

class ScreenSubmitFormSub extends StatelessWidget {
  ScreenSubmitFormSub({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();

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
                  controller: countryController,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    /*상태데이터 저장*/
                    BlocProvider.of<ScreenCubit>(context).generateScreenState(
                      name: nameController.text,
                      country: countryController.text,
                    );
                  },
                  child: const Text('상태데이터 저장'),
                ),
                ElevatedButton(
                  onPressed: () {
                    /*비지니스 로직 수행*/
                    BlocProvider.of<ScreenCubit>(context).increaseCount();
                  },
                  child: const Text('.increaseCount() 비지니스 로직 수행'),
                ),
                ElevatedButton(
                  onPressed: () {
                    /*비지니스 로직 수행*/
                    BlocProvider.of<ScreenCubit>(context).resetScreenState();
                  },
                  child: const Text('.resetScreenState() 비지니스 로직 수행'),
                ),

                /*상태데이터 가져와서 화면 뿌리기 *///이제 다른 wiget 에서도 상태를 손 쉽게 가져올 수 있어!
                BlocBuilder<ScreenCubit, ScreenState>(
                  builder: (context, ScreenState state) {
                    return Column(
                      children: [
                        Text('name : ${state.name}'),
                        Text('country : ${state.country}'),
                        Text('count : ${state.count}'),
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
