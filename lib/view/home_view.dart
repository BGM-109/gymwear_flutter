import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymwear_app/core/scroll_service.dart';
import 'package:gymwear_app/view/widgets/banner.dart';
import 'package:gymwear_app/view/widgets/card.dart';
import 'package:gymwear_app/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gymwear_app/assets/constants.dart' as Constants;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 100) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return Scaffold(
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                onPressed: () => {ScrollService.scrollToTop(_scrollController)},
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.black,
                ),
              ),
        appBar: AppBar(
          title: const Text(
            "Gymwear Finder 🚀",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse(Constants.GITREPO_LINK));
              },
              icon: const FaIcon(
                FontAwesomeIcons.github,
                color: Colors.black,
                size: 16.0,
              ),
            )
          ],
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(4.0),
              child: Divider(
                height: 1.0,
              )),
        ),
        body: vm.isLoad
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView(
                controller: _scrollController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
                children: [
                  const CustomBanner(),
                  Text(
                    "${vm.gymwears.length}개의 브랜드",
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ...vm.gymwears.map((obj) => CustomCard(gm: obj)).toList(),
                  const Divider(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Created with 💖 by ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(Constants.GITHUB_LINK));
                          },
                          child: const Text(
                            "@BGM-109",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}
