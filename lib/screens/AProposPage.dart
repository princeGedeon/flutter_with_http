import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 32.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            SizedBox(height: 16.0),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Développeur d\'applications mobiles',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sit amet velit odio. Mauris vitae est nec ex tempor vehicula ut ac velit. Nullam imperdiet ornare tellus ut placerat. Cras luctus bibendum diam ut blandit. Duis eget enim et arcu mollis tempus vel nec nulla.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contactez-moi:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {},
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {},
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.web),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
