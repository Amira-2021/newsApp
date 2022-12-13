import 'package:flutter/material.dart';

class Components {
  Widget TextEdit(
    String labalText,
    Icon icon,
    TextInputType keyType,
    TextEditingController control,
    TextStyle style, {
    Icon suffex,
    bool scure = false,
    Function validate,
  }) {
    return TextFormField(
      controller: control,
      keyboardType: keyType,
      validator: validate,
      style: style,
      obscureText: scure,
      decoration: InputDecoration(
        fillColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelText: labalText,
        labelStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
        prefixIcon: icon,
        suffixIcon: suffex,
      ),
    );
  }
}

Widget Content(article, context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.grey),
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage("${article["urlToImage"]}"),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${article["title"]} ",
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${article["publishedAt"]}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
