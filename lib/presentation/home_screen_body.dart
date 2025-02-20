import 'package:flutter/material.dart';
import 'package:geexar/presentation/widgets/articales_section.dart';
import 'package:geexar/presentation/widgets/custom_text_field.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
              child: Text(
            "Search App",
            style: TextStyle(fontSize: 30, color: Color(0xFF6C3293)),
          )),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomTextField(
            hintText: "write your first keyword",
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomTextField(
            hintText: "write your second keyword",
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
        SliverFillRemaining(
          child: ArticalesSection(),
        )
      ],
    );
  }
}
