import 'package:amiraapp/presentation/web_view/webview.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  Map map;

  ListItem(this.map);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Webview(
                url: "${map["url"]}",
              ),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage("${map["urlToImage"]}"),
                          fit: BoxFit.cover))),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "${map["title"]}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "${map["publishedAt"]}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
