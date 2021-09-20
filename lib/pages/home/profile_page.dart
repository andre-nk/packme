part of "../pages.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.whiteColor,
        appBar: AppBar(
          backgroundColor: Palette.whiteColor,
          toolbarHeight: MQuery.height(0.07, context),
          title: GFont.out(
            title: "Profil",
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.chevron_left,
              color: Palette.blackColor
            ),
          )
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(
              MQuery.height(0.025, context)
            ),
            width: MQuery.width(1, context),
            height: MQuery.height(0.9, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MQuery.height(0.035, context),
                  backgroundColor: Palette.greenShade,
                  backgroundImage: NetworkImage(user.photoURL ?? ""),
                ),
                SizedBox(height: MQuery.height(0.025, context)),
                GFont.out(
                  title: user.displayName,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                SizedBox(height: MQuery.height(0.005, context)),
                GFont.out(
                  title: user.email,
                  fontSize: 16,
                ),
                if (user.emailVerified)
                SizedBox()
                else
                Column(
                  children: [
                    SizedBox(height: MQuery.height(0.02, context)),
                    Container(
                      height: MQuery.height(0.04, context),
                      width: MQuery.width(0.7, context),
                      decoration: BoxDecoration(
                        color: Palette.alertColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: Center(
                        child: GFont.out(
                          title: "Verifikasi nomor telepon dan e-mail dulu yuk!",
                          color: Palette.whiteColor
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: MQuery.height(0.025, context)),
                ExpansionTile(
                  iconColor: Palette.greenAccent,
                  title: GFont.out(
                    title: "Nama pengguna",
                    textAlign: TextAlign.start,
                  ),
                ),
                ExpansionTile(
                  iconColor: Palette.greenAccent,
                  title: GFont.out(
                    title: "Ubah kata sandi",
                    textAlign: TextAlign.start
                  ),
                ),
                ExpansionTile(
                  iconColor: Palette.greenAccent,
                  title: GFont.out(
                    title: "Alamat",
                    textAlign: TextAlign.start
                  ),
                ),
                ListTile(
                  title: GFont.out(
                    title: "Hapus akun",
                    color: Palette.alertColor,
                    textAlign: TextAlign.start
                  ),
                ),
                ListTile(
                  onTap: (){
                    context.read<AuthCubit>().signOut();
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
      )
    );
  }
}