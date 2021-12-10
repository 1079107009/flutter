import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_app/l10n/localization_intl.dart';
import 'package:github_app/models/index.dart';
import 'package:github_app/states/UserModel.dart';
import 'package:github_app/widget/MyDrawer.dart';
import 'package:github_app/widget/RepoItem.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context)?.home ?? ""),
      ),
      body: _buildBody(context), // 构建主页面
      drawer: MyDrawer(), //抽屉菜单
    );
  }
}

Widget _buildBody(BuildContext context) {
  UserModel userModel = Provider.of<UserModel>(context);
  if (!userModel.isLogin) {
    //用户未登录，显示登录按钮
    return Center(
      child: ElevatedButton(
        child: Text(GmLocalizations.of(context)?.login ?? ""),
        onPressed: () => Navigator.of(context).pushNamed("login"),
      ),
    );
  } else {
    //已登录，则展示项目列表
    return InfiniteListView.builder(
      // onRetrieveData: (int page, List<Repo> items, bool refresh) async {
      //   var data = await Git(context).getRepos(
      //     refresh: refresh,
      //     queryParameters: {
      //       'page': page,
      //       'page_size': 20,
      //     },
      //   );
      //   if (data == null || data.isEmpty) {
      //     return false;
      //   }
      //   //把请求到的新数据添加到items中
      //   items.addAll(data);
      //   // 如果接口返回的数量等于'page_size'，则认为还有数据，反之则认为最后一页
      //   return data.length == 20;
      // },
      itemBuilder: (BuildContext ctx, int index) {
        // 项目信息列表项
        return RepoItem(Repo());
      },
    );
  }
}

Widget gmAvatar(
  String url, {
  double width = 30,
  double height = 0,
  BoxFit? fit,
  BorderRadius? borderRadius,
}) {
  var placeholder = Image.asset("assets/images/github-fill.png", //头像占位图，加载过程中显示
      width: width,
      height: height);
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => placeholder,
    ),
  );
}
