import 'package:flutter/material.dart';
class SubjectCard extends StatelessWidget {
  final String subject;
  final String urlImage;
  final VoidCallback onPress;

  const SubjectCard({
    super.key,
    required this.subject,
    required this.urlImage,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.only(top: 20,bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Image.network(urlImage,width: 50,fit: BoxFit.fill,),
          title: Text(subject, style: const TextStyle(fontSize: 20)),
          onTap: onPress,
        ),
      ),
    );
  }
}

