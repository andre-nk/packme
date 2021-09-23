part of "../pages.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.whiteColor,
        appBar: AppBar(
          backgroundColor: Palette.whiteColor,
          toolbarHeight: MQuery.height(0.07, context),
          title: GFont.out(title: "Profil", fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.chevron_left, color: Palette.blackColor),
          )
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is NotAuthenticated){
              Navigator.pushAndRemoveUntil(
                context,
                PageTransition(child: CTAAuthPage(), type: PageTransitionType.rightToLeftWithFade),
                (route) => false
              );
            } else if (state is VerifyEmailSent){
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
                        title: "Email verifikasi berhasil dikirim!",
                        fontSize: 18,
                        color: Palette.whiteColor
                      )
                    ),
                  ),
                )
              );
            }
          },
          builder: (context, state) {
            if(state is AuthSuccess){
              return SafeArea(
                child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(MQuery.height(0.025, context)),
                  width: MQuery.width(1, context),
                  height: MQuery.height(0.9, context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: MQuery.height(0.035, context),
                        backgroundColor: Palette.greenShade,
                        backgroundImage: NetworkImage(
                          state.user.profileURL ?? ""
                        ),
                      ),
                      SizedBox(height: MQuery.height(0.025, context)),
                      GFont.out(
                          title: state.user.name,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      SizedBox(height: MQuery.height(0.005, context)),
                      GFont.out(
                        title: state.user.email,
                        fontSize: 16,
                      ),
                      if (state.user.isEmailVerified)
                        SizedBox()
                      else
                        Column(
                          children: [
                            SizedBox(height: MQuery.height(0.02, context)),
                            GestureDetector(
                              onTap: (){
                                context.read<AuthCubit>().verifyEmail();
                              },
                              child: Container(
                                height: MQuery.height(0.04, context),
                                width: MQuery.width(0.7, context),
                                decoration: BoxDecoration(
                                  color: Palette.alertColor,
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                                ),
                                child: Center(
                                  child: GFont.out(
                                    title: "Verifikasi e-mail kamu dulu yuk!",
                                    color: Palette.whiteColor
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      SizedBox(height: MQuery.height(0.025, context)),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, PageTransition(child: ChangeNamePage(), type: PageTransitionType.rightToLeftWithFade));
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GFont.out(
                              title: "Nama",
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(width: 16),
                            Text(
                              "${state.user.name}",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Palette.blackColor.withOpacity(0.5)
                              )
                            ),
                          ],
                        ),
                        trailing: Icon(
                          CupertinoIcons.chevron_forward,
                          color: Palette.blackColor,
                          size: 20,
                        )
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                        title: Row(
                          children: [
                            GFont.out(
                              title: "E-mail",
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(width: 16),
                            Text(
                              "${state.user.email}",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Palette.blackColor.withOpacity(0.5)
                              )
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: (){
                          context.read<AuthCubit>().resetPassword(state.user.email);
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
                                    title: "E-mail pengganti kata sandi sudah dikirim ke akunmu!",
                                    fontSize: 18,
                                    color: Palette.whiteColor
                                  )
                                ),
                              ),
                            )
                          );
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                        title: GFont.out(
                          title: "Ubah kata sandi",
                          textAlign: TextAlign.start,
                        ),
                        trailing: Icon(
                          CupertinoIcons.chevron_forward,
                          color: Palette.blackColor,
                          size: 20,
                        )
                      ),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, PageTransition(child: ChangeAddressPage(), type: PageTransitionType.rightToLeftWithFade));
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                        title: GFont.out(
                          title: "Alamat",
                          textAlign: TextAlign.start,
                        ),
                        trailing: Icon(
                          CupertinoIcons.chevron_forward,
                          color: Palette.blackColor,
                          size: 20,
                        )
                      ),
                      ListTile(
                        onTap: (){
                          Navigator.push(context, PageTransition(child: QRCodePage(), type: PageTransitionType.rightToLeftWithFade));
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                        title: GFont.out(
                          title: "QR Code",
                          textAlign: TextAlign.start,
                        ),
                        trailing: Icon(
                          CupertinoIcons.chevron_forward,
                          color: Palette.blackColor,
                          size: 20,
                        )
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          if(state is AuthSuccess){
                            if(state.user.provider == "email"){
                              context.read<AuthCubit>().signOut();
                            } else if (state.user.provider == 'google'){
                              context.read<AuthCubit>().signOutWithGoogle();
                            }
                          }
                        },
                        title: GFont.out(
                          title: "Log out",
                          color: Palette.alertColor,
                          textAlign: TextAlign.start
                        ),
                      )
                    ],
                  )
                ),
              )
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: Palette.greenAccent)
            );
          }
        },
      )
    );
  }
}
