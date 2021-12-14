import 'package:flutter/material.dart';
import 'package:flutter_facial_recognition/core/model/model.dart';
import 'package:flutter_facial_recognition/core/repository/facial_recognition_repository.dart';

class RecognizedUser extends StatefulWidget {
  final int userID;
  const RecognizedUser({Key? key, required this.userID}) : super(key: key);

  @override
  State<RecognizedUser> createState() => _RecognizedUserState();
}

class _RecognizedUserState extends State<RecognizedUser> {
  UserDetails? _user;
  @override
  initState() {
    if (widget.userID != 0) {
      getUserDetails();
    }
    super.initState();
  }

  getUserDetails() async {
    var user = await FacialRecognitionRepository.getUserDetails(widget.userID);
    if (user != null) {
      setState(() {
        _user = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sybyl')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.userID == 0
              ? UserNotFound(widget: widget)
              : _user != null
                  ? FoundUserDetails(user: _user!)
                  : const CircularProgressIndicator(),
        ));
  }
}

class FoundUserDetails extends StatelessWidget {
  const FoundUserDetails({
    Key? key,
    required UserDetails user,
  })  : _user = user,
        super(key: key);

  final UserDetails _user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('Your Details', style:TextStyle(fontWeight:FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
            DetailRow(
                label: 'First Name',
                value: _user.firstName,
            ),
            DetailRow(
                label: 'Email',
                value: _user.email,
            )
            ,
            DetailRow(
                label: 'Gender',
                value: _user.gender,
            ),
            DetailRow(
                label: 'Department',
                value: _user.department,
            ),
            DetailRow(
                label: 'Company',
                value: _user.company,
            )
          ]),
              )),
        )
      ]),
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          children: [Text('$label : '), const SizedBox(width: 15), Text(value, style:const TextStyle(fontWeight:FontWeight.bold))]),
    );
  }
}

class UserNotFound extends StatelessWidget {
  const UserNotFound({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final RecognizedUser widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('User does not exist', style: TextStyle(fontSize: 23)),
          const SizedBox(height: 20),
          Text('Provided USER ID ${widget.userID}'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
