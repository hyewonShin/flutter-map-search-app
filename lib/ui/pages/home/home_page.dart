import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: '삼성동',
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
      body: Expanded(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return item();
          },
        ),
      ),
    );
  }

  Container item() {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '삼성 1동 주민센터',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('공공,사회기관>행정복지센터'),
          Text('서울특별시 강남구 봉은사로 616 삼성1동 주민센터'),
        ],
      ),
    );
  }
}
