import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/signup_screen.dart';
import 'package:food_app/widgets/my_password_textfield.dart';
import 'package:food_app/widgets/my_textfield.dart';
import 'package:food_app/widgets/round_button.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}
class _LoginScreenState extends State<LoginScreen> {
   RegExp reg=RegExp(LoginScreen.pattern.toString());
  Color whatsappBusinessColor = const Color(0xFF0b2d39);
  Color buttoncolor=Color(0xFFBCD438);
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final auth =FirebaseAuth.instance;
  bool loading =false;
  GlobalKey<ScaffoldMessengerState> globalkey=GlobalKey<ScaffoldMessengerState>();
  void validation1(){
    if(emailController.text.trim().isEmpty||emailController.text==null){
      showSnackbar('email is empty');
      return;
    }
    if(passwordController.text.trim().isEmpty||passwordController.text==null){
      showSnackbar('password  is empty');
      return;
    }
    else if(!reg.hasMatch(emailController.text)){
      showSnackbar('Please enter valid email');
      return;
    }
    else{
      setState(() {
        loading=true;
      });
      login();

    }
  }
  Future login()async{
    setState(() {
      loading=true;
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())));
    }
    on FirebaseAuthException catch  (e) {
      if(e.code=='user-not-found'){
        showSnackbar('user not found');
        setState(() {
          loading=false;
        });
        return;
      }
      else if(e.code=='wrong-password'){
        showSnackbar('password is incorrext');
        setState(() {
          loading=false;
        });
        return;
      }
    }
    catch(e){
      showSnackbar(e.toString());
      setState(() {
        loading=false;
      });

    }
    setState(() {
      loading=false;
    });
  }

  void showSnackbar(String message){
    final snackbar=SnackBar(content: Text(message),
        duration: const Duration(seconds: 3),
    );
    globalkey.currentState?.showSnackBar(snackbar);
  }
  // void showSnackbar(String message) {
  //   final snackbar = SnackBar(
  //     content: Text(message),
  //     duration: Duration(seconds: 2),
  //   );
  //
  //   globalkey.currentState?.showSnackBar(snackbar);
  // }
  @override
  Widget build(BuildContext context) {
    return    WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: ScaffoldMessenger(
        key: globalkey,
        child: Scaffold(
          backgroundColor: whatsappBusinessColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign in to your\nAccount',
                        style: GoogleFonts.aladin(
                          color: Colors.white,
                          fontSize: 26
                        ),
                      ),
                      const SizedBox(height:5),
                      Text('sign in to your account',
                        style: GoogleFonts.aladin(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height:30),
                Expanded(child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(height: 60,),
                          Column(children: [
                            MyTextField(
                                hintText: 'Enter your email',
                                controller: emailController,
                                obsecureText: false,
                            ),
                            const SizedBox(height: 20,),

                            // MyTextField(
                            //     hintText: 'Enter your password',
                            //     controller: passwordController),
                            MyPasswordTextField(controller: passwordController),
                            const SizedBox(height: 10,),
                            InkWell(
                              onTap: (){},
                              child: Align(
                                child: Text('Forgot Password?',style: GoogleFonts.aladin(color: buttoncolor,fontSize: 20),),
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            RoundButton(title: 'Login',
                           loading: loading,
                              ontap: (){
                              validation1();

                              },
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text("didn't have an account?",
                                   style: GoogleFonts.aladin(color: Colors.black,fontSize: 18),),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                                 }, child: Text('Register',style: GoogleFonts.aladin(fontSize: 20,color: buttoncolor),)),
                              ],
                            ),
                          ],)
                        ],
                      ),
                    ),
                  ),

                ))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
