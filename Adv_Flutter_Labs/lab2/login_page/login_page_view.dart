import 'package:advance_flutter_lab/lab2/login_page/login_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final _formKey = GlobalKey<FormState>();

  LoginController _loginController = LoginController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerNumber = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerConfirmPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text(APPBAR_TITLE_OF_SIGN_UP_PAGE_VIEW),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                validator: (value) => _loginController.validateName(value),

                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)
                  ),
                  hintText: "Enter Name",
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) => _loginController.validateEmail(value),
                controller: _controllerEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Enter Email"
                ),

              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) => _loginController.validateNumber(value),
                controller: _controllerNumber,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)
                    ),
                    hintText: "Enter Number"
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) => _loginController.validatePassword(value),
                controller: _controllerPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)
                    ),
                    hintText: "Enter Password"
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value){
                  return _loginController.validateConfrimPassword(value, _controllerPassword.text);
                },
                controller: _controllerConfirmPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)
                    ),
                    hintText: "Enter Confirm Password"
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed:  () {
                if(_formKey.currentState!.validate()){
                    Map<String , dynamic> map = {};
                    map[SIGN_UP_NAME] = _controllerName.text.toString();
                    map[SIGN_UP_Email] = _controllerEmail.text.toString();
                    map[SIGN_UP_NUMBER] = _controllerNumber.text.toString();
                    map[SIGN_UP_PASSWORD] = _controllerPassword.text.toString();
                    map[SIGN_UP_CONFIRM_PASSWORD] = _controllerConfirmPassword.text.toString();

                    _loginController.addUser(map);
                    print(map);
                    debugPrint(_loginController.getUserList().toString());
                    print("User added successfully");
                  }
                }, child: Text(BTN_SIGN_UP_TEXT)
              )
            ],
          ),
        ),
      ),
    );
  }
}
