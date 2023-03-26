import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/user_model.dart';
import '../../../core/providers/user_provider.dart';

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
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            const Text('Welcome to the School Management App Dashboard.',
                style: TextStyle(fontSize: 16.0)),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement attendance functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Take Attendance',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      Icon(Icons.check_circle),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement grade viewing functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('View Grades',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      Icon(Icons.grade),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement student adding functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Add Student',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      Icon(Icons.add),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement timetable viewing functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('View Timetable',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      Icon(Icons.schedule),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
