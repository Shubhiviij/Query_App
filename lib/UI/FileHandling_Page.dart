
import 'package:flutter/material.dart';

class FileHandlingPage extends StatefulWidget {
  const FileHandlingPage({super.key});

  @override
  State<FileHandlingPage> createState() => _FileHandlingPageState();
}

class _FileHandlingPageState extends State<FileHandlingPage> {
  // List of questions and answers related to file handling in C
  final List<FileHandlingQuestion> fileHandlingQuestions = [
    FileHandlingQuestion(
      question: "What is file handling in C?",
      answer: "File handling in C allows programs to read from and write to files. It involves functions like `fopen`, `fclose`, `fread`, `fwrite`, and `fseek`.",
    ),
    FileHandlingQuestion(
      question: "How do you open a file in C?",
      answer: "You open a file using the `fopen` function. For example: `FILE *file = fopen('example.txt', 'r');`.",
    ),
    FileHandlingQuestion(
      question: "What are the different modes for opening a file?",
      answer: "Common modes include 'r' (read), 'w' (write), 'a' (append), 'r+' (read and write), 'w+' (write and read), and 'a+' (append and read).",
    ),
    FileHandlingQuestion(
      question: "How do you close a file in C?",
      answer: "You close a file using the `fclose` function. For example: `fclose(file);`.",
    ),
    FileHandlingQuestion(
      question: "How do you read from a file in C?",
      answer: "You can read from a file using functions like `fscanf`, `fgets`, or `fread`. For example: `fgets(buffer, 100, file);`.",
    ),
    FileHandlingQuestion(
      question: "How do you write to a file in C?",
      answer: "You can write to a file using functions like `fprintf`, `fputs`, or `fwrite`. For example: `fprintf(file, 'Hello, World!');`.",
    ),
    FileHandlingQuestion(
      question: "What is the difference between `fgets` and `fscanf`?",
      answer: "`fgets` reads a line of text from a file, while `fscanf` reads formatted input (e.g., integers, floats, strings).",
    ),
    FileHandlingQuestion(
      question: "How do you check if a file exists in C?",
      answer: "You can check if a file exists by attempting to open it in read mode. If `fopen` returns `NULL`, the file does not exist.",
    ),

  ];

  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  List<FileHandlingQuestion> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = fileHandlingQuestions; // Initialize with all questions
  }

  void _filterQuestions(String query) {
    setState(() {
      filteredQuestions = fileHandlingQuestions
          .where((question) =>
          question.question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Handling in C"),
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
class FileHandlingQuestion {
  final String question;
  final String answer;

  FileHandlingQuestion({required this.question, required this.answer});
}
