import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:nginie/utils/constants.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'dart:ui';

class ActivityForm extends StatelessWidget {
  const ActivityForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _start_date_controller = TextEditingController();
    TextEditingController _due_date_controller = TextEditingController();
    return Container(
      child: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: DropDown<String>(
                isExpanded: true,
                items: <String>["Martin", "Mathias", "Juan"],
                icon: Icon(
                  Icons.expand_more,
                  color: Colors.blue,
                ),
                customWidgets: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80"
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Martin"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/5/5f/Big_Temple-Temple.jpg"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Mathias"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://raw.githubusercontent.com/rrousselGit/provider/master/resources/expanded_devtools.jpg"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Juan"),
                    ],
                  )
                ],
                hint: Text("Assigned to..",
                style: TextStyle(fontSize: 16),
                ),
                onChanged: print,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                children: <Widget>[
                  Text(
                    'Select priority',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomCheckBoxGroup(
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables: [
                      "Low",
                      "Medium",
                      "High",
                    ],
                    buttonValuesList: [
                      "Low",
                      "Medium",
                      "High",
                    ],
                    checkBoxButtonValues: (values) {
                      print(values);
                    },
                    defaultSelected: ["Low"],
                    horizontal: false,
                    width: 120,
                    //height: 50,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    padding: 4,
                    enableShape: true,
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                children: <Widget>[
                  Text(
                    'Select type',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomCheckBoxGroup(
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables: [
                      "Ad-Hoc",
                      "Periodic",
                      "Recurring",
                    ],
                    buttonValuesList: [
                      "Ad-Hoc",
                      "Periodic",
                      "Recurring",
                    ],
                    checkBoxButtonValues: (values) {
                      print(values);
                    },
                    defaultSelected: ["Ad-Hoc"],
                    horizontal: true,
                    width: 120,
                    //height: 50,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    padding: 4,
                    enableShape: true,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select start and due date',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.calendar_today_rounded),
                  padding: EdgeInsets.symmetric(horizontal: 53, vertical: 0),
                  iconSize: 100,
                  color: primaryColor,
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2021, 3, 5),
                            maxTime: DateTime(2025, 6, 7),
                            theme: DatePickerTheme(
                                headerColor: primaryColor,
                                backgroundColor: primaryColor,
                            ), onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      print('confirm $date');
                    }, currentTime: DateTime.now(), locale: LocaleType.en)
                        .then((selectedDate) {
                      if (selectedDate != null) {
                        _start_date_controller.text =
                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today_rounded),
                  padding: EdgeInsets.symmetric(horizontal: 53, vertical: 0),
                  color: primaryColor,
                  iconSize: 100,
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2021, 3, 5),
                            maxTime: DateTime(2025, 6, 7),
                            theme: DatePickerTheme(
                                headerColor: primaryColor,
                                backgroundColor: primaryColor,
                                /*itemStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                doneStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16)*/
                                    ), onChanged: (date) {

                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      print('confirm $date');
                    }, currentTime: DateTime.now(), locale: LocaleType.en)
                        .then((selectedDate) {
                      if (selectedDate != null) {
                        _due_date_controller.text =
                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(hintText: 'Start date'),
                    controller: _start_date_controller,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Due date"),
                    controller: _due_date_controller,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
