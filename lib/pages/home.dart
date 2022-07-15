import 'package:flutter_seed/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HomePage"),
      ),
      body: FutureBuilder<User?>(
        future: AuthService().currentUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Get Current User Email
            String userEmail = snapshot.data!.email ?? "Email test";

            // Get Current User UID
            String userUid = snapshot.data!.uid;

            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Divider(
                  height: 5,
                ),
                ListTile(
                  // Sign Out Button
                  trailing: IconButton(
                    icon: const Icon(Icons.power_settings_new),
                    onPressed: () => AuthService().signOut(),
                  ),

                  // Display User Email
                  title: Text(
                    userEmail,
                    style: const TextStyle(color: Colors.white),
                  ),

                  // Display User UID
                  subtitle: Text(userUid),

                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.person),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
