import 'package:flutter/material.dart';

class NoResult extends StatelessWidget {
  const NoResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
             const SizedBox(
              height: 50,
            ),
            Container(
              
              child: Text(
                "Aucun film n'est diffusé à la date sélectionnée",
                style: TextStyle(
                    color: Color(0xFF721c24),
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFf8d7da),
                boxShadow: [
                  BoxShadow(color: Color(0xFFf5c6cb), spreadRadius: 1),
                ],
              ),
              padding: EdgeInsets.all(10.0),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                Image(
                  image: const AssetImage('assets/SadRes.png'),
                  width: size.width * 0.4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
