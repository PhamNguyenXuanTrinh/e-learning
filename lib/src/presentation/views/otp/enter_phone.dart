import 'package:flutter/material.dart';

class EnterOtpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 209, 214, 218),
        toolbarHeight: 250,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Continue With Phone",style: 
                      TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/img/phone.png'),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Enter Your Phone Number"),
            TextField(
            // controller: _controller,
            keyboardType: TextInputType.number, // Đặt kiểu bàn phím số
            decoration: InputDecoration(
              labelText: 'Enter a number',
            ),
          ),
          ],
        ),
      ),
    );
  }
}
