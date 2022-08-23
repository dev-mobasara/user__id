import 'package:flutter/material.dart';
import 'package:users_id/model/model.dart';
import 'package:users_id/pages/userpage.dart';
import 'package:users_id/service/apiservices.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users of Digitron"),
        centerTitle: true,
      ),
      body: const UsersDash(),
    );
  }
}

class UsersDash extends StatelessWidget {
  const UsersDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: APIService().fetchUserModel(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg/800px-Andrzej_Person_Kancelaria_Senatu.jpg",
                ),
              ),
              title: Text("Name : ${snapshot.data![index].name}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserPage(
                      userdata: snapshot.data![index],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
