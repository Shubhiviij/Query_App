
import 'package:flutter/material.dart';

class StateManagementPage extends StatefulWidget {
  const StateManagementPage({super.key});

  @override
  State<StateManagementPage> createState() => _StateManagementPageState();
}

class _StateManagementPageState extends State<StateManagementPage> {
  // List of questions and answers related to state management in Flutter
  final List<StateManagementQuestion> stateManagementQuestions = [
    StateManagementQuestion(
      question: "What is state management in Flutter?",
      answer: "State management refers to how you manage and share the state (data) of your app across different widgets and screens.",
    ),
    StateManagementQuestion(
      question: "What is the difference between ephemeral state and app state?",
      answer: "Ephemeral state is local to a single widget (e.g., `setState`), while app state is shared across multiple widgets or screens (e.g., using providers or Bloc).",
    ),
    StateManagementQuestion(
      question: "What is `setState` in Flutter?",
      answer: "`setState` is a method used to update the state of a `StatefulWidget`. It triggers a rebuild of the widget and its descendants.",
    ),
    StateManagementQuestion(
      question: "What is the Provider package?",
      answer: "The Provider package is a state management solution that allows you to share and manage state across your app using the `InheritedWidget` mechanism.",
    ),
    StateManagementQuestion(
      question: "What is the Bloc pattern?",
      answer: "The Bloc (Business Logic Component) pattern separates business logic from the UI, making your app more predictable and testable.",
    ),
    StateManagementQuestion(
      question: "What is Riverpod?",
      answer: "Riverpod is a state management library that improves upon the Provider package by offering better compile-time safety and flexibility.",
    ),
    StateManagementQuestion(
      question: "What is Redux in Flutter?",
      answer: "Redux is a state management pattern that uses a single global store to manage the state of the entire app.",
    ),
    StateManagementQuestion(
      question: "What is the difference between Provider and Riverpod?",
      answer: "Riverpod is a more modern and flexible alternative to Provider, with better compile-time safety and no dependency on the widget tree.",
    ),

  ];

  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  List<StateManagementQuestion> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = stateManagementQuestions; // Initialize with all questions
  }

  void _filterQuestions(String query) {
    setState(() {
      filteredQuestions = stateManagementQuestions
          .where((question) =>
          question.question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management in Flutter"),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search questions...",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _filterQuestions("");
                  },
                ),
              ),
              onChanged: _filterQuestions,
            ),
          ),
          // List of Questions and Answers
          Expanded(
            child: ListView.builder(
              itemCount: filteredQuestions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ExpansionTile(
                    title: Text(
                      filteredQuestions[index].question,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          filteredQuestions[index].answer,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Model for questions and answers
class StateManagementQuestion {
  final String question;
  final String answer;

  StateManagementQuestion({required this.question, required this.answer});
}
