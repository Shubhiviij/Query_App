
import 'package:flutter/material.dart';

class Q_A extends StatefulWidget {
  const Q_A({super.key});

  @override
  State<Q_A> createState() => _Q_AState();
}

class _Q_AState extends State<Q_A> {
  // Empty list of questions and answers
  final List<Map<String, String>> qaList = [];

  // Controller for the text input
  final TextEditingController _questionController = TextEditingController();

  // Function to handle question submission
  void _submitQuestion() {
    final String question = _questionController.text.trim();
    if (question.isNotEmpty) {
      setState(() {
        qaList.add({"question": question, "answer": "Answer pending..."});
      });
      _questionController.clear(); // Clear the textbox
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q&A"),
      ),
      body: Column(
        children: [
          // Textbox and Submit Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Larger Textbox
                TextField(
                  controller: _questionController,
                  maxLines: 5, // Increase the size of the textbox
                  decoration: const InputDecoration(
                    hintText: "Enter your question...",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16.0), // Add padding inside the textbox
                  ),
                ),
                const SizedBox(height: 16),
                // Submit Button
                ElevatedButton(
                  onPressed: _submitQuestion,
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
          // List of Questions and Answers
          Expanded(
            child: ListView.builder(
              itemCount: qaList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ExpansionTile(
                    title: Text(
                      qaList[index]["question"]!,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          qaList[index]["answer"]!,
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
