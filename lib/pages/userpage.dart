import 'package:flutter/material.dart';
import 'package:users_id/model/model.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.userdata}) : super(key: key);

  final UserModel userdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg/800px-Andrzej_Person_Kancelaria_Senatu.jpg",
                        ),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              Text(
                "Name: ${userdata.name}",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "Id : ${userdata.id}",
              ),
              Text(
                "Mail : ${userdata.email}",
              ),
              Text(
                "Mail : ${userdata.postId}",
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                indent: 30,
                endIndent: 30,
                thickness: 1.5,
              ),
              Text(
                "Description : ${userdata.body}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
