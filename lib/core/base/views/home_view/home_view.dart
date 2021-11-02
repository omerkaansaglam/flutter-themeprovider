import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoappsample/core/base/ui/components/change_theme_button_widget.dart';
import 'package:twoappsample/core/base/views/home_view/home_view_story_data.dart';
import 'package:twoappsample/core/base/views/navigation_view/navigation_view.dart';
import 'package:twoappsample/core/extensions/constants/image_constant.dart';
import 'package:twoappsample/core/init/provider/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) => Scaffold(
  //       appBar: AppBar(
  //         iconTheme: Theme.of(context).iconTheme,
  //         backgroundColor: Colors.transparent,
  //         leading: Icon(Icons.menu),
  //         title: Text(MyApp.title),
  //         elevation: 0,
  //         actions: [
  //           ChangeThemeButtonWidget(),
  //         ],
  //       ),
  //       body: ProfileWidget(),
  //       extendBody: true,
  //       bottomNavigationBar: NavigationBarWidget(),
  //     );

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'Youtube Dark'
        : 'Instagram Light';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: StoryFakeListData.storyFrontImage.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    child:  Image(
                                      image: NetworkImage(StoryFakeListData.storyFrontImage[index]),
                                      fit: BoxFit.cover,
                                      width: 50,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  Text(StoryFakeListData.storyName[index]),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Expanded(flex:8,child: Container())
            ],
          )),
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}
