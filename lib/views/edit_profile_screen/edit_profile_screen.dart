import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/portfolios/portfolios_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const route = "EditProfileScreen";
  @override
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void initState() {
    PortfoliosCubit.get(context).getPortfolios();
    PortfoliosCubit.get(context).uploadPortfolio();

    super.initState();
  }

  @override
  void dispose() {
    print("Disposed");
    super.dispose();
  }
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var bioController = TextEditingController();
    var addressController = TextEditingController();
    var phoneNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: BlocConsumer<PortfoliosCubit, PortfoliosState>(
        listener: (context, state) {
          if (state is SuccessGetPortfoliosState) {
            print(state);
          }
          if (state is FailedGetPortfoliosState) {
            print(state);
          }
        },
        builder: (context, state) {
          if (state is FailedGetPortfoliosState) {
            return Center(
              child: Text("Error"),
            );
          } else if (state is SuccessGetPortfoliosState) {
            return ListView.builder(
              itemCount:1,
                  // PortfoliosCubit.get(context).portfoliosPortfolios.length,
              itemBuilder: (BuildContext context, int index) {
                final portfolio =
                    PortfoliosCubit.get(context).portfoliosPortfolios[index];
                final profile =
                    PortfoliosCubit.get(context).portfoliosProfile[index];
                // nameController.text = profile.name!;
                // bioController.text = profile.bio!;
                // addressController.text = profile.address!;
                // phoneNumberController.text = profile.mobile!;
                // print("This is :${portfolio.name}");
                // print(portfolio.image);
                // print(portfolio.id);
                // print(portfolio.userId);
                // print(portfolio.cvFile);
                // print(portfolio.data!.profile!.name);
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              child: CircleAvatar(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Opacity(
                                    opacity: 0.7,
                                    child: Image.network(
                                      portfolio.image!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              child: Image.asset("assets/images/camera.png"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          PortfoliosCubit.get(context).pickImage();
                        },
                        child: Text(
                          "Change photo",
                          style:
                              TextStyle(color: Color(0xFF3366FF), fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: ()async {
                          PortfoliosCubit.get(context).uploadPortfolio();
                        },
                        child: Text(
                          "Upload Image",
                          style:
                              TextStyle(color: Color(0xFF3366FF), fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Form(
                            // key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      hintText: profile.name,
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Bio",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey)),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: bioController,
                                  decoration: InputDecoration(
                                      hintText: profile.bio,
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Address",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey)),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                      hintText: profile.address,
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("No.Handphone",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey)),
                                TextFormField(
                                  controller: phoneNumberController,
                                  decoration: InputDecoration(
                                      hintText: profile.mobile,
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text("Save"))
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
