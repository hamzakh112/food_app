import 'package:flutter/material.dart';
import 'package:food_app/provider/my_provider.dart';
import 'package:food_app/screens/cart_page.dart';
import 'package:food_app/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class DetailScreen extends StatefulWidget {
final String name;
 final  String image;
  final int price;
   const DetailScreen({Key? key,required this.price,required this.name,required this.image}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity=1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of<MyProvider>(context);

    return  Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      appBar: AppBar(
          backgroundColor: const Color(0xff2b2b2b),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(widget.image),
            ),

          )),
          Expanded(
            flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff3a3e3e),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),

              ),
            ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,style:const  TextStyle(color: Colors.white,fontSize: 25),),
                    const Text('Any Text here',style: TextStyle(color: Colors.white,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  quantity--;
                                });
                              },
                              child: Container(
                                height: 39,
                                width: 39,
                                decoration:BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Icon(Icons.remove),

                              ),
                            ),
                             const SizedBox(width: 10,),
                            Text(quantity.toString(),
                              style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  quantity++;
                                });

                              },
                              child: Container(
                                height: 39,
                                width: 39,
                                decoration:BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Icon(Icons.add),

                              ),
                            ),
                          ],
                        ),
                        Text('\$${widget.price*quantity}',style: const TextStyle(color: Colors.white,fontSize: 30),),
                      ],
                    ),
                    const Text('Description',style: TextStyle(color: Colors.white,fontSize: 30),),
                    const Text('hekkjajhagfahgfagfafhghgahfgahgfagfahgfahgfahgafhgfahgfahgfadshgfadshgfahgfa'
                    ,style: TextStyle(color: Colors.white,fontSize: 20),),
                    // Container(
                    //   height: 50,
                    //
                    //   width: double.infinity,
                    //   child: ElevatedButton.icon(
                    //     style:const ButtonStyle(
                    //     ),
                    //     icon: const Icon(Icons.shopping_cart,),
                    //     label:const Text('Add to cart'),
                    //     onPressed: (){
                    //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage()));
                    //       provider.addToCart(
                    //           image: widget.image, quantity: quantity, price: widget.price, name: widget.name);
                    //
                    //     },
                    //   ),
                    // ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFBCD438),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                            provider.addToCart(image: widget.image, quantity: quantity, price: widget.price, name: widget.name);
                          }, icon: Icon(Icons.shopping_cart,color: Colors.black,)),
                          Text('Add to cart',style: GoogleFonts.aladin(
                            color: Colors.black,
                            fontSize: 20,
                          ),),
                        ],
                      ),
                    )
                  ],
                ),
    )),
        ],
      ),


    );
  }
}
