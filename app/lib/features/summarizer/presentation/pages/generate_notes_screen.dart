import 'package:flutter/material.dart';

class GenerateNotesScreen extends StatelessWidget {
  const GenerateNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "AI-Powered Notes",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TOP ICON
            Container(
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFB57CFF), Color(0xFF6D82FF)],
                ),
              ),
              child: const Icon(
                Icons.menu_book_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Generate AI-Powered Notes",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Our AI will analyze each section of your document and create "
              "concise notes with summaries, key points, and important terms.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            // WHAT YOU GET BOX
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "What you'll get:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(children: [
                    Text("• ", style: TextStyle(color: Colors.blue)),
                    Expanded(
                      child: Text("One-sentence summary per section"),
                    ),
                  ]),
                  SizedBox(height: 6),
                  Row(children: [
                    Text("• ", style: TextStyle(color: Colors.blue)),
                    Expanded(
                      child: Text("4–6 key bullet points highlighting main concepts"),
                    ),
                  ]),
                  SizedBox(height: 6),
                  Row(children: [
                    Text("• ", style: TextStyle(color: Colors.blue)),
                    Expanded(
                      child: Text("Essential terms with definitions"),
                    ),
                  ]),
                  SizedBox(height: 6),
                  Row(children: [
                    Text("• ", style: TextStyle(color: Colors.blue)),
                    Expanded(
                      child: Text("Downloadable format for offline study"),
                    ),
                  ]),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // later connect API
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF6A4CFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Generate Notes Now",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
