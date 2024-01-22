import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key});


String _formatDateTime(Timestamp timestamp) {
  final DateTime dateTime = timestamp.toDate();
  final String formattedDate = DateFormat.yMd().format(dateTime); // Adjust the format as needed
  return formattedDate;
}
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreMethods().MeetingHisory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No meeting history available.'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var meetingData = snapshot.data!.docs[index];
            return ListTile(
  title: Text('Room Name: ${meetingData['meetingName']}'),
  subtitle: Text(
    'Joined On ${_formatDateTime(meetingData['createdAt'] as Timestamp)}',
                  ),
              );
          },
        );
      },
    );
  }
}
