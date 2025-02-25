
import 'package:flutter/material.dart';

class StructuresUnionsPage extends StatefulWidget {
  const StructuresUnionsPage({super.key});

  @override
  State<StructuresUnionsPage> createState() => _StructuresUnionsPageState();
}

class _StructuresUnionsPageState extends State<StructuresUnionsPage> {
  // List of questions and answers related to structures and unions in C
  final List<StructuresUnionsQuestion> structuresUnionsQuestions = [
    StructuresUnionsQuestion(
      question: "What is a structure in C?",
      answer: "A structure is a user-defined data type that allows grouping variables of different data types under a single name.",
    ),
    StructuresUnionsQuestion(
      question: "How do you declare a structure in C?",
      answer: "You declare a structure using the `struct` keyword. For example: `struct Person { char name[50]; int age; };`.",
    ),
    StructuresUnionsQuestion(
      question: "What is the difference between a structure and an array?",
      answer: "An array stores elements of the same data type, while a structure can store elements of different data types.",
    ),
    StructuresUnionsQuestion(
      question: "How do you access structure members?",
      answer: "You access structure members using the dot operator (`.`). For example: `person.name` or `person.age`.",
    ),
    StructuresUnionsQuestion(
      question: "What is a union in C?",
      answer: "A union is a user-defined data type that allows storing different data types in the same memory location.",
    ),
    StructuresUnionsQuestion(
      question: "How do you declare a union in C?",
      answer: "You declare a union using the `union` keyword. For example: `union Data { int i; float f; char str[20]; };`.",
    ),
    StructuresUnionsQuestion(
      question: "What is the difference between a structure and a union?",
      answer: "In a structure, each member has its own memory location, while in a union, all members share the same memory location.",
    ),
    StructuresUnionsQuestion(
      question: "What is the size of a union?",
      answer: "The size of a union is equal to the size of its largest member.",
    ),
    StructuresUnionsQuestion(
      question: "Can a structure contain a union?",
      answer: "Yes, a structure can contain a union as one of its members.",
    ),
    StructuresUnionsQuestion(
      question: "Can a union contain a structure?",
      answer: "Yes, a union can contain a structure as one of its members.",
    ),
  ];

  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  List<StructuresUnionsQuestion> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = structuresUnionsQuestions; // Initialize with all questions
  }

  void _filterQuestions(String query) {
    setState(() {
      filteredQuestions = structuresUnionsQuestions
          .where((question) =>
          question.question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Structures and Unions in C"),
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
class StructuresUnionsQuestion {
  final String question;
  final String answer;

  StructuresUnionsQuestion({required this.question, required this.answer});
}
