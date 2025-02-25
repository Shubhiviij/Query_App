
import 'package:flutter/material.dart';

class PointersPage extends StatefulWidget {
  const PointersPage({super.key});

  @override
  State<PointersPage> createState() => _PointersPageState();
}

class _PointersPageState extends State<PointersPage> {
  // List of questions and answers related to pointers in C
  final List<PointerQuestion> pointerQuestions = [
    PointerQuestion(
      question: "What is a pointer in C?",
      answer: "A pointer is a variable that stores the memory address of another variable. It allows direct access to memory locations.",
    ),
    PointerQuestion(
      question: "How do you declare a pointer in C?",
      answer: "You declare a pointer using the syntax: `int *ptr;`. Here, `ptr` is a pointer to an integer.",
    ),
    PointerQuestion(
      question: "What is the difference between `*ptr` and `&var`?",
      answer: "`*ptr` dereferences the pointer to access the value at the memory address it points to. `&var` returns the memory address of the variable `var`.",
    ),
    PointerQuestion(
      question: "What is a null pointer?",
      answer: "A null pointer is a pointer that does not point to any memory location. It is initialized with `NULL` or `0`.",
    ),
    PointerQuestion(
      question: "What is a dangling pointer?",
      answer: "A dangling pointer is a pointer that points to a memory location that has been freed or deleted. Accessing such pointers can cause undefined behavior.",
    ),
    PointerQuestion(
      question: "What is pointer arithmetic?",
      answer: "Pointer arithmetic involves performing arithmetic operations (like addition, subtraction) on pointers. For example, `ptr++` moves the pointer to the next memory location.",
    ),
    PointerQuestion(
      question: "What is a pointer to a pointer?",
      answer: "A pointer to a pointer is a variable that stores the address of another pointer. It is declared as `int **pptr;`.",
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
        title: const Text("Pointers in C"),
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
