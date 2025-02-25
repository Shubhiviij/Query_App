
import 'package:flutter/material.dart';
import 'package:queryapp_revised/UI/FileHandling_Page.dart';
import 'package:queryapp_revised/UI/Navigation_Page.dart';
import 'package:queryapp_revised/UI/Pointers.dart';
import 'package:queryapp_revised/UI/Q&A_Page.dart';
import 'package:queryapp_revised/UI/Responsivedesign_Page.dart';
import 'package:queryapp_revised/UI/Statemanagement_Page.dart';
import 'package:queryapp_revised/UI/StructureUnions_Page.dart';
import 'package:queryapp_revised/UI/dynamicmemory_page.dart';

import 'Widgets_Page.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  // List of topics
  final List<String> topics = [
    "Pointers in C",
    "Dynamic Memory Allocation in C",
    "Structures and Unions in C",
    "File Handling in C",
    "Widgets in Flutter",
    "State Management in Flutter",
    "Navigation in Flutter",
    "Responsive Design in Flutter",
  ];

  // Function to handle navigation based on the topic
  void _navigateToTopicPage(BuildContext context, String topic) {
    switch (topic) {
      case "Pointers in C":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PointersPage()),
        );
        break;
      case "Dynamic Memory Allocation in C":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DynamicMemoryAllocationPage()),
        );
        break;
      case "Structures and Unions in C":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StructuresUnionsPage()),
        );
        break;
      case "File Handling in C":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const FileHandlingPage()),
        );
        break;
      case "Widgets in Flutter":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WidgetsPage()),
        );
        break;
      case "State Management in Flutter":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StateManagementPage()),
        );
        break;
      case "Navigation in Flutter":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavigationPage()),
        );
        break;
      case "Responsive Design in Flutter":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResponsiveDesignPage()),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No page found for this topic')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Topics"),
        actions: [
          // Q&A Button
          IconButton(
            icon: const Icon(Icons.question_answer),
            onPressed: () {
              // Navigate to the Q&A page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Q_A()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the corresponding topic page
              _navigateToTopicPage(context, topics[index]);
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        topics[index],
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
