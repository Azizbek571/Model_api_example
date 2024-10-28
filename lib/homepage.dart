
import 'package:flutter/material.dart';
import 'package:model_example_api/model/user.dart';
import 'package:model_example_api/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <User> users = [];
@override
  void initState() {
    super.initState();
    fetchUsers();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Api"),
      ),

body: ListView.builder(
  itemCount: users.length,
  itemBuilder: (context, index){
    final user = users[index];
    final email = user.email;
    // final color = user.gender == 'male' ? Colors.blue : Colors.red;
    // final name = user['name']['first'];
    // final imageUrl = user['picture']['thumbnail'];
  return ListTile(
    // tileColor: color ,
    // title: Text(user.email),
    // title: Text(user.name.first),
    title: Text(user.fullName),
    subtitle: Text(user.email),

    // leading: (
    // ClipRRect(
    //   borderRadius: BorderRadius.circular(100),
    //   child: Image.network(imageUrl),)
    // // CircleAvatar(child:
    // // Image.network(imageUrl)
    // //  Text('${index+1}')
    //  ),
    // leading: Text('$index'),
    
    // title: Text(name.toString()),
    // subtitle: Text(email),
  );
} ),

      // floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  Future <void> fetchUsers()async{
   final response = await UserApi.fetchUsers();
   setState(() {
     users = response;
   });
  }

  // // void fetchUsers()async{
  // Future <void> fetchUsers()async{
  //   print("fetchUsers called");
  //   const url = 'https://randomuser.me/api/?results=10';
  //   final uri = Uri.parse(url);
  // final response =  await http.get(uri);
  // final body = response.body;
  // final json = jsonDecode(body);
  // final results = json['results'] as List<dynamic>;
  // final transformed = results.map((e){
  //   final name = UserName(
  //     title: e['name']['title'],
  //     first: e['name']['first'],
  //     last: e['name']['last']
  // );
  //   return User(
  //     gender: e['gender'],
  //      email: e['email'], 
  //      phone: e['phone'], 
  //      cell: e['cell'],
  //       nat: e['nat'],
  //       name: name,
  //       );
     
  // }).toList();
  // setState(() {
  //   users = transformed;
  //   // users = json['results'];
  // });
  // print('fetchUsers completed');
  // }
}
