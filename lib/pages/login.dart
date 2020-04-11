import 'package:flutter/material.dart';
import 'package:thread/helper/helper.dart';
import 'package:thread/helper/routes.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

enum imageenum {
  successful,
  failed,
  idle,
}

bool isLoggedIn;

class LoginState extends State<Login> {
  String _assetImage = "assets/login/loginbg.jpeg";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double appwidth;
  double appheight;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberme = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    isLoggedIn = false;
    //usernameController.addListener(_printLatestValue);
    //passwordController.addListener(_printLatestValue);
    super.initState();
  }

  Future<bool> _loginfunction() {
    return Future.delayed(Duration(seconds: 4), () => true);
  }

  _credentialSubmitted(BuildContext context) {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      _checkLoginCredential(
          usernameController.text, passwordController.text, context);
    } else {
      _showSnackbar("Please check Password and Username");
    }
  }

  void _showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 2000),
      content: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(),
        ),
      ),
    ));
  }

  void _checkLoginCredential(
    String username,
    String password,
    BuildContext context,
  ) async {
    if (await _loginfunction()) {
      print("Second text field: $username");
      print("Second text field: $password");
      _showSnackbar("Logged in..!!");
      setState(() {
        _isLoading = false;
        //usernameController.text = "";
        //passwordController.text = "";
        //routeToDashboard(context,);
        routeToPage(
          action: NaivigationRoute.dashboard,
          context: context,
        );
      });
    }
  }

  Widget _getLoginLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "User Board",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: .6,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Username",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: .6,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onSubmitted: (_) {
                  //_credentialSubmitted(context);
                },
                controller: usernameController,
                cursorColor: Colors.white,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: "Username",
                  hintStyle: TextStyle(
                    letterSpacing: .6,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: .6,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onSubmitted: (_) {
                  //_credentialSubmitted(context);
                },
                controller: passwordController,
                cursorColor: Colors.white,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    letterSpacing: .6,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Forget Password?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: .6,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              bottomRight: const Radius.circular(40.0),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                value: _rememberme,
                activeColor: Colors.white,
                checkColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    _rememberme = !_rememberme;
                  });
                },
              ),
            ),
            Text(
              "Remember me",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            FlatButton(
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              onPressed: () {
                _credentialSubmitted(context);
              },
              child: Text(
                "Go:)",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textScaleFactor: 3,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    this.appwidth = MediaQuery.of(context).size.width;
    this.appheight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_assetImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: !_isLoading
                ? SingleChildScrollView(
                    child: _getLoginLayout(context),
                  )
                : getLoaderLayout(),
          ),
        ),
      ),

      //  Stack(
      //   fit: StackFit.expand,
      //   children: <Widget>[
      //     Image.asset(
      //       _assetImage,
      //       fit: BoxFit.cover,
      //     ),
      //     Center(
      //       child: Padding(
      //         padding: EdgeInsets.all(20),
      //         child: !_isLoading ? _getLoginLayout(context) : getLoaderLayout(),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
