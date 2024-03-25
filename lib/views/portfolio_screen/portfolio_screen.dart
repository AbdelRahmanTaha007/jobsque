import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});
  static const route = "PortfolioScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Add portfolio here",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(236, 242, 255, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(102, 144, 255, 1),
                    ),
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      child: Image.asset("assets/images/document-upload.png"),
                    ),
                  ),
                  Text(
                    "Upload your other file",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Max file size 10MB",
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF3366FF)),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/export.png"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Add file"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //////////////////////////
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Logo.png"),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "CV name.CV",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("CV.pdf 300KB"),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          //onTap remove
                          child: Image.asset("assets/images/close-circle.png")),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          //onTap Edit
                          child: Image.asset("assets/images/edit-2.png")),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Logo.png"),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "CV name.CV",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("CV.pdf 300KB"),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          //onTap remove
                          child: Image.asset("assets/images/close-circle.png")),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          //onTap Edit
                          child: Image.asset("assets/images/edit-2.png")),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/Logo.png"),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "CV name.CV",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("CV.pdf 300KB"),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          //onTap remove
                          child: Image.asset("assets/images/close-circle.png")),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          //onTap Edit
                          child: Image.asset("assets/images/edit-2.png")),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
