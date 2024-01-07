import 'package:api_integration/controller/my_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPostsPage extends StatefulWidget {
  const MyPostsPage({super.key});

  @override
  State<MyPostsPage> createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MyDataController>(context, listen: false)
          .getPostsData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Posts List"),
        ),
        body: Center(
          child: Consumer<MyDataController>(
            builder: (BuildContext context, value, Widget? child) {
              return value.loading
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: value.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Id ${value.data[index].id}",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Title ${value.data[index].title}", style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),),
                              Text("${value.data[index].body}"),
                            ],
                          ),
                        );
                      });
            },
          ),
        ));
  }
}
