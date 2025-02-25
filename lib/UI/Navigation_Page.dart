
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  // List of questions and answers related to navigation in Flutter
  final List<NavigationQuestion> navigationQuestions = [
    NavigationQuestion(
      question: "What is navigation in Flutter?",
      answer: "Navigation in Flutter refers to moving between different screens or pages in an app. It is typically done using the `Navigator` class.",
    ),
    NavigationQuestion(
      question: "How do you navigate between screens in Flutter?",
      answer: "You can navigate between screens using the `Navigator.push` method. For example: `Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));`.",
    ),
    NavigationQuestion(
      question: "How do you go back to the previous screen?",
      answer: "You can go back to the previous screen using the `Navigator.pop` method. For example: `Navigator.pop(context);`.",
    ),
    NavigationQuestion(
      question: "What is a `MaterialPageRoute`?",
      answer: "`MaterialPageRoute` is a class that defines a route for navigating to a new screen with Material Design transitions.",
    ),
    NavigationQuestion(
      question: "What is named routing in Flutter?",
      answer: "Named routing allows you to define routes in a central location (e.g., `routes` in `MaterialApp`) and navigate using route names instead of directly referencing the widget.",
    ),
    NavigationQuestion(
      question: "How do you pass data between screens?",
      answer: "You can pass data between screens by passing arguments to the `Navigator.push` method. For example: `Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(data: data)));`.",
    ),
    NavigationQuestion(
      question: "What is the `Navigator` class?",
      answer: "The `Navigator` class manages a stack of routes (screens) and provides methods for navigating between them, such as `push`, `pop`, and `pushReplacement`.",
    ),
    NavigationQuestion(
      question: "What is `pushReplacement` in Flutter?",
      answer: "`pushReplacement` replaces the current route with a new route. For example: `Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewScreen()));`.",
    ),

  ];

  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  List<NavigationQuestion> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = navigationQuestions; // Initialize with all questions
  }

  void _filterQuestions(String query) {
    setState(() {
      filteredQuestions = navigationQuestions
          .where((question) =>
          question.question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation in Flutter"),
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
class NavigationQuestion {
  final String question;
  final String answer;

  NavigationQuestion({required this.question, required this.answer});
}
