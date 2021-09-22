part of "../pages.dart";

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return BackFramePage(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                left: MQuery.width(0.05, context),
                bottom: MQuery.width(0.05, context),
                right: MQuery.width(0.05, context),
                top: MQuery.height(0.005, context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFont.out(
                  title: "Masukkan nama baru kamu",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: MQuery.height(0.025, context)),
                TextFormField(
                  cursorColor: Palette.greenWidget,
                  controller: emailController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "Nama baru",
                    hintStyle: GFont.style(color: Colors.grey),
                    labelText: "Nama baru",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(height: 2, fontSize: 18),
                ),
                SizedBox(
                  height: MQuery.height(0.1, context),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: MQuery.height(0.01, context)),
                  width: MQuery.width(0.475, context),
                  height: MQuery.height(0.075, context),
                  child: DefaultButton(
                    title: GFont.out(
                      title: "Ganti nama",
                      fontSize: 20,
                      color: Palette.whiteColor,
                      fontWeight: FontWeight.bold
                    ),
                    method: () async {
                      if (emailController.text != "" && state is AuthSuccess){
                        context.read<AuthCubit>().changeDisplayName(
                          emailController.text.trim(),
                          state.user
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Palette.successColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: Container(
                              height: MQuery.height(0.03, context),
                              child: Center(
                                child: GFont.out(
                                  title: "Nama berhasil diganti",
                                  fontSize: 18,
                                  color: Palette.whiteColor
                                )
                              ),
                            ),
                          )
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Palette.alertColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          behavior: SnackBarBehavior.floating,
                          content: Container(
                            height: MQuery.height(0.03, context),
                            child: Center(
                              child: GFont.out(
                                title: "Isi e-mail kamu terlebih dahulu!",
                                fontSize: 18,
                                color: Palette.whiteColor
                              ),
                            )
                          ),
                        ));
                      }
                    },
                    color: Palette.pinkAccent,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
