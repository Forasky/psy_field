import 'package:flutter/material.dart';

class GetOrderScreen extends StatefulWidget {
  const GetOrderScreen({super.key});

  @override
  State<GetOrderScreen> createState() => _GetOrderScreenState();
}

class _GetOrderScreenState extends State<GetOrderScreen> {
  final ValueNotifier<int> step = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: step,
          builder: (context, stepValue, child) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatusBar(step: stepValue),
                  const SizedBox(height: 100),
                  CustomForm(step: stepValue),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (stepValue > 0)
                        ElevatedButton.icon(
                          onPressed: () => setState(() => step.value--),
                          label: const Text('Назад'),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      const SizedBox(width: 20),
                      if (stepValue < 4)
                        ElevatedButton.icon(
                          onPressed: () => setState(() => step.value++),
                          label: const Text('Далее'),
                          icon: const Icon(Icons.arrow_forward),
                        )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

class StatusBar extends StatefulWidget {
  final int step;
  const StatusBar({required this.step, super.key});

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1',
                  style: TextStyle(
                    fontSize: 22,
                    color: widget.step >= 0 ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  'Выберите услугу',
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.step >= 0 ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 200,
                  height: 20,
                  color: widget.step >= 0 ? Colors.black : Colors.grey,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 22,
                    color: widget.step >= 1 ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  'Введите данные',
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.step >= 1 ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 200,
                  height: 20,
                  color: widget.step >= 1 ? Colors.black : Colors.grey,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3',
                  style: TextStyle(
                    fontSize: 22,
                    color: widget.step >= 2 ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  'Выберите дату',
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.step >= 2 ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 200,
                  height: 20,
                  color: widget.step >= 2 ? Colors.black : Colors.grey,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '4',
                  style: TextStyle(
                    fontSize: 22,
                    color: widget.step >= 3 ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  'Выберите время',
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.step >= 3 ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 200,
                  height: 20,
                  color: widget.step >= 3 ? Colors.black : Colors.grey,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CustomForm extends StatefulWidget {
  final int step;
  const CustomForm({required this.step, super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width / 2,
      duration: const Duration(milliseconds: 500),
      child: widget.step == 0
          ? const ChooseProcedure()
          : widget.step == 1
              ? const EnterCredits()
              : widget.step == 2
                  ? const ChooseDate()
                  : widget.step == 3
                      ? const ChooseTime()
                      : const SizedBox(),
    );
  }
}

class ChooseProcedure extends StatefulWidget {
  const ChooseProcedure({super.key});

  @override
  State<ChooseProcedure> createState() => _ChooseProcedureState();
}

class _ChooseProcedureState extends State<ChooseProcedure> {
  List<int> choosed = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CheckboxListTile(
          value: choosed.contains(0),
          onChanged: (value) {
            if (choosed.contains(0)) {
              choosed.remove(0);
            } else {
              choosed.add(0);
            }
            setState(() {});
          },
          title: const Text('Вылечить кукуху'),
        ),
        CheckboxListTile(
          value: choosed.contains(1),
          onChanged: (value) {
            if (choosed.contains(1)) {
              choosed.remove(1);
            } else {
              choosed.add(1);
            }
            setState(() {});
          },
          title: const Text('Проверить жопу'),
        ),
        CheckboxListTile(
          value: choosed.contains(2),
          onChanged: (value) {
            if (choosed.contains(2)) {
              choosed.remove(2);
            } else {
              choosed.add(2);
            }
            setState(() {});
          },
          title: const Text('Посмотреть мои мемы про котов'),
        ),
        CheckboxListTile(
          value: choosed.contains(3),
          onChanged: (value) {
            if (choosed.contains(3)) {
              choosed.remove(3);
            } else {
              choosed.add(3);
            }
            setState(() {});
          },
          title: const Text('Обсудить бывшего'),
        ),
      ],
    );
  }
}

class EnterCredits extends StatefulWidget {
  const EnterCredits({super.key});

  @override
  State<EnterCredits> createState() => _EnterCreditsState();
}

class _EnterCreditsState extends State<EnterCredits> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        TextField(
          decoration: InputDecoration(hintText: 'Имя введи свое'),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: 'А теперь фамилию'),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: 'Номерок блатной нужен'),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(hintText: 'Инсту кинь тож свою'),
        ),
      ],
    );
  }
}

class ChooseDate extends StatefulWidget {
  const ChooseDate({super.key});

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 30)));
  }
}

class ChooseTime extends StatefulWidget {
  const ChooseTime({super.key});

  @override
  State<ChooseTime> createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  @override
  Widget build(BuildContext context) {
    return TimePickerDialog(initialTime: TimeOfDay.now());
  }
}
