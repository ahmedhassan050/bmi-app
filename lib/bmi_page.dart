import 'package:flutter/material.dart';
import 'resalt_screen.dart';

class bmi_page extends StatefulWidget {
  const bmi_page({super.key});

  @override
  State<bmi_page> createState() => _bmi_pageState();
}

class _bmi_pageState extends State<bmi_page> {
  bool isMale = true;

  double height = 180;
  int weight = 50;
  int age = 24;

  void changeWeight(int value) {
    setState(() {
      weight += value;

      if (weight < 1) {
        weight = 1;
      }
    });
  }

  void changeAge(int value) {
    setState(() {
      age += value;

      if (age < 1) {
        age = 1;
      }
    });
  }

  void calculateBMI() {
    double bmi = weight / ((height / 100) * (height / 100));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => resalt_screen(bmi: bmi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: GenderCard(
                        icon: Icons.male,
                        title: 'male',
                        selected: isMale,
                        color: const Color(0xfff20d58),
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: GenderCard(
                        icon: Icons.female,
                        title: 'female',
                        selected: !isMale,
                        color: const Color(0xfff20d58),
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff202139),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 5),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${height.toInt()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: ' cm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Slider(
                        min: 100,
                        max: 220,
                        value: height,
                        activeColor: const Color(0xfff20d58),
                        inactiveColor: Colors.grey,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: NumberCard(
                        title: 'Weight',
                        value: weight,
                        onMinus: () => changeWeight(-1),
                        onPlus: () => changeWeight(1),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: NumberCard(
                        title: 'Age',
                        value: age,
                        onMinus: () => changeAge(-1),
                        onPlus: () => changeAge(1),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff20d58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= GENDER CARD =================

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? color : const Color(0xff202139),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: Colors.white,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= NUMBER CARD =================

class NumberCard extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const NumberCard({
    super.key,
    required this.title,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff202139),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                icon: Icons.remove,
                onTap: onMinus,
              ),

              const SizedBox(width: 10),

              RoundButton(
                icon: Icons.add,
                onTap: onPlus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ================= ROUND BUTTON =================

class RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const RoundButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: const BoxDecoration(
          color: Color(0xff55586a),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}