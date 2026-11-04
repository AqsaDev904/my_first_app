import 'Product_model.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Get_api extends StatefulWidget {
  const Get_api({super.key});

  @override
  State<Get_api> createState() => _Get_apiState();
}

class _Get_apiState extends State<Get_api> {
  List product = [];
  bool isLoading = false;
  String updatedata = '';

  // GET API
  Future<void> getdata() async {
    setState(() {
      isLoading = true;
      updatedata = '';
    });

    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);

        setState(() {
          product = decode;
        });
      } else {
        log('Products not loaded');
      }
    } catch (e) {
      log('Error message: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // DELETE API
  Future<void> deletedata(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('https://fakestoreapi.com/products/$id'),
      );

      if (response.statusCode == 200) {
        setState(() {
          product.removeWhere((item) => item['id'] == id);
        });

        log('Product deleted');
      } else {
        log('Product not deleted');
      }
    } catch (e) {
      log('Delete error: $e');
    }
  }

  // PUT API
  Future<void> updateProduct(int id) async {
    setState(() {
      isLoading = true;
      updatedata = '';
    });

    try {
      final index = product.indexWhere(
        (item) => item['id'] == id,
      );

      if (index == -1) return;

      final response = await http.put(
        Uri.parse('https://fakestoreapi.com/products/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'title': 'T-shirt',
          'price': 800,
          'description': 'Cotton shirt',
          'image': product[index]['image'],
          'category': 'clothing',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          product[index] = {
        product[index],data,
          };

          updatedata = 'Product Updated!\n'
              'ID: ${data['id']}\n'
              'Title: ${data['title']}\n'
              'Price: ${data['price']}';
        });
      } else {
        log('Update failed: ${response.statusCode}');
      }
    } catch (e) {
      log('Update error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  Future<void> getsingledata() async{
    setState(() {
      isLoading = true;
    });
try{
  final response = await http.get(
    Uri.parse("https://fakestoreapi.com/products/1"),
  );
  if (response.statusCode==200){
    final getdata = jsonDecode(response.body);
  setState(() {
    isLoading = true;
    product = [getdata];
  });
  }
  else{
    log("Not correct");
  }

}
catch(e){
  log("erooor $e");
}
finally{
  setState(() {
    isLoading = false;
  });
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 12, 17),

      appBar: AppBar(
        title: const Text(
          'E-commerce App',
          style: TextStyle(
            color: Color.fromARGB(255, 5, 88, 8),
          ),
        ),
        actions: const [
          Icon(
            Icons.shopping_bag,
            color: Color.fromARGB(255, 3, 107, 57),
          ),
        ],
      ),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
ElevatedButton(
   style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 35, 193, 40),
                foregroundColor: Colors.white,
              ),
              onPressed: isLoading ? null : getsingledata,
              child: const Text('Get single product'),
  
),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 35, 193, 40),
                foregroundColor: Colors.white,
              ),
              onPressed: isLoading ? null : getdata,
              child: const Text('Get product'),
            ),

            const SizedBox(height: 10),

            if (updatedata.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  updatedata,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                  ),
                ),
              ),

            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255, 23, 60, 56,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.greenAccent,
                              width: 1,
                            ),
                          ),

                          child: ListTile(
                            leading: Image.network(
                              product[index]['image'].toString(),
                              width: 45,
                              errorBuilder: (context, error, stack) {
                                return const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.white,
                                );
                              },
                            ),

                            title: Text(
                              product[index]['title'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),

                            subtitle: Text(
                              product[index]['price'].toString(),
                              style: const TextStyle(
                                backgroundColor: Colors.grey,
                                color: Colors.greenAccent,
                              ),
                            ),

                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // UPDATE BUTTON
                                IconButton(
                                  onPressed: isLoading
                                      ? null
                                      : () {
                                          updateProduct(
                                            product[index]['id'],
                                          );
                                        },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.lightGreen,
                                  ),
                                ),

                                // DELETE BUTTON
                                IconButton(
                                  onPressed: () {
                                    deletedata(
                                      product[index]['id'],
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
