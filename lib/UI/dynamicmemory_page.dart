
import 'package:flutter/material.dart';

class DynamicMemoryAllocationPage extends StatefulWidget {
  const DynamicMemoryAllocationPage({super.key});

  @override
  State<DynamicMemoryAllocationPage> createState() => _DynamicMemoryAllocationPageState();
}

class _DynamicMemoryAllocationPageState extends State<DynamicMemoryAllocationPage> {
  // List of questions and answers related to dynamic memory allocation in C
  final List<PointerQuestion> pointerQuestions = [
    PointerQuestion(
      question: "What is dynamic memory allocation in C?",
      answer: "Dynamic memory allocation allows programs to allocate memory at runtime using functions like `malloc`, `calloc`, `realloc`, and `free`.",
    ),
    PointerQuestion(
      question: "What is the difference between `malloc` and `calloc`?",
      answer: "`malloc` allocates memory without initializing it, while `calloc` allocates memory and initializes it to zero.",
    ),
    PointerQuestion(
      question: "How do you allocate memory using `malloc`?",
      answer: "You can allocate memory using `malloc` like this: `int *ptr = (int*)malloc(sizeof(int));`.",
    ),
    PointerQuestion(
      question: "How do you allocate memory using `calloc`?",
      answer: "You can allocate memory using `calloc` like this: `int *ptr = (int*)calloc(5, sizeof(int));`. This allocates memory for 5 integers and initializes them to zero.",
    ),
    PointerQuestion(
      question: "What is `realloc` used for?",
      answer: "`realloc` is used to resize previously allocated memory. For example: `ptr = (int*)realloc(ptr, 10 * sizeof(int));`.",
    ),
    PointerQuestion(
      question: "How do you free dynamically allocated memory?",
      answer: "You use the `free` function to release dynamically allocated memory. For example: `free(ptr);`.",
    ),
    PointerQuestion(
      question: "What happens if you don't free dynamically allocated memory?",
      answer: "If you don't free dynamically allocated memory, it leads to memory leaks, which can cause your program to consume more and more memory over time.",
    ),

  ];

  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  List<PointerQuestion> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = pointerQuestions; // Initialize with all questions
  }

  void _filterQuestions(String query) {
    setState(() {
      filteredQuestions = pointerQuestions
          .where((question) =>
          question.question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Memory Allocation in C"),
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
class PointerQuestion {
  final String question;
  final String answer;

  PointerQuestion({required this.question, required this.answer});
}
