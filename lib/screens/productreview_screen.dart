import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatefulWidget {
  final String productName;

  ProductReviewScreen({required this.productName});

  @override
  _ProductReviewScreenState createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  // Sample list of reviews
  List<Map<String, String>> reviews = [
    {'review': 'Great product!', 'author': 'John'},
    {'review': 'Fresh and healthy', 'author': 'Jane'},
  ];

  // Controller for the review input field
  TextEditingController reviewController = TextEditingController();

  // Function to add a new review
  void _addReview(String reviewText) {
    setState(() {
      reviews.add({'review': reviewText, 'author': 'Anonymous'});
    });
    reviewController.clear();
  }

  // Function to edit a review
  void _editReview(int index, String newReviewText) {
    setState(() {
      reviews[index]['review'] = newReviewText;
    });
  }

  // Function to delete a review
  void _deleteReview(int index) {
    setState(() {
      reviews.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews for ${widget.productName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // List of reviews
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(reviews[index]['review']!),
                      subtitle: Text('by ${reviews[index]['author']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit icon
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Show dialog to edit review
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Edit Review'),
                                    content: TextField(
                                      controller: reviewController
                                        ..text = reviews[index]['review']!,
                                      decoration: InputDecoration(hintText: 'Enter your review'),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          _editReview(index, reviewController.text);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          // Delete icon
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteReview(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Add a new review
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: reviewController,
                      decoration: InputDecoration(
                        labelText: 'Add a review',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (reviewController.text.isNotEmpty) {
                        _addReview(reviewController.text);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
