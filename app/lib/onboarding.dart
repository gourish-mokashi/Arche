import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentStep = 1;

  // Form Data
  List<String> selectedInterests = [];
  String skillLevel = "";
  String language = "";
  int studyHours = 1;
  String timePeriod = "";
  String extraResources = "";

  final TextEditingController interestController = TextEditingController();
  final TextEditingController extraResourceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3F0FF), Color(0xFFEFF4FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),

                /// STEP PROGRESS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: currentStep - 1 >= index
                            ? const Color(0xFF5A7BFF)
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 15),

                Text(
                  "Step $currentStep of 6",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                _buildCard(),

                const SizedBox(height: 20),

                /// NAVIGATION BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // BACK
                    if (currentStep > 1)
                      _whiteButton(
                        label: "Back",
                        icon: Icons.arrow_back,
                        onTap: () {
                          setState(() {
                            currentStep--;
                          });
                        },
                      )
                    else
                      const SizedBox(width: 10),

                    // NEXT
                    _nextButton(
                      label: currentStep == 6 ? "Finish" : "Next",
                      onTap: () {
                        if (currentStep < 6) {
                          setState(() {
                            currentStep++;
                          });
                        } else {
                          // SUBMIT PROCESS
                          print("INTERESTS: $selectedInterests");
                          print("LEVEL: $skillLevel");
                          print("LANG: $language");
                          print("HOURS: $studyHours");
                          print("TIME PERIOD: $timePeriod");
                          print("RESOURCES: $extraResources");

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Form Submitted Successfully!")),
                          );
                        }
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // MAIN CARD UI
  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (currentStep == 1) _step1(),
          if (currentStep == 2) _step2(),
          if (currentStep == 3) _step3(),
          if (currentStep == 4) _step4(),
          if (currentStep == 5) _step5(),
          if (currentStep == 6) _step6(),
        ],
      ),
    );
  }

  // STEP 1: WHAT TO LEARN
  Widget _step1() {
    final interests = [
      "Python",
      "Linux",
      "AI/ML",
      "Web Development",
      "Data Science",
      "DevOps",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What do you want to learn today?",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        const Text(
          "Tell us what you're interested in",
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 16),

        /// INPUT FIELD
        TextField(
          controller: interestController,
          decoration: InputDecoration(
            hintText: "e.g., Python, Machine Learning...",
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              setState(() => selectedInterests.add(value.trim()));
              interestController.clear();
            }
          },
        ),

        const SizedBox(height: 14),

        /// CHIPS
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: interests.map((item) {
            final bool selected = selectedInterests.contains(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (selected) {
                    selectedInterests.remove(item);
                  } else {
                    selectedInterests.add(item);
                  }
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFFEBE3FF) : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(item),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // STEP 2: SKILL LEVEL
  Widget _step2() {
    final levels = ["Beginner", "Intermediate", "Advanced"];

    return _radioGroup(
      title: "Your skill level",
      options: levels,
      selectedValue: skillLevel,
      onChanged: (value) {
        setState(() => skillLevel = value);
      },
    );
  }

  // STEP 3: LANGUAGE
  Widget _step3() {
    return _radioGroup(
      title: "Preferred language",
      subtitle: "English or Hindi (video content)",
      options: ["English", "Hindi"],
      selectedValue: language,
      onChanged: (value) {
        setState(() => language = value);
      },
    );
  }

  // STEP 4: HOURS PER DAY
  Widget _step4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How many hours per day can you learn?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),

        Slider(
          value: studyHours.toDouble(),
          min: 1,
          max: 10,
          divisions: 9,
          label: "$studyHours hrs",
          onChanged: (value) {
            setState(() => studyHours = value.toInt());
          },
        ),
      ],
    );
  }

  // STEP 5: TIME PERIOD
  Widget _step5() {
    final options = [
      "1 Week",
      "2 Weeks",
      "1 Month",
      "2 Months",
      "3 Months",
    ];

    return _radioGroup(
      title: "Time period to finish learning",
      options: options,
      selectedValue: timePeriod,
      onChanged: (value) {
        setState(() => timePeriod = value);
      },
    );
  }

  // STEP 6: EXTRA RESOURCES
  Widget _step6() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Extra specific resources",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        const Text(
          "Provide special websites / channels / books",
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 16),

        TextField(
          controller: extraResourceController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "e.g., MIT OCW, FreeCodeCamp, CodeWithHarry...",
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            setState(() => extraResources = value);
          },
        )
      ],
    );
  }

  // reusable radio-group
  Widget _radioGroup({
    required String title,
    String? subtitle,
    required List<String> options,
    required String selectedValue,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700)),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(subtitle,
                style: const TextStyle(color: Colors.black54)),
          ),
        const SizedBox(height: 16),
        Column(
          children: options.map((item) {
            return RadioListTile(
              title: Text(item),
              value: item,
              groupValue: selectedValue,
              onChanged: (value) => onChanged(value!),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _whiteButton(
      {required String label, required IconData icon, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }

  Widget _nextButton({required String label, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF5C8FFF), Color(0xFFA870FF)],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_forward_rounded,
                size: 18, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
