
import 'package:flutter/material.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  // List of questions and answers related to widgets in Flutter
  final List<WidgetQuestion> widgetQuestions = [
    WidgetQuestion(
      question: "What is a widget in Flutter?",
      answer: "A widget is the basic building block of a Flutter app. It describes what the UI should look like given its current configuration and state.",
    ),
    WidgetQuestion(
      question: "What is the difference between StatelessWidget and StatefulWidget?",
      answer: "A `StatelessWidget` is immutable, meaning its properties cannot change. A `StatefulWidget` is mutable and can change its state during runtime.",
    ),
    WidgetQuestion(
      question: "What is the `build` method in Flutter?",
      answer: "The `build` method is used to describe the part of the user interface represented by the widget. It is called whenever the widget needs to be rendered.",
    ),
    WidgetQuestion(
      question: "What is the `setState` method in Flutter?",
      answer: "The `setState` method is used to update the state of a `StatefulWidget`. It triggers a rebuild of the widget and its descendants.",
    ),
    WidgetQuestion(
      question: "What is the difference between `MaterialApp` and `CupertinoApp`?",
      answer: "`MaterialApp` follows the Material Design guidelines, while `CupertinoApp` follows the iOS design guidelines.",
    ),
    WidgetQuestion(
      question: "What is a `Scaffold` widget?",
      answer: "The `Scaffold` widget provides a framework for implementing the basic Material Design layout structure of an app.",
    ),
    WidgetQuestion(
      question: "What is the `Container` widget?",
      answer: "The `Container` widget is a convenience widget that combines common painting, positioning, and sizing widgets.",
    ),
    WidgetQuestion(
      question: "What is the `ListView` widget?",
      answer: "The `ListView` widget is used to display a scrollable list of children widgets.",
    ),
    WidgetQuestion(
      question: "What is the `Column` widget?",
      answer: "The `Column` widget displays its children in a vertical array.",
    ),
    WidgetQuestion(
      question: "What is the `Row` widget?",
      answer: "The `Row` widget displays its children in a horizontal array.",
    ),
  ];

  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  List<WidgetQuestion> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = widgetQuestions; // Initialize with all questions
  }

  void _filterQuestions(String query) {
    setState(() {
      filteredQuestions = widgetQuestions
          .where((question) =>
          question.question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets in Flutter"),
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
class WidgetQuestion {
  final String question;
  final String answer;

  WidgetQuestion({required this.question, required this.answer});
}
