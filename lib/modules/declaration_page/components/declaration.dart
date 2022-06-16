import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../providers/log_provider.dart';
import '../../../repository/user_declaration_repo.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';

enum SingingCharacter { no, yes }
enum SingingCharacter1 { no, yes }
enum SingingCharacter2 { no, yes }
enum SingingCharacter3 { no, yes }
enum SingingCharacter4 { no, yes }

class Declaration extends StatefulWidget {
  const Declaration({Key? key}) : super(key: key);

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  late final String? myPhone;
  late final String? myUid;

  @override
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    myPhone = user?.phoneNumber;
    myUid = user?.uid;
    const LogProvider('📱').log(myPhone!);
    const LogProvider('🔒').log(myUid!);
    super.initState();
  }

  SingingCharacter? _character = SingingCharacter.no;
  SingingCharacter1? _character1 = SingingCharacter1.no;
  SingingCharacter2? _character2 = SingingCharacter2.no;
  SingingCharacter3? _character3 = SingingCharacter3.no;
  SingingCharacter4? _character4 = SingingCharacter4.no;
  bool isRadio = true;
  bool isRadio1 = true;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cccdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bhytController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController acrossPlaceController = TextEditingController();
  TextEditingController signsController = TextEditingController();
  int currentStep = 0;
  bool isComplete = false;

  String validateText(String? formText) {
    if (formText!.isEmpty) return 'Bắt buộc.';
    return '';
  }

  String validateEmail(String? formEmail) {
    if (formEmail!.isEmpty) return 'Email không để trống.';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Email không hợp lệ.';
    return '';
  }

  String validatePassword(String? formPassword) {
    if (formPassword!.isEmpty) return 'Chưa nhập mật khẩu.';
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword)) {
      return '''
    Mật khẩu phải ít nhất 8 kí tự,
    bao gồm kí tự in hoa, số và kí tự đặc biệt.
    ''';
    }
    return '';
  }

  List<String> gender = ['Nam', 'Nữ', 'Khác'];
  List<String> province = ['Đà Nẵng', 'Phú Yên', 'Quảng Nam'];
  List<String> district = ['Hải Châu', 'Ngũ Hành Sơn', 'Cẩm Lệ'];
  List<String> village = ['Hoà Hải', 'Hoà Quý'];
  List<String> nationality = ['Việt Nam', 'Japan', 'Korea'];

  String nationalityController = '';

  String genderController = '';
  String villageController = '';
  String districtController = '';
  String provinceController = '';

  String acrossPlace = '';
  String signs = '';

  String contactWithController = '';
  String patientController = '';
  String foreignerController = '';
  String expressionistController = '';

  DateFormat? _dateFormat;
  DateTime? _selectedDate;

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      dobController.text = _dateFormat!.format(_selectedDate!);
      // widget.onDateChanged(_selectedDate);
    }

    // if (widget.focusNode != null) {
    //   widget.focusNode.nextFocus();
    // }
  }

  List<Step> getSteps() => [
    Step(
        title: const Text('Thông tin cá nhân'),
        content: Form(
          key: _key,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Họ tên',
                  //   hintText: 'Họ tên (ghi chữ in HOA)',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                ),
                // validator: validateText,
                controller: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Giới tính',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                ),
                // value: dropdownValue,
                items: gender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    genderController = newValue!;
                    //  print(dropdownValue);
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    labelText: 'Ngày sinh',
                    hintText: 'DD/MM/YYYY',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                      gapPadding: 5,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                      gapPadding: 5,
                    ),
                    suffixIcon: const Icon(Icons.date_range)),
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      dobController.text =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                    }
                  });
                },
                // validator: validateText,
                controller: dobController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'CCCD/CMND/Hộ chiếu',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                ),
                // validator: validateText,
                controller: cccdController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                ),
                // validator: validateText,
                controller: phoneController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mã bảo hiểm Y tế',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                ),
                // validator: validateText,
                controller: bhytController,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Quốc tịch',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 5,
                  ),
                ),
                // value: dropdownValue,
                items: nationality
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    nationalityController = newValue!;
                    //  print(dropdownValue);
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.indexed),
    Step(
        title: const Text('Nơi cư trú'),
        content: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Tỉnh/Thành phố',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                  gapPadding: 5,
                ),
              ),
              // value: dropdownValue,
              items: province.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  provinceController = newValue!;
                  //  print(dropdownValue);
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Quận/Huyện',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                  gapPadding: 5,
                ),
              ),
              // value: dropdownValue,
              items: district.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  districtController = newValue!;
                  //  print(dropdownValue);
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Xã/Phường',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                  gapPadding: 5,
                ),
              ),
              // value: dropdownValue,
              items: village.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  villageController = newValue!;
                  //  print(dropdownValue);
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Đường/Số nhà',
                //   hintText: 'Họ tên (ghi chữ in HOA)',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                  gapPadding: 5,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                  gapPadding: 5,
                ),
              ),
              // validator: validateText,
              controller: streetController,
            ),
          ],
        ),
        isActive: currentStep >= 1,
        state: currentStep > 1 ? StepState.complete : StepState.indexed),
    Step(
        title: const Text('Thông tin khai báo'),
        content: Column(
          children: [
            Stack(
              children: [
                isRadio
                    ? Container(
                  width: 500,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                )
                    : Container(
                  width: 500,
                  height: 265,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 14, right: 14),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                            'Trong vòng 14 ngày qua, Anh/Chị có đến khu vực, tỉnh, thành phố, quốc gia/vùng lãnh thổ nào (Có thể đi qua nhiều nơi) ',
                            style:
                            AppStyle.kBodyText.copyWith(height: 1.25),
                            children: <TextSpan>[
                              TextSpan(
                                text: '*',
                                style: AppStyle.kBodyText.copyWith(
                                  color: AppColor.kDeathColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter>(
                                value: SingingCharacter.no,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                    isRadio = true;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Không',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter>(
                                value: SingingCharacter.yes,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                    isRadio = false;
                                  });
                                  print(_character);
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Có',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    isRadio
                        ? const SizedBox()
                        : SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14),
                            child: TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: 'Nơi đã đi qua',
                                hintText: 'Ghi rõ địa chỉ đi qua',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.grey),
                                  gapPadding: 5,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.grey),
                                  gapPadding: 5,
                                ),
                              ),
                              // validator: validateText,
                              controller: acrossPlaceController,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                isRadio1
                    ? Container(
                  width: 500,
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                )
                    : Container(
                  width: 500,
                  height: 285,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 14, right: 14),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                            'Trong vòng 14 ngày qua, Anh/Chị có thấy xuất hiện ít nhất 1 trong các dấu hiệu: sốt, ho, khó thở, viêm phổi, đau họng, mệt mỏi, thay đổi vị giác không? ',
                            style:
                            AppStyle.kBodyText.copyWith(height: 1.25),
                            children: <TextSpan>[
                              TextSpan(
                                text: '*',
                                style: AppStyle.kBodyText.copyWith(
                                  color: AppColor.kDeathColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter1>(
                                value: SingingCharacter1.no,
                                groupValue: _character1,
                                onChanged: (SingingCharacter1? value) {
                                  setState(() {
                                    _character1 = value;
                                    isRadio1 = true;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Không',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter1>(
                                value: SingingCharacter1.yes,
                                groupValue: _character1,
                                onChanged: (SingingCharacter1? value) {
                                  setState(() {
                                    _character1 = value;
                                    isRadio1 = false;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Có',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    isRadio1
                        ? const SizedBox()
                        : SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14),
                            child: TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                labelText: 'Mô tả tình trạng cụ thể',
                                // hintText: 'Ghi rõ địa chỉ đi qua',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.grey),
                                  gapPadding: 5,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.grey),
                                  gapPadding: 5,
                                ),
                              ),
                              // validator: validateText,
                              controller: signsController,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: 500,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 14, right: 14),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                            'Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với người bệnh hoặc nghi ngờ mắc bệnh Covid-19 không? ',
                            style:
                            AppStyle.kBodyText.copyWith(height: 1.25),
                            children: <TextSpan>[
                              TextSpan(
                                text: '*',
                                style: AppStyle.kBodyText.copyWith(
                                  color: AppColor.kDeathColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter2>(
                                value: SingingCharacter2.no,
                                groupValue: _character2,
                                onChanged: (SingingCharacter2? value) {
                                  setState(() {
                                    _character2 = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Không',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter2>(
                                value: SingingCharacter2.yes,
                                groupValue: _character2,
                                onChanged: (SingingCharacter2? value) {
                                  setState(() {
                                    _character2 = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Có',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: 500,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 14, right: 14),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                            'Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với người từ nước có bệnh Covid-19 không? ',
                            style:
                            AppStyle.kBodyText.copyWith(height: 1.25),
                            children: <TextSpan>[
                              TextSpan(
                                text: '*',
                                style: AppStyle.kBodyText.copyWith(
                                  color: AppColor.kDeathColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter3>(
                                value: SingingCharacter3.no,
                                groupValue: _character3,
                                onChanged: (SingingCharacter3? value) {
                                  setState(() {
                                    _character3 = value;
                                  });
                                  //_character == SingingCharacter.no?null:null;
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Không',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter3>(
                                value: SingingCharacter3.yes,
                                groupValue: _character3,
                                onChanged: (SingingCharacter3? value) {
                                  setState(() {
                                    _character3 = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Có',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: 500,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 14, right: 14),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                            'Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với người có biểu hiện sốt, ho, khó thở, viêm phổi không? ',
                            style:
                            AppStyle.kBodyText.copyWith(height: 1.25),
                            children: <TextSpan>[
                              TextSpan(
                                text: '*',
                                style: AppStyle.kBodyText.copyWith(
                                  color: AppColor.kDeathColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter4>(
                                value: SingingCharacter4.no,
                                groupValue: _character4,
                                onChanged: (SingingCharacter4? value) {
                                  setState(() {
                                    _character4 = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Không',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<SingingCharacter4>(
                                value: SingingCharacter4.yes,
                                groupValue: _character4,
                                onChanged: (SingingCharacter4? value) {
                                  setState(() {
                                    _character4 = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Có',
                                  style: AppStyle.kBodyText.copyWith(
                                      color: AppColor.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        isActive: currentStep >= 2,
        state: currentStep > 2 ? StepState.complete : StepState.indexed),
  ];

  @override
  Widget build(BuildContext context) {
    final isLastStep = currentStep == getSteps().length - 1;
    print(myPhone);
    return isComplete
        ? Container(
      child: ElevatedButton(
        onPressed: () async {
          // isComplete = false;
          // currentStep = 0;
        },
        child: Text('Reset'),
      ),
    )
        : Stepper(
      steps: getSteps(),
      type: StepperType.vertical,
      currentStep: currentStep,
      onStepContinue: () async {
        if (isLastStep) {
          // if (_key.currentState!.validate()) {}
          // setState(() {
          //   isComplete = true;
          // });
          String name = nameController.text;
          String gender = genderController;
          String dob = dobController.text;
          String cccd = cccdController.text;
          String phone = phoneController.text;
          String bhyt = bhytController.text;
          String address = streetController.text +
              ' - ' +
              villageController +
              ' - ' +
              districtController +
              ' - ' +
              provinceController;
          String nationality = nationalityController;
          _character == SingingCharacter.no
              ? acrossPlace = ''
              : acrossPlace = acrossPlaceController.text;
          _character1 == SingingCharacter1.no
              ? signs = ''
              : signs = signsController.text;
          _character2 == SingingCharacter2.no
              ? patientController = ''
              : patientController =
          ' Tôi có tiếp xúc với người bệnh hoặc nghi ngờ mắc bệnh Covid-19.';
          _character3 == SingingCharacter3.no
              ? foreignerController = ''
              : foreignerController =
          ' Tôi có tiếp xúc với người từ nước có bệnh Covid-19.';
          _character4 == SingingCharacter4.no
              ? expressionistController = ''
              : expressionistController =
          ' Tôi tiếp xúc với người có biểu hiện sốt, ho, khó thở, viêm phổi.';
          contactWithController = 'Trong 14 ngày qua,' +
              patientController +
              foreignerController +
              expressionistController;
          await UserDeclarationPost()
              .postData(
              name,
              gender,
              dob,
              cccd,
              phone,
              bhyt,
              address,
              nationality,
              acrossPlace,
              signs,
              contactWithController,
              myUid!)
              .then((value) {
            if(value.length!=0){
              print(value);
              final snackBar = SnackBar(
                content: const Text('Khai báo thành công!'),
                action: SnackBarAction(
                  label: 'Xong',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              return ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }else{
              print(value);
              final snackBar = SnackBar(
                content: const Text('Khai báo không thành công!'),
                action: SnackBarAction(
                  label: 'Xong',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              return ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

          });



          // _character ==SingingCharacter.no?acrossPlace='':acrossPlace=acrossPlaceController.text;
          // print(acrossPlace);
        } else {
          setState(() {
            currentStep += 1;
          });
        }
      },
      onStepCancel: () {
        currentStep == 0
            ? null
            : setState(() {
          currentStep -= 1;
        });
      },
      onStepTapped: (step) => setState(
            () {
          currentStep = step;
        },
      ),
      controlsBuilder: (context, details) {
        return SizedBox(
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: Text(isLastStep ? 'Gửi khai báo' : 'Tiếp'),
                  onPressed: details.onStepContinue,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              if (currentStep != 0)
                Expanded(
                  child: ElevatedButton(
                    child: Text('Quay lại'),
                    onPressed: details.onStepCancel,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
