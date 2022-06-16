import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/log_provider.dart';
import '../../../repository/vaccination_repo.dart';
import '../blocs/vaccine_provider.dart';
import 'my_text_form_field.dart';
import 'my_text_form_field_day.dart';

class VaccineWidget extends StatefulWidget {
  const VaccineWidget({Key? key}) : super(key: key);

  @override
  _VaccineWidgetState createState() => _VaccineWidgetState();
}

class _VaccineWidgetState extends State<VaccineWidget> {
  late VaccineProvider _state;

  int currentStep = 0;
  bool isComplete = false;
  List<String> gender = ['Nam', 'Nữ', 'Khác'];
  String genderController = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cccdController = TextEditingController();
  TextEditingController bhytController = TextEditingController();
  List<String> ethnic = [
    'Kinh',
    'Tày',
    'Thái',
    'Mường',
    'Hoa',
    'Khmer',
    'Nùng',
    'HMông',
    'Dao',
    'Gia-rai',
    'Ê-đê',
    'Ba-na',
    'Sán Chay',
    'Chăm',
    'Xê-đăng',
    'Sán Dìu',
    'Hrê',
    'Cơ-ho',
    'Ra Glay',
    "M'Nông",
    'Thổ',
    'Xtiêng',
    'Khơ Mú',
    'Bru-Vân Kiều',
    'Giáy',
    'Cơ tu',
    'Gié-Triêng',
    'Ta Ôi',
    'Mạ',
    'Co',
    'Chơ Ro',
    'Hà Nhì',
    'Xinh Mun',
    'Chu-ru',
    'Lào',
    'La Chí',
    'Phù Lá',
    'La Hủ',
    'Kháng',
    'Lư',
    'Pà Thẻn',
    'Lô Lô',
    'Chứt',
    'Mảng',
    'Cờ lao',
    'Bố Y',
    'La Ha',
    'Cống',
    'Ngái',
    'Si La',
    'Pu Péo',
    'Brâu',
    'Rơ Măm',
    'Ơ Đu'
  ];
  String ethnicController = '';

  List<String> province = ['Đà Nẵng', 'Phú Yên', 'Quảng Nam'];
  List<String> district = ['Hải Châu', 'Ngũ Hành Sơn', 'Cẩm Lệ'];
  List<String> village = ['Hoà Hải', 'Hoà Quý'];

  String villageController = '';
  String districtController = '';
  String provinceController = '';
  TextEditingController streetController = TextEditingController();

  List<String> occupation = [
    'Kỹ sư phần mềm',
    'Tiếp viên hàng không',
    'Bác sĩ',
    'Quân đội',
    'Công an',
    'Khác'
  ];
  String occupationController = '';
  TextEditingController workplaceController = TextEditingController();

  List<String> injectionSession = [
    'Buổi sáng',
    'Buổi chiều',
  ];
  String injectionSessionController = '';
  List<String> priorityGroup = [
    'Người làm việc trong các ngành y tế',
    'Người tham gia phòng chống dịch',
    'Lực lượng Quân đội',
    'Lực lượng Công an',
    'Nhân viên, cán bộ ngoại giao của Việt Nam và thân nhân được cử đi nước ngoài',
    'Người làm việc trong các cơ quan Ngoại giao, Lãnh sự, các tổ chức quốc tế hoạt động tại Việt Nam',
  ];
  String injectionsController = '';
  String priorityGroupController = '';
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
    _state = VaccineProvider();
    super.initState();
    _state.getNameVaccine();
  }

  @override
  Widget build(BuildContext context) {
    print(myUid);
    return ChangeNotifierProvider<VaccineProvider>(
      create: (_) => _state,
      child: Consumer<VaccineProvider>(builder: (context, model, child) {
        List<Step> getSteps() => [
          Step(
              title: const Text('Thông tin cá nhân'),
              content: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    lableText: 'Họ và tên',
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
                    items: gender
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        genderController = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormFieldDay(
                    lableText: 'Ngày sinh',
                    dobController: dobController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    lableText: 'Số điện thoại',
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    lableText: 'CCCD/CMND/Hộ chiếu',
                    controller: cccdController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    lableText: 'Mã bảo hiểm Y tế',
                    controller: bhytController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'Dân tộc',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        gapPadding: 5,
                      ),
                    ),
                    // value: dropdownValue,
                    items: ethnic
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        ethnicController = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              isActive: currentStep >= 0,
              state:
              currentStep > 0 ? StepState.complete : StepState.indexed),
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
                    items: province
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        provinceController = newValue!;
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
                    items: district
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        districtController = newValue!;
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
                    items: village
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        villageController = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    controller: streetController,
                    lableText: 'Đường/Số nhà',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              isActive: currentStep >= 1,
              state:
              currentStep > 1 ? StepState.complete : StepState.indexed),
          Step(
              title: const Text('Nghề nghiệp'),
              content: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'Nhóm nghề nghiệp',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        gapPadding: 5,
                      ),
                    ),
                    // value: dropdownValue,
                    items: occupation
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        occupationController = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    controller: workplaceController,
                    lableText: 'Nơi làm việc',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              isActive: currentStep >= 2,
              state:
              currentStep > 2 ? StepState.complete : StepState.indexed),
          Step(
              title: const Text('Thông tin đăng ký tiêm Vaccine'),
              content: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'Thuốc tiêm',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        gapPadding: 5,
                      ),
                    ),
                    // value: dropdownValue,
                    items: model.item!
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        model.setselected(newValue!);
                        model.getIdVaccine();
                        injectionsController = newValue;
                      });
                      print(model.idVaccine);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'Buổi tiêm',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        gapPadding: 5,
                      ),
                    ),
                    // value: dropdownValue,
                    items: injectionSession
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        injectionSessionController = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'Nhóm ưu tiên',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                        gapPadding: 5,
                      ),
                    ),
                    // value: dropdownValue,
                    items: priorityGroup
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        priorityGroupController = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              isActive: currentStep >= 2,
              state:
              currentStep > 2 ? StepState.complete : StepState.indexed),
        ];
        final isLastStep = currentStep == getSteps().length - 1;
        return Stepper(
          steps: getSteps(),
          type: StepperType.vertical,
          currentStep: currentStep,
          onStepContinue: () async {
            print(nameController.text);
            print(genderController);
            if (isLastStep) {
              String name = nameController.text;
              String gender = genderController;
              String dob = dobController.text;
              String phone = phoneController.text;
              String cccd = cccdController.text;
              String bhyt = bhytController.text;
              String ethnic = ethnicController;
              String address = streetController.text +
                  ' - ' +
                  villageController +
                  ' - ' +
                  districtController +
                  ' - ' +
                  provinceController;
              String workplace = workplaceController.text;
              await VaccinationRepo()
                  .postData(
                  name,
                  gender,
                  dob,
                  phone,
                  cccd,
                  bhyt,
                  address,
                  occupationController,
                  workplace,
                  ethnic,
                  injectionsController,
                  injectionSessionController,
                  priorityGroupController,
                  myUid!,
                  model.idVaccine)
                  .then((value) {
                if(value.length!=0){
                  print(value);
                  final snackBar = SnackBar(
                    content: const Text('Đăng ký thành công!'),
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
                    content: const Text('Đăng ký không thành công!'),
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
                      child: Text(isLastStep ? 'Đăng ký tiêm' : 'Tiếp'),
                      onPressed: details.onStepContinue,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  if (currentStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        child: const Text('Quay lại'),
                        onPressed: details.onStepCancel,
                      ),
                    ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
