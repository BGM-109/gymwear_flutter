import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymwear_app/view/widgets/banner.dart';
import 'package:gymwear_app/view/widgets/card.dart';
import 'package:gymwear_app/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.getGymwears();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Gymwear Finder 🚀",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
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
                  ...vm.gymwears.map((obj) => CustomCard(gm: obj)).toList()
                ],
              ));
  }
}
