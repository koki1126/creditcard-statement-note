import 'package:flutter/material.dart';

class TotalPage extends StatelessWidget {
  const TotalPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    '10,000円',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                color: Colors.orange,
                                height: 60,
                              ),
                              const Positioned(
                                bottom: 16,
                                right: 16,
                                left: 16,
                                child: Text(
                                  'Viewカード',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 16,
                                right: 16,
                                left: 200,
                                child: Text(
                                  '10,000円',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.all(16).copyWith(bottom: 0),
                            child: const Text(
                              'メモを表示します。',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('詳細'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  elevation: 0,
                                  onPrimary: Colors.blue,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('編集'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  elevation: 0,
                                  onPrimary: Colors.blue,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
