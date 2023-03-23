import 'package:flutter/material.dart';
import 'package:crud_rest_api/models/cases.dart';
import 'detailwidget.dart';
class CasesList extends StatelessWidget {
  final List<Cases> cases;
  const CasesList({super.key, required this.cases});

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          itemCount: cases.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Card(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailWidget(cases: cases[index],)),
                      );
                    },
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(cases[index].name),
                      subtitle: Text(cases[index].age.toString()),
                    ),
                  )
              );
          });
  }
}