import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_with_firebase/ui/items/providers/item_provider.dart';
import 'package:riverpod_with_firebase/ui/items/write_items_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freezed Riverpod',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final itemsData = ref.watch(itemsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Home'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const WriteItemPage();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: itemsData.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children:data.map((e) => Card(
                margin: const EdgeInsets.all(8),
                child: AspectRatio(
                  aspectRatio: 3,
                  child: Row(
                    children: [
                      AspectRatio(aspectRatio: 1,
                      child: Image.network(e.image,fit: BoxFit.cover,),
                      ),
                      Expanded(child: Column(
                        
                        children: [
                          Text(e.title),
                          Text(e.description)
                        ],
                      ))
                    ],
                  ),
                ),
              )).toList()
            ),
          );
        },
        error: (error, stackTrace) {

          return Center(child: Text(error.toString()),);
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
