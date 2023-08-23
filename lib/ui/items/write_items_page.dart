import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_with_firebase/components/loading_layer.dart';
import 'package:riverpod_with_firebase/ui/items/providers/write_item_provider.dart';

class WriteItemPage extends ConsumerWidget {
  const WriteItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(writeItemViewModelProvider);
    return LoadingLayer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Item'),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 194, 224, 248),
              ),
              onPressed: model.enabled
                  ? () async {
                      try {
                        await model.write();
// ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  : null,
              child: const Text('Done')),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    model.file = File(pickedImage.path);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 194, 224, 248),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: model.file != null || model.image != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: model.file != null
                                  ? FileImage(model.file!) as ImageProvider
                                  : NetworkImage(model.image!))
                          : null),
                  width: 200,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (model.image == null && model.file == null)
                        const Expanded(child: Center(child: Icon(Icons.image))),
                      Material(
                        color: const Color.fromARGB(255, 194, 224, 248),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Pick Image".toUpperCase(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                initialValue: model.title,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(labelText: "Title"),
                onChanged: (value) => model.title = value,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                initialValue: model.description,
                textCapitalization: TextCapitalization.sentences,
                minLines: 5,
                maxLines: 10,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
                onChanged: (value) {
                  model.description = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
