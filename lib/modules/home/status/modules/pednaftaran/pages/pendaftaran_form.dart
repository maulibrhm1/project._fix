part of 'pendaftaran.dart';

class FormPendaftaran extends StatefulWidget {
  const FormPendaftaran({Key? key}) : super(key: key);

  @override
  State<FormPendaftaran> createState() => _FormPendaftaranState();
}

class _FormPendaftaranState extends State<FormPendaftaran> {
  PlatformFile? pickedFile;
  UploadTask? task;
  File? file;

  int index = 0;
  int selectedIndex = 0;

  bool isShowed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Pendaftarn'),
          centerTitle: true,
          backgroundColor: AppTheme.primaryColor,
          // ignore: prefer_const_literals_to_create_immutables
        ),
        body: Background(
          child: RemoveFocuse(
            onClick: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ListView(children: [
              index == 0
                  ? _page1(context)
                  : index == 1
                      ? _page2(context)
                      : index == 2
                          ? _page3(context)
                          : _page4(context)
            ]),
          ),
        ));
  }

  _page1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        children: [
          CommonTextFieldView(
            controller: biodataController[0],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText: "Nama Lengkap:",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          CommonTextFieldView(
            controller: biodataController[1],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText: "NIK (Nomor Induk Kependudukan):",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          CommonTextFieldView(
            controller: biodataController[2],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText: "Email:",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jenis Kelamin:",
                  style: TextStyles(context).getRegularStyle(),
                ),
                Column(
                  children: [
                    RadioListTile(
                      title: _radioText(
                          context, "Laki-laki", biodataController[3]!),
                      groupValue: group[1],
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          group[1] = value as int;
                        });
                      },
                      activeColor: AppTheme.primaryColor,
                    ),
                    RadioListTile(
                      title: _radioText(
                          context, "Perempuan", biodataController[4]!),
                      groupValue: group[1],
                      value: 2,
                      onChanged: (value) {
                        setState(() {
                          group[1] = value as int;
                        });
                      },
                      activeColor: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CommonTextFieldView(
            controller: biodataController[5],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText: "No. HP (nomor aktif dan terhubung WA):",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          CommonTextFieldView(
            controller: biodataController[6],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText: "Asal Sekolah/Kampus: ",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          CommonTextFieldView(
            controller: biodataController[7],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText: "Program Studi:",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          CommonTextFieldView(
            controller: biodataController[8],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText: "Nama Kota/Daerah tempat tinggal anda saat ini:",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          CommonTextFieldView(
            controller: biodataController[47],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText: "Mengapa Anda ingin Magang/PKL disini",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jenis Magang apa yang Anda pilih:",
                  style: TextStyles(context).getRegularStyle(),
                ),
                const SizedBox(height: 20),
                RadioListTile(
                    title: _radioText(
                        context,
                        "Magang Mandiri (bukan kewajiban kampus)",
                        biodataController[9]!),
                    activeColor: AppTheme.primaryColor,
                    value: 1,
                    groupValue: group[2],
                    onChanged: (value) {
                      setState(() {
                        group[2] = value as int;
                      });
                    }),
                RadioListTile(
                    title: _radioText(
                        context,
                        "Magang Kampus (kewajiban atau program kampus)",
                        biodataController[10]!),
                    activeColor: AppTheme.primaryColor,
                    value: 2,
                    groupValue: group[2],
                    onChanged: (value) {
                      setState(() {
                        group[2] = value as int;
                      });
                    }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sistem Magang:",
                  style: TextStyles(context).getRegularStyle(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RadioListTile(
                        title: _radioText(context, "WFO (Work From Office",
                            biodataController[11]!),
                        activeColor: AppTheme.primaryColor,
                        value: 1,
                        groupValue: group[3],
                        onChanged: (value) {
                          setState(() {
                            group[3] = value as int;
                          });
                        }),
                    RadioListTile(
                        title: _radioText(context, "WFH Work From Home",
                            biodataController[12]!),
                        activeColor: AppTheme.primaryColor,
                        value: 2,
                        groupValue: group[3],
                        onChanged: (value) {
                          setState(() {
                            group[3] = value as int;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status Anda saat ini:",
                  style: TextStyles(context).getRegularStyle(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RadioListTile(
                        title: _radioText(context, "Masih sekolah/Masih Kuliah",
                            biodataController[13]!),
                        activeColor: AppTheme.primaryColor,
                        value: 1,
                        groupValue: group[4],
                        onChanged: (value) {
                          setState(() {
                            group[4] = value as int;
                          });
                        }),
                    RadioListTile(
                        title: _radioText(
                            context,
                            "Sudah lulus Sekolah/Kuliah dan belum bekerja",
                            biodataController[14]!),
                        activeColor: AppTheme.primaryColor,
                        value: 2,
                        groupValue: group[4],
                        onChanged: (value) {
                          setState(() {
                            group[4] = value as int;
                          });
                        }),
                    RadioListTile(
                        title: _radioText(
                            context,
                            "Sudah lulus dan sedang bekerja",
                            biodataController[15]!),
                        activeColor: AppTheme.primaryColor,
                        value: 3,
                        groupValue: group[4],
                        onChanged: (value) {
                          setState(() {
                            group[4] = value as int;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
          CommonButton(
            buttonText: "Next",
            onTap: () {
              setState(() {
                index++;
              });
            },
          )
        ],
      ),
    );
  }

  _page2(BuildContext context) {
    final bioController =
        TextEditingController(text: programMagang[selectedIndex]);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Apakah Anda bisa membaca buku bahasa inggris:",
                style: TextStyles(context).getRegularStyle(),
              ),
              const SizedBox(height: 20),
              RadioListTile(
                  title: _radioText(
                      context, "Saya bisa", biodataController[16]!,
                      maxLines: 1),
                  activeColor: AppTheme.primaryColor,
                  value: 1,
                  groupValue: group[5],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      group[5] = value as int;
                    });
                  }),
              RadioListTile(
                  title: _radioText(
                      context,
                      "Saya kurang bisa\n(Bisa sedikit-sedikit)",
                      biodataController[17]!),
                  activeColor: AppTheme.primaryColor,
                  value: 2,
                  groupValue: group[5],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      group[5] = value as int;
                    });
                  }),
              RadioListTile(
                  title: _radioText(
                      context, "Saya tidak bisa", biodataController[18]!),
                  activeColor: AppTheme.primaryColor,
                  value: 3,
                  groupValue: group[5],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      group[5] = value as int;
                    });
                  }),
            ],
          ),
        ),
        CommonTextFieldView(
          controller: biodataController[46],
          width: size.width * 0.7,
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
          onChanged: (String txt) {},
          color: Colors.grey[300],
          titleText:
              "No. HP Aktif / WA Dosen atau Guru Pembimbing PKL/Magang beserta Nama dan Jabatan :",
        ),
        CommonTextFieldView(
            width: size.width * 0.7,
            controller: bioController,
            hintText: programMagang[selectedIndex],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            onChanged: (String txt) {},
            color: Colors.grey[300],
            titleText: "Program Magang/PKL apa yang Anda minati :",
            widget: GestureDetector(
                onTap: () {
                  setState(() {
                    if (isShowed == false) {
                      isShowed = true;
                    } else {
                      isShowed = false;
                    }
                  });
                },
                child: isShowed == true
                    ? const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                      )
                    : const Icon(
                        Icons.arrow_drop_up,
                        size: 30,
                      ))),
        isShowed == false
            ? Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.black.withOpacity(0.6),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      width: MediaQuery.of(context).size.width * 0.7,
                      color: Colors.grey[300],
                      child: Scrollbar(
                        hoverThickness: 2,
                        thickness: 10,
                        child: ListView.builder(
                          itemCount: programMagang.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: false,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: InkWell(
                                  radius: 20,
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      isShowed = true;
                                    });
                                  },
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.66,
                                      child: Text(programMagang[index],
                                          style: TextStyles(context)
                                              .getRegularStyle()))),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              )
            : Container(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hari magang adalah Senin-Sabtu. Silakan pilih jam kerja magang yang Anda sanggupi :",
                style: TextStyles(context).getRegularStyle(),
              ),
              const SizedBox(height: 20),
              RadioListTile(
                  title: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: _radioText(
                          context,
                          "09:00-17:00 (sudah termasuk 1 jam istirahat didalamnya)",
                          biodataController[19]!)),
                  activeColor: AppTheme.primaryColor,
                  value: 1,
                  groupValue: group[6],
                  onChanged: (value) {
                    setState(() {
                      group[6] = value as int;
                    });
                  }),
              RadioListTile(
                  title: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: _radioText(
                        context,
                        "013:00-21:00 (sudah termasuk 1 jam istirahat didalamnya)",
                        biodataController[20]!),
                  ),
                  activeColor: AppTheme.primaryColor,
                  value: 2,
                  groupValue: group[6],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      group[6] = value as int;
                    });
                  }),
            ],
          ),
        ),
        CommonTextFieldView(
            width: size.width * 0.7,
            controller: biodataController[21],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            onChanged: (String txt) {},
            color: Colors.grey[300],
            titleText:
                "Jika Anda memilih minat program magang di Disain Grafis atau UI/UX Designer, "
                "software design apa saja yang Anda kuasai ? (jika minat Anda bukan ini, cukup "
                "diisi dg strip '-') :"),
        CommonTextFieldView(
            width: size.width * 0.7,
            controller: biodataController[22],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            onChanged: (String txt) {},
            color: Colors.grey[300],
            titleText: "Jika Anda memilih minat program magang Videografer, "
                "software editing video yang Anda kuasai apa saja? "
                "(jika minat Anda bukan ini, cukup diisi dg strip ' -' :"),
        CommonTextFieldView(
            width: size.width * 0.7,
            controller: biodataController[23],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            onChanged: (String txt) {},
            color: Colors.grey[300],
            titleText: "Jika Anda memilih minat program magang Programmer, "
                "Bahasa pemrograman apa saja yang sudah anda kuasai? "
                "(jika minat Anda bukan ini, cukup diisi dg strip ' -' :"),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CommonButton(
              width: size.width * 0.3,
              buttonText: "Back",
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            CommonButton(
              width: size.width * 0.3,
              buttonText: "Next",
              onTap: () {
                setState(() {
                  index++;
                });
              },
            )
          ],
        )
      ]),
    );
  }

  _page3(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jika Anda memilih minat program magang Digital Marketing,"
                  "materi mana yang anda ingin praktikan? "
                  "(jika minat Anda bukan ini, cukup pilih opsi 'other'):",
                  style: TextStyles(context).getRegularStyle(),
                  textAlign: TextAlign.start,
                ),
                RadioListTile(
                    title: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: size.width * 0.5,
                      child: _radioText(
                          context,
                          "Digital marketing organic. Nb : Free tanpa dana untuk beriklan",
                          biodataController[24]!),
                    ),
                    activeColor: AppTheme.primaryColor,
                    value: 1,
                    groupValue: group[7],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[7] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: size.width * 0.5,
                      child: _radioText(
                          context,
                          "Digital marketing Ads (FB Ads / Ig Ads). Nb : harus menyiapkan dana untuk belajar"
                          "beriklan dengan Ads min. 30K/day selama iklan berjalan.",
                          biodataController[25]!),
                    ),
                    activeColor: AppTheme.primaryColor,
                    value: 2,
                    groupValue: group[7],
                    onChanged: (value) {
                      setState(() {
                        group[7] = value as int;
                      });
                    }),
                RadioListTile(
                    title: CommonTextFieldView(
                      controller: biodataController[26],
                      hintText: "yang lainnya...",
                      width: size.width * 0.5,
                      color: Colors.grey[300],
                    ),
                    activeColor: AppTheme.primaryColor,
                    value: 3,
                    groupValue: group[7],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[7] = value as int;
                      });
                    }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apakah Anda ada alat kerja sendiri(LAPTOP) yang bisa dipakai selama Magang/PKL:",
                  style: TextStyles(context).getRegularStyle(),
                  textAlign: TextAlign.start,
                ),
                RadioListTile(
                    title: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: size.width * 0.5,
                      child:
                          _radioText(context, "Ya ada", biodataController[27]!),
                    ),
                    activeColor: AppTheme.primaryColor,
                    value: 1,
                    groupValue: group[8],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[8] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        width: size.width * 0.5,
                        child: _radioText(
                            context, "Tidak ada", biodataController[28]!)),
                    activeColor: AppTheme.primaryColor,
                    value: 2,
                    groupValue: group[8],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[8] = value as int;
                      });
                    }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jika YA, alat apa yang Anda miliki, yang bisa Anda bawa selama Magang/PKL:",
                  style: TextStyles(context).getRegularStyle(),
                  textAlign: TextAlign.start,
                ),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        width: size.width * 0.5,
                        child: _radioText(
                            context,
                            "Jika YA, alat apa yang Anda miliki, yang bisa Anda bawa selama Magang/PKL",
                            biodataController[41]!)),
                    activeColor: AppTheme.primaryColor,
                    value: 1,
                    groupValue: group[9],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[9] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: size.width * 0.5,
                      child: _radioText(
                          context,
                          "Laptop yang sudah terinstal corel dan photoshop",
                          biodataController[42]!),
                    ),
                    activeColor: AppTheme.primaryColor,
                    value: 2,
                    groupValue: group[9],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[9] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        width: size.width * 0.5,
                        child: _radioText(
                            context,
                            "laptop yang sudah terinstal adobe premier pro/final cut pro/adobe after effect",
                            biodataController[43]!,
                            maxLines: 5)),
                    activeColor: AppTheme.primaryColor,
                    value: 2,
                    groupValue: group[9],
                    onChanged: (value) {
                      setState(() {
                        group[9] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        width: size.width * 0.5,
                        child: _radioText(
                            context, "Kamera DSLR", biodataController[44]!)),
                    activeColor: AppTheme.primaryColor,
                    value: 3,
                    groupValue: group[9],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[9] = value as int;
                      });
                    }),
                RadioListTile(
                    title: CommonTextFieldView(
                      controller: biodataController[45],
                      hintText: "yang lainnya...",
                      width: size.width * 0.5,
                      color: Colors.grey[300],
                    ),
                    activeColor: AppTheme.primaryColor,
                    value: 4,
                    groupValue: group[9],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[9] = value as int;
                      });
                    }),
              ],
            ),
          ),
          CommonTextFieldView(
            controller: biodataController[29],
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            titleText:
                "Kapan Anda berencana mulai Magang/PKL? (tulis lengkap tanggal, bulan, tahun):",
            onChanged: (String txt) {},
            color: Colors.grey[300],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Anda tahu info magang ini darimana?:",
                  style: TextStyles(context).getRegularStyle(),
                  textAlign: TextAlign.start,
                ),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: _radioText(
                            context, "Website", biodataController[30]!)),
                    activeColor: AppTheme.primaryColor,
                    value: 1,
                    groupValue: group[10],
                    onChanged: (value) {
                      setState(() {
                        group[10] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: _radioText(
                            context, "Instagram", biodataController[31]!)),
                    activeColor: AppTheme.primaryColor,
                    value: 2,
                    groupValue: group[10],
                    onChanged: (value) {
                      setState(() {
                        group[10] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: _radioText(
                            context, "Twitter", biodataController[32]!)),
                    activeColor: AppTheme.primaryColor,
                    value: 3,
                    groupValue: group[10],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[10] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: _radioText(
                            context, "Glints", biodataController[33]!)),
                    activeColor: AppTheme.primaryColor,
                    value: 4,
                    groupValue: group[10],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[10] = value as int;
                      });
                    }),
                RadioListTile(
                    title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: _radioText(
                            context, "Youtube", biodataController[34]!)),
                    activeColor: AppTheme.primaryColor,
                    value: 5,
                    groupValue: group[10],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[10] = value as int;
                      });
                    }),
                RadioListTile(
                    title: CommonTextFieldView(
                      controller: biodataController[35],
                      hintText: "yang lainnya...",
                      width: size.width * 0.3,
                      color: Colors.grey[300],
                    ),
                    activeColor: AppTheme.primaryColor,
                    value: 6,
                    groupValue: group[10],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        group[10] = value as int;
                      });
                    }),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonButton(
                width: size.width * 0.3,
                buttonText: "Back",
                onTap: () => setState(() => index = 1),
              ),
              CommonButton(
                width: size.width * 0.3,
                buttonText: "Next",
                onTap: () => setState(() => index++),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _page4(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apakah anda membawa motor?",
                  style: TextStyles(context).getRegularStyle(),
                  textAlign: TextAlign.start,
                ),
                RadioListTile(
                    title: _radioText(context, "Iya", biodataController[36]!),
                    activeColor: AppTheme.primaryColor,
                    value: 1,
                    groupValue: group[11],
                    onChanged: (value) {
                      setState(() {
                        group[11] = value as int;
                      });
                    }),
                RadioListTile(
                    title: _radioText(context, "Tidak", biodataController[37]!),
                    activeColor: AppTheme.primaryColor,
                    value: 2,
                    groupValue: group[11],
                    onChanged: (value) {
                      setState(() {
                        group[11] = value as int;
                      });
                    }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Silakan upload: CV, Scan KTP/KTM, dan surat pengantar dari kampus disini (format .PDF):",
                  style: TextStyles(context).getRegularStyle(),
                  textAlign: TextAlign.start,
                ),
                _addingFile(context),
                if (pickedFile != null) Text(pickedFile!.name)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Silakan upload : Portofolio (berupa gambar jpg bagi disainer grafis atau link youtube bagi videografer)",
                  style: TextStyles(context).getRegularStyle(),
                  textAlign: TextAlign.start,
                ),
                _addingFile(context)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Informasi :Program Magang ini bersifat unpaid/tidak bergaji. Jika Anda setuju maka silakan SUBMIT. Terimakasih",
              style: TextStyles(context).getRegularStyle(),
              textAlign: TextAlign.start,
            ),
          ),
          CommonButton(
            backgroundColor: AppTheme.primaryColor,
            buttonText: "Kirim",
            onTap: () {
              _uploadFormData();
              uploadFile();
              Get.to(() => const BottomTabScreen(registered: true));
            },
          ),
        ],
      ),
    );
  }

  _addingFile(context) {
    return InkWell(
      radius: 0.5,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        height: 48,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: AppTheme.primaryColor),
            borderRadius: BorderRadius.circular(30)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.attach_file, color: AppTheme.primaryColor),
          Text(
            "Tambahkan File",
            style: TextStyles(context)
                .getRegularStyle()
                .copyWith(color: AppTheme.primaryColor),
          )
        ]),
      ),
      onTap: selectFile,
    );
  }

  _radioText(BuildContext context, String s, TextEditingController controller,
      {int? maxLines}) {
    return TextField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration.collapsed(
            hintStyle: TextStyles(context).getRegularStyle(),
            hintText: s,
            enabled: false),
        style: TextStyles(context).getRegularStyle().copyWith(fontSize: 16));
  }

  _uploadFormData() async {
    final bioController =
        TextEditingController(text: programMagang[selectedIndex]);
    await FirestoreService().addUserBio(
        biodataController1,
        biodataController2,
        biodataController3,
        group[1] == 1 ? biodataController4 : biodataController5,
        biodataController6,
        biodataController7,
        biodataController8,
        biodataController9,
        biodataController48,
        group[2] == 1 ? biodataController10 : biodataController11,
        group[3] == 1 ? biodataController12 : biodataController13,
        group[4] == 1
            ? biodataController14
            : group[4] == 2
                ? biodataController15
                : biodataController16,
        group[5] == 1
            ? biodataController17
            : group[5] == 2
                ? biodataController18
                : biodataController19,
        biodataController47,
        bioController.text.trim(),
        group[6] == 1 ? biodataController20 : biodataController21,
        biodataController22,
        biodataController23,
        biodataController24,
        group[7] == 1
            ? biodataController25
            : group[7] == 2
                ? biodataController26
                : biodataController27,
        group[8] == 1 ? biodataController28 : biodataController29,
        group[9] == 1
            ? biodataController42
            : group[9] == 2
                ? biodataController43
                : group[9] == 3
                    ? biodataController44
                    : group[9] == 4
                        ? biodataController45
                        : biodataController46,
        biodataController30,
        group[10] == 1
            ? biodataController31
            : group[10] == 2
                ? biodataController32
                : group[10] == 3
                    ? biodataController33
                    : group[10] == 4
                        ? biodataController34
                        : group[10] == 5
                            ? biodataController35
                            : biodataController36,
        group[11] == 1 ? biodataController37 : biodataController38);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() {
      file = File(path);
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});
  }
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
