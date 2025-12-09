import 'package:flutter/material.dart';
import 'generate_notes_screen.dart';   // ✅ REQUIRED IMPORT

class DocumentViewScreen extends StatefulWidget {
  final String fileName;

  const DocumentViewScreen({super.key, required this.fileName});

  @override
  State<DocumentViewScreen> createState() => _DocumentViewScreenState();
}

class _DocumentViewScreenState extends State<DocumentViewScreen> {
  List<bool> _expanded = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              "Back to Documents",
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------------------------------------------------
            // FILE HEADER CARD
            // ------------------------------------------------------------
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFB57CFF), Color(0xFF6D82FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.fileName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "5 sections extracted  •  PPTX",
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Your document has been processed and organized "
                          "into sections. Choose a study tool below to get started.",
                          style: TextStyle(color: Colors.black87, fontSize: 13),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------------------
            // DOCUMENT SECTIONS
            // ------------------------------------------------------------
            const Text(
              "Document Sections",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ...List.generate(
              5,
              (index) => _sectionCard(
                index: index,
                title: [
                  "Introduction to Python Programming",
                  "Variables and Data Types",
                  "Control Flow: Conditionals",
                  "Loops and Iteration",
                  "Functions and Modules"
                ][index],
                pages: ["Pages 1,2", "Pages 3,4,5", "Pages 6,7", "Pages 8,9,10", "Pages 11,12,13"][index],
              ),
            ),

            const SizedBox(height: 30),

            // ------------------------------------------------------------
            // STUDY TOOLS
            // ------------------------------------------------------------
            const Text(
              "Study Tools",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _toolCard(
              icon: Icons.menu_book_rounded,
              title: "Generate Smart Notes",
              subtitle: "AI-powered summaries and key points",
              buttonLabel: "Generate Notes",
              color: const Color(0xFF397BFF),

              // ✅ FIXED NAVIGATION
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GenerateNotesScreen(),
                  ),
                );
              },
            ),

            _toolCard(
              icon: Icons.calendar_month,
              title: "Create Study Plan",
              subtitle: "Personalized day-by-day learning schedule",
              buttonLabel: "Create Plan",
              color: const Color(0xFF914BFF),
            ),
            _toolCard(
              icon: Icons.flash_on,
              title: "Generate Quiz",
              subtitle: "Instant revision quizzes",
              buttonLabel: "Generate Quiz",
              color: const Color(0xFFFF006E),
            ),
            _toolCard(
              icon: Icons.video_collection_rounded,
              title: "Video Resources",
              subtitle: "Useful videos for each topic",
              buttonLabel: "Browse Videos",
              color: const Color(0xFF535CFF),
            ),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // SECTION CARD
  // ================================================================
  Widget _sectionCard({required int index, required String title, required String pages}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: ExpansionTile(
        initiallyExpanded: _expanded[index],
        onExpansionChanged: (v) {
          setState(() => _expanded[index] = v);
        },
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFFB57CFF),
          child: Text("${index + 1}", style: const TextStyle(color: Colors.white)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(pages, style: const TextStyle(color: Colors.black54)),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "This is the extracted text for $title.\n"
              "Replace this with real section content.",
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // TOOL CARD
  // ================================================================
  Widget _toolCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonLabel,
    required Color color,
    VoidCallback? onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Center(
              child: Text(buttonLabel, style: const TextStyle(color: Colors.white, fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
