// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/data/quotes.dart';
import 'package:quotes_app_flutter/widgets/home_screen_main_widget.dart';
import 'package:quotes_app_flutter/widgets/home_screen_top_bar_widget.dart';
import 'package:quotes_app_flutter/widgets/progress_loader.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List quotes = [];
  final List<Map<String, dynamic>> fetchedQuotes = [];

  @override
  void initState() {
    super.initState();
    fetchQuotesAndLog(); // Call the function here
  }

  Future<void> fetchQuotesAndLog() async {
    // try {
    //   final QuerySnapshot querySnapshot =
    //       await FirebaseFirestore.instance.collection('quotes').limit(49).get();
    //   for (var doc in querySnapshot.docs) {
    //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //     if (data.containsKey('text') && data.containsKey('author')) {
    //       fetchedQuotes.add({
    //         'text': data['quote'],
    //         'author': data['author'],
    //       });
    //     } else {
    //       print("A document is missing 'text' or 'author' fields.");
    //     }
    //   }
    setState(() {
      quotes = quotesLocalData;
    });
    // } catch (error) {
    //   print("-----------------------------ERROR-------------------------");
    //   print(error);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const HomeScreenTopBarWidget(),
      ),
      body: quotes.isNotEmpty
          ? PageView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: HomeScreenMainWidget(quote: quotes[index]),
                );
              },
            )
          : const ProgressIndicatorExample(),
    );
  }
}
