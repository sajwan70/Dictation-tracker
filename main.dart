
import 'package:flutter/material.dart';

void main() => runApp(DictationTrackerApp());

class DictationTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictation Tracker',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: DictationHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DictationHomePage extends StatelessWidget {
  final int currentDictation = 318;
  final int fromStartDictation = 1;
  final List<int> rdKhand1Dictations = [4, 5, 6];

  Widget buildDictationCard(String title, int number) {
    return Card(
      color: Colors.teal.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title - Dictation $number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ...List.generate(10, (i) => buildCheckboxTile('Copy ${i + 1}')),
            ...List.generate(5, (i) => buildCheckboxTile('Dictation ${i + 1}')),
            ...List.generate(2, (i) => buildCheckboxTile('Reading ${i + 1}')),
            buildCheckboxTile('Final Typing'),
            buildCheckboxTile('✅ Done'),
          ],
        ),
      ),
    );
  }

  Widget buildCheckboxTile(String title) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (_) {}),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dictation Tracker')),
      body: ListView(
        children: [
          buildDictationCard('Current Day Dictation', currentDictation),
          buildDictationCard('From Start Dictation', fromStartDictation),
          for (var i = 0; i < rdKhand1Dictations.length; i++)
            buildDictationCard('RD Khand 1 - ${i + 1}', rdKhand1Dictations[i]),
        ],
      ),
    );
  }
}
