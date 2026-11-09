
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  List Products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    get();
  }

  Future<void> get() async {

    setState(() {
      isLoading = true;
    });

    try {
      final Response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (Response.statusCode == 200) {

        final decode = jsonDecode(Response.body);

        setState(() {
          Products = decode;
        });

      } else {
        log("product not find");
      }

    } catch (e) {
      log("error : $e");

    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Welcome to fake api store",
          style: TextStyle(
            backgroundColor: Colors.brown,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
            width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 20,
                  )
                ],
              ),

              child: GridView.builder(

                itemCount: Products.length,

                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
childAspectRatio: 1.5,
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
mainAxisSpacing: 10,
                ),

                itemBuilder: (context, index) {

                  return Card(
                    
                    child: Column(
                      
                      children: [
                        Image.network(
                          Products[index]['image'],
                          height: 100,
                        ),

                        Text(
                          Products[index]['title'],
                        ),

                        Text(
                          Products[index]['description'],
                        ),
Text(
  "\$${Products[index]['price']}",
),

                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
