import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:github_app/common/Git.dart';
import 'package:github_app/common/Global.dart';
import 'package:github_app/l10n/localization_intl.dart';
import 'package:github_app/models/index.dart';
import 'package:github_app/states/UserModel.dart';
import 'package:provider/provider.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin ?? "";
    if (_unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(gm?.login ?? "Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: gm?.userName,
                    hintText: gm?.userNameOrEmail,
                    prefixIcon: Icon(Icons.person),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v == null || v.trim().isEmpty
                        ? gm?.userNameRequired
                        : null;
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: gm?.password,
                    hintText: gm?.password,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                //校验密码（不能为空）
                validator: (v) {
                  return v == null || v.trim().isEmpty
                      ? gm?.passwordRequired
                      : null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    onPressed: _onLogin,
                    child: Text(gm?.login ?? "login"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      EasyLoading.show(status: 'loading...');
      User? user;
      try {
        user = await Git(context)
            .login(_unameController.text, _pwdController.text);
        // 因为登录页c返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        //登录失败则提示
        EasyLoading.showToast(e.toString());
      } finally {
        // 隐藏loading框
        EasyLoading.dismiss();
      }
      if (user != null) {
        // 返回
        Navigator.of(context).pop();
      }
    }
  }
}
