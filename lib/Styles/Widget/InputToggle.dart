//import 'package:flutter/foundation.dart'
//    show ValueListenable; // should be exported by widgets
//import 'package:flutter/material.dart';
////import 'package:provider/provider.dart';
//
//void main() {
//  runApp(Provider<LoginApi>(
//    value: LoginApiImpl(),
//    child: TestApp(),
//  ));
//}
//
//class TestApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.indigo,
//        accentColor: Colors.pink,
//      ),
//      home: LoginScreen(),
//    );
//  }
//}
//
//abstract class LoginApi {
//  Future<void> performLogin(String username, String password);
//}
//
//class LoginApiImpl extends LoginApi {
//  @override
//  Future<void> performLogin(String username, String password) async {
//    print('Username: $username\nPassword: $password');
//    await Future.delayed(const Duration(seconds: 3));
//  }
//}
//
//abstract class LoginLogic {
//  LoginLogic();
//
//  LoginApi api;
//
//  Key get formKey;
//
//  ValueListenable<bool> get formEnabled;
//
//  void onFormChanged();
//
//  void saveFullName(String value);
//
//  void saveUsername(String value);
//
//  void savePassword(String value);
//
//  String validateFullNameField(String value);
//
//  String validateUsernameField(String value);
//
//  String validatePasswordField(String value);
//
//  Future<void> onNextPressed();
//}
//
//class LoginLogicImpl extends LoginLogic {
//  LoginLogicImpl() : super();
//
//  final _formKey = GlobalKey<FormState>();
//  final _formEnabled = ValueNotifier<bool>(true);
//
//  String _fullName;
//  String _username;
//  String _password;
//
//  Key get formKey => _formKey;
//
//  ValueListenable<bool> get formEnabled => _formEnabled;
//
//  void onFormChanged() => _formKey.currentState.validate();
//
//  void saveFullName(String value) => _fullName = value;
//
//  void saveUsername(String value) => _username = value;
//
//  void savePassword(String value) => _password = value;
//
//  @override
//  String validateFullNameField(String value) {
//    return value.isEmpty ? 'Full Name required' : null;
//  }
//
//  @override
//  String validateUsernameField(String value) {
//    return value.isEmpty ? 'Username required' : null;
//  }
//
//  @override
//  String validatePasswordField(String value) {
//    if (value?.isEmpty ?? true) {
//      return 'Password required';
//    }
//    if (value.length < 5) {
//      return 'Password must be longer than 5 characters.';
//    }
//    return null;
//  }
//
//  @override
//  Future<void> onNextPressed() async {
//    final state = _formKey.currentState;
//    if (!state.validate()) {
//      return;
//    }
//    state.save();
//    _formEnabled.value = false;
//    print('Fullname: $_fullName');
//    await api.performLogin(_username, _password);
//    _formEnabled.value = true;
//  }
//}
//
//class LoginScreen extends StatefulWidget {
//  @override
//  _LoginScreenState createState() => _LoginScreenState();
//}
//
//class _LoginScreenState extends State<LoginScreen> {
//  final logic = LoginLogicImpl();
//  final _focusFullName = FocusNode();
//  final _focusUsername = FocusNode();
//  final _focusPassword = FocusNode();
//
//  @override
//  void initState() {
//    super.initState();
//    //
//  }
//
//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    logic.api = Provider.of<LoginApi>(context);
//  }
//
//  @override
//  void dispose() {
//    _focusPassword.dispose();
//    _focusUsername.dispose();
//    _focusFullName.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      resizeToAvoidBottomInset: false,
//      appBar: AppBar(
//        title: Row(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Text('Input Password Toggle'),
//            SizedBox(width: 12.0),
//            Icon(Icons.visibility_off),
//          ],
//        ),
//      ),
//      body: Form(
//        key: logic.formKey,
//        onChanged: logic.onFormChanged,
//        child: PageScrollContent(
//          aboveKeyboard: (BuildContext context) {
//            return BottomKeyboardBar(
//              child: FlatButton(
//                onPressed: logic.onNextPressed,
//                textColor: Theme.of(context).primaryColor,
//                child: const Text('NEXT'),
//                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
//                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//              ),
//            );
//          },
//          child: ValueListenableBuilder<bool>(
//            valueListenable: logic.formEnabled,
//            builder: (BuildContext context, bool formEnabled, Widget child) {
//              return Center(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    TextFormField(
//                      key: Key('fullname'),
//                      focusNode: _focusFullName,
//                      enabled: formEnabled,
//                      keyboardType: TextInputType.text,
//                      textInputAction: TextInputAction.next,
//                      onSaved: logic.saveFullName,
//                      validator: logic.validateFullNameField,
//                      onFieldSubmitted: (_) =>
//                          FocusScope.of(context).requestFocus(_focusUsername),
//                      decoration: InputDecoration(
//                        labelText: 'Your name',
//                        border: OutlineInputBorder(),
//                      ),
//                    ),
//                    AppWidget.SizeBoxH16,
//                    TextFormField(
//                      key: Key('username'),
//                      focusNode: _focusUsername,
//                      enabled: formEnabled,
//                      keyboardType: TextInputType.text,
//                      textInputAction: TextInputAction.next,
//                      onSaved: logic.saveUsername,
//                      validator: logic.validateUsernameField,
//                      onFieldSubmitted: (_) =>
//                          FocusScope.of(context).requestFocus(_focusPassword),
//                      decoration: InputDecoration(
//                        labelText: 'Your username',
//                        border: OutlineInputBorder(),
//                      ),
//                    ),
//                    AppWidget.SizeBoxH16,
//                    PasswordFormField(
//                      key: Key('password'),
//                      focusNode: _focusPassword,
//                      enabled: formEnabled,
//                      onSaved: logic.savePassword,
//                      validator: logic.validatePasswordField,
//                      onFieldSubmitted: (_) => logic.onNextPressed(),
//                      initialVisible: true,
//                    ),
//                    SizedBox(height: 32.0),
//                    ProgressButton(
//                      onPressed: logic.onNextPressed,
//                      showProgress: !formEnabled,
//                      child: Text('NEXT'),
//                    ),
//                  ],
//                ),
//              );
//            },
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BottomKeyboardBar extends StatelessWidget {
//  const BottomKeyboardBar({
//    Key key,
//    this.child,
//  }) : super(key: key);
//
//  final Widget child;
//
//  @override
//  Widget build(BuildContext context) {
//    return BottomAppBar(
//      child: Align(
//        alignment: Alignment.bottomRight,
//        child: child,
//      ),
//    );
//  }
//}
//
//class PageScrollContent extends StatelessWidget {
//  const PageScrollContent({
//    Key key,
//    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
//    this.aboveKeyboard,
//    this.child,
//  })  : assert(padding != null),
//        super(key: key);
//
//  final EdgeInsets padding;
//  final WidgetBuilder aboveKeyboard;
//  final Widget child;
//
//  @override
//  Widget build(BuildContext context) {
//    return LayoutBuilder(
//      builder: (BuildContext context, BoxConstraints constraints) {
//        final mediaQuery = MediaQuery.of(context);
//        return Padding(
//          padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
//          child: Stack(
//            children: <Widget>[
//              SingleChildScrollView(
//                padding: padding,
//                child: ConstrainedBox(
//                  constraints: constraints.copyWith(
//                    minHeight: constraints.maxHeight -
//                        padding.vertical -
//                        mediaQuery.viewInsets.bottom,
//                  ),
//                  child: IntrinsicHeight(
//                    child: child,
//                  ),
//                ),
//              ),
//              (mediaQuery.viewInsets.bottom > 0.0)
//                  ? Positioned(
//                      left: 0.0,
//                      right: 0.0,
//                      bottom: 0.0,
//                      child: aboveKeyboard(context),
//                    )
//                  : const SizedBox(),
//            ],
//          ),
//        );
//      },
//    );
//  }
//}
//
//class ProgressButton extends StatelessWidget {
//  const ProgressButton({
//    Key key,
//    this.onPressed,
//    this.child,
//    this.showProgress = false,
//  })  : assert(showProgress != null),
//        super(key: key);
//
//  final VoidCallback onPressed;
//  final Widget child;
//  final bool showProgress;
//
//  @override
//  Widget build(BuildContext context) {
//    final theme = Theme.of(context);
//    final buttonTheme = ButtonTheme.of(context);
//    return RaisedButton(
//      color: theme.primaryColor,
//      disabledColor: theme.primaryColor,
//      textColor: theme.primaryTextTheme.button.color,
//      onPressed: showProgress ? null : onPressed,
//      shape: showProgress ? const CircleBorder() : buttonTheme.shape,
//      child: Padding(
//        padding: const EdgeInsets.all(2.0),
//        child: showProgress ? const CircularProgressIndicator() : child,
//      ),
//    );
//  }
//}
//
//class PasswordFormField extends FormField<String> {
//  PasswordFormField({
//    Key key,
//    bool enabled = true,
//    this.initialVisible = false,
//    FocusNode focusNode,
//    ValueChanged<String> onFieldSubmitted,
//    FormFieldSetter<String> onSaved,
//    FormFieldValidator<String> validator,
//  })  : assert(initialVisible != null),
//        super(
//          key: key,
//          enabled: enabled,
//          onSaved: onSaved,
//          validator: validator,
//          builder: (FormFieldState<String> field) {
//            final _PasswordFormFieldState state = field;
//            return TextField(
//              focusNode: focusNode,
//              decoration: InputDecoration(
//                labelText: 'Your password',
//                errorText: field.errorText,
//                border: OutlineInputBorder(),
//                suffixIcon: GestureDetector(
//                  onTap: state._togglePasswordVisibility,
//                  child: Icon(
//                      state._visible ? Icons.visibility : Icons.visibility_off),
//                ),
//              ),
//              keyboardType: TextInputType.text,
//              textInputAction: TextInputAction.next,
//              obscureText: state._visible,
//              enabled: enabled,
//              maxLines: 1,
//              onChanged: field.didChange,
//              onSubmitted: onFieldSubmitted,
//            );
//          },
//        );
//
//  final bool initialVisible;
//
//  @override
//  _PasswordFormFieldState createState() => _PasswordFormFieldState();
//}
//
//class _PasswordFormFieldState extends FormFieldState<String> {
//  bool _visible;
//
//  @override
//  PasswordFormField get widget => super.widget;
//
//  @override
//  void initState() {
//    super.initState();
//    _visible = widget.initialVisible;
//  }
//
//  void _togglePasswordVisibility() {
//    setState(() => _visible = !_visible);
//  }
//}
