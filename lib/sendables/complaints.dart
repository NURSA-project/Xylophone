import 'package:flutter/material.dart';
import 'package:nursa/authentication/authentication.dart';

class FetchingComplaints extends StatefulWidget {
  const FetchingComplaints({super.key});

  @override
  State<FetchingComplaints> createState() => _FetchingComplaintsState();
}

class _FetchingComplaintsState extends State<FetchingComplaints> {
  final TextEditingController compController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaint page"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 90),
            TextField(
              controller: compController,
              decoration: const InputDecoration(
                labelText: 'Enter complaints',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await Authentication()
                    .addToFirestoreCollection(compController.text);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Complaint submitted"),
                      content: const Text("Thank you for your message!"),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            compController.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

// class CompDataDisplayWidget extends StatelessWidget {
//   final List<String> compData;

//   CompDataDisplayWidget({required this.compData});

//   @override
//   Widget build(BuildContext context) {
//     String dataText = compData.join('\n');

//     return Text(dataText);
//   }
//}
