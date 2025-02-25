
import 'package:flutter/material.dart';

class ResponsiveDesignPage extends StatefulWidget {
  const ResponsiveDesignPage({super.key});

  @override
  State<ResponsiveDesignPage> createState() => _ResponsiveDesignPageState();
}

class _ResponsiveDesignPageState extends State<ResponsiveDesignPage> {
  // List of questions and answers related to responsive design in Flutter
  final List<ResponsiveDesignQuestion> responsiveDesignQuestions = [
    ResponsiveDesignQuestion(
      question: "What is responsive design in Flutter?",
      answer: "Responsive design in Flutter refers to creating layouts that adapt to different screen sizes and orientations, ensuring a consistent user experience across devices.",
    ),
    ResponsiveDesignQuestion(
      question: "What is the `MediaQuery` class?",
      answer: "`MediaQuery` provides information about the current device's screen size, orientation, and other properties. It is commonly used to create responsive layouts.",
    ),
    ResponsiveDesignQuestion(
      question: "What is the `LayoutBuilder` widget?",
      answer: "The `LayoutBuilder` widget provides the constraints of its parent widget, allowing you to create layouts that adapt to the available space.",
    ),
    ResponsiveDesignQuestion(
      question: "What is the `Flexible` widget?",
      answer: "The `Flexible` widget allows its child to expand or shrink to fill the available space within a `Row` or `Column`.",
    ),
    ResponsiveDesignQuestion(
      question: "What is the `Expanded` widget?",
      answer: "The `Expanded` widget is a type of `Flexible` widget that forces its child to fill the available space in a `Row` or `Column`.",
    ),
    ResponsiveDesignQuestion(
      question: "What is the `AspectRatio` widget?",
      answer: "The `AspectRatio` widget enforces a specific aspect ratio for its child, ensuring the child maintains a consistent width-to-height ratio.",
    ),
    ResponsiveDesignQuestion(
      question: "What is the `OrientationBuilder` widget?",
      answer: "The `OrientationBuilder` widget provides the current orientation (portrait or landscape) of the device, allowing you to adjust the layout accordingly.",
    ),
    ResponsiveDesignQuestion(
      question: "What is the `FractionallySizedBox` widget?",
      answer: "The `FractionallySizedBox` widget sizes its child relative to the available space, using fractions of the parent's width and height.",
    ),

  ];

  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  List<ResponsiveDesignQuestion> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = responsiveDesignQuestions; // Initialize with all questions
  }

  void _filterQuestions(String query) {
    setState(() {
      filteredQuestions = responsiveDesignQuestions
          .where((question) =>
          question.question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Design in Flutter"),
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
class ResponsiveDesignQuestion {
  final String question;
  final String answer;

  ResponsiveDesignQuestion({required this.question, required this.answer});
}
