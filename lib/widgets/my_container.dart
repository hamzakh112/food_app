import 'package:flutter/material.dart';
class MyContainer extends StatelessWidget {
  String image;
  String name;
  int  price;
  final VoidCallback ontap;
   MyContainer({Key? key,required this.image,required this.price,required this.name,required this.ontap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
        height: 220,
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 50,
            ),
            ListTile(
              leading: Text(name,
                style: TextStyle(color: Colors.white,
                    fontSize: 15),),
              trailing: Text("\$ $price",style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children:[
                  Icon(Icons.star,color: Colors.white,),
                  Icon(Icons.star,color: Colors.white,),
                  Icon(Icons.star,color: Colors.white,),
                  Icon(Icons.star,color: Colors.white,),
                  Icon(Icons.star,color: Colors.white,)
                ],),
            )
          ],
        ),

      ),
    );
  }
}
