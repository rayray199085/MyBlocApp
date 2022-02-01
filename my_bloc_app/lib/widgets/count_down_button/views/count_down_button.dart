import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_app/widgets/count_down_button/bloc/count_down_button_cubit.dart';

class CountDownButton extends StatelessWidget {
  const CountDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountDownButtonCubit(),
      child: const CountDownView(),
    );
  }
}

class CountDownView extends StatelessWidget {
  const CountDownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountDownButtonCubit, CountDownButtonState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => state.status != CountDownStatus.inProgress
              ? context.read<CountDownButtonCubit>().startCounting()
              : null,
          child: Column(
            children: [
              if (state.status == CountDownStatus.initialized)
                const Text('Send')
              else if (state.status == CountDownStatus.inProgress)
                Text('${state.count}s')
              else if (state.status == CountDownStatus.completed)
                const Text('Resend')
            ],
          ),
        );
      },
    );
  }
}
