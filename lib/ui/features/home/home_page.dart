import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/user_provider.dart';
import '../../common_widgets/menu_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newUser = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Management App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Text('Hello ${newUser!.username},',
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            const Text('Welcome to the School Management App Dashboard.',
                style: TextStyle(fontSize: 16.0)),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MenuButton(
                  buttonText: "Classes",
                  icon: Icons.class_,
                  onPressed: () {},
                  backgroundColor: Colors.pinkAccent,
                ),
                const SizedBox(height: 16.0),
                MenuButton(
                  buttonText: "Attendance",
                  icon: Icons.check_circle,
                  onPressed: () {},
                  backgroundColor: Colors.green,
                ),
                const SizedBox(height: 16.0),
                MenuButton(
                  buttonText: "View Grades",
                  icon: Icons.grade,
                  onPressed: () {},
                  backgroundColor: Colors.orange,
                ),
                const SizedBox(height: 16.0),
                MenuButton(
                  buttonText: "Add Student",
                  icon: Icons.add,
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(height: 16.0),
                MenuButton(
                  buttonText: "Timetable'",
                  icon: Icons.schedule,
                  onPressed: () {},
                  backgroundColor: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
