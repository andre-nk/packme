part of '../pages.dart';

class OnboardingPages extends StatefulWidget {
  @override
  _OnboardingPagesState createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  PageController _controller = PageController();
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Take-away!",
      "text": "Take-away di merchant favorit kamu dan jangan lupa pakai kemasan PackMe ya!",
      // "image": "assets/images/splash_1.png"
    },
    {
      "title": "Kembalikan kemasan!",
      "text": "Bisa di pick-up atau drop-off, \n jangan lupa ya kembalikan kemasan PackMe!",
      // "image": "assets/images/splash_2.png"
    },
    {
      "title": "Klaim bonusnya!",
      "text": "Dapatkan bonus sampai Rp 10.000 \n per kemasan PackMe yang kamu kembalikan!",
      // "image": "assets/images/splash_3.png"
    },
  ];

  Future<void> onGetStarted(BuildContext context) async {
    final onboardingViewModel = context.read(onboardingViewModelProvider);
    await onboardingViewModel.completeOnboarding();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MQuery.width(0.05, context)),
                  child: TextButton(
                    child: GFont.out(title: "Lewati", fontSize: 16),
                    onPressed: () {
                      onGetStarted(context);
                      Get.offAndToNamed("/auth");
                      Get.to(() => CTAAuthPage(), transition: Transition.cupertino);
                    },
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 40,
                child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) {
                      return SplashContent(
                        // image: splashData[index]["image"],
                        title: splashData[index]['title'] ?? "Untitled",
                        description: splashData[index]['text'] ?? "Description",
                      );
                    }),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MQuery.width(0.05, context)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: MQuery.height(0.08, context),
                        padding: EdgeInsets.only(
                            bottom: MQuery.height(0.005, context)),
                        child: DefaultButton(
                          color: currentPage.isEven
                            ? Palette.greenAccent
                            : Palette.pinkAccent,
                          method: () {
                            if(currentPage == splashData.length - 1){
                              onGetStarted(context);
                              Get.offAndToNamed("/auth");
                            } else {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOut
                              );   
                            }          
                          },
                          title: GFont.out(
                            title: currentPage == splashData.length - 1 ? "Mulai yuk!" :"Lanjut",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Palette.whiteColor
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
