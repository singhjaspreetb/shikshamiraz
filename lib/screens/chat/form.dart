import 'package:flutter/material.dart';
import 'package:shikshamiraz/common/theme_helper.dart';

class MyForm extends StatefulWidget {
  final Function(String) onSubmitted;

  const MyForm({super.key, required this.onSubmitted});
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String name = "";
  String courseInterest = "";
  String wakeUpTime = "";
  String collegeTime = "";
  String homeReachedTime = "";
  String numberOfHoursOfSleep = "";
  String numberOfDaysToLearn = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Course Interest",
              hintText: "Enter your course interest",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your course interest";
              }
              return null;
            },
            onSaved: (value) {
              courseInterest = value!;
            },
          ),
          // const SizedBox(
          //   height: 10.0,
          // ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     labelText: "College Time (From - To)",
          //     hintText: "Enter your college time (from am - to pm)",
          //     border: OutlineInputBorder(),
          //   ),
          //   validator: (value) {
          //     if (value!.isEmpty) {
          //       return "Please enter your college time";
          //     }
          //     return null;
          //   },
          //   onSaved: (value) {
          //     collegeTime = value!;
          //   },
          // ),
          // const SizedBox(
          //   height: 20.0,
          // ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     labelText: "Number of Hours want to Sleep",
          //     hintText: "Enter the number of hours you want to sleep",
          //     border: OutlineInputBorder(),
          //   ),
          //   validator: (value) {
          //     if (value!.isEmpty) {
          //       return "Please enter the number of hours you want to sleep";
          //     }
          //     return null;
          //   },
          //   onSaved: (value) {
          //     numberOfHoursOfSleep = value!;
          //   },
          // ),
          // const SizedBox(
          //   height: 20.0,
          // ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     labelText: "Number of Days / Weak wants to Learn",
          //     hintText: "Enter the number of days you want to learn",
          //     border: OutlineInputBorder(),
          //   ),
          //   validator: (value) {
          //     if (value!.isEmpty) {
          //       return "Please enter the number of days you want to learn";
          //     }
          //     return null;
          //   },
          //   onSaved: (value) {
          //     numberOfDaysToLearn = value!;
          //   },
          // ),
          const SizedBox(
            height: 32.0,
          ),
          Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  'Submit'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // String promt =
                  //     "hey i want to learn $courseInterest, $numberOfDaysToLearn days i want to study per weak sataurdy and sunday i want to revise, I want to study from after 8pm till 12 pm on daily basics,I want to sleep $numberOfHoursOfSleep hours, write me a time table for $numberOfDaysToLearn days in a week and complete learning timeline with roadmap and also suggest me paid and free learning recourse links for $courseInterest with topics";

                  // print(promt);
                  widget.onSubmitted(courseInterest);
                  _formKey.currentState!.save();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
