import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<WidgetBuilder> _children = [
    (_) => const OngoingTasksView(),
    (_) => const CompletedTasksView(),
  ];

  int _currentViewIndex = 0;

  void onViewChanged(int newViewIndex) {
    setState(() => _currentViewIndex = newViewIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Todo')),
      body: _children[_currentViewIndex](context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentViewIndex,
        onDestinationSelected: onViewChanged,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.pending_actions),
            label: 'Ongoing Tasks',
          ),
          NavigationDestination(
            icon: Icon(Icons.task_outlined),
            label: 'Completed Tasks',
          ),
        ],
      ),
    );
  }
}

class OngoingTasksView extends StatelessWidget {
  const OngoingTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Completed'),
    );
  }
}

class CompletedTasksView extends StatelessWidget {
  const CompletedTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Completed'),
    );
  }
}
