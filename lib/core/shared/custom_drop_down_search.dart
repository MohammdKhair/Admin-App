import 'package:admin_app/core/constant/app_color.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem<String>> listdata;
  final TextEditingController dropDownSelectedName;
  final TextEditingController dropDownSelectedId;
  const CustomDropDownSearch(
      {super.key,
      this.title,
      required this.listdata,
      required this.dropDownSelectedName,
      required this.dropDownSelectedId});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  showDropDownSerach() {
    DropDownState<String>(
      dropDown: DropDown<String>(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        data: widget.listdata,
        onSelected: (List<dynamic> selectedItems) {
          SelectedListItem selectedListItem = selectedItems[0];
          String selectedData = selectedListItem.data;
          List<String> values = selectedData.split(',');
          String id = values[0];
          String name = values[1];
          widget.dropDownSelectedName.text = name;
          widget.dropDownSelectedId.text = id;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: TextFormField(
          readOnly: true,
          controller: widget.dropDownSelectedName,
          cursorColor: Colors.black,
          onTap: () {
            FocusScope.of(context).unfocus();
            showDropDownSerach();
          },
          decoration: InputDecoration(
            filled: false,
            fillColor: Colors.black12,
            hintText: widget.dropDownSelectedName.text == ""
                ? widget.title
                : widget.dropDownSelectedName.text,
            hintStyle: const TextStyle(fontSize: 13),
            labelStyle: const TextStyle(color: AppColor.secondColor),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(widget.title!),
            ),
            suffixIcon: const Icon(Icons.arrow_drop_down),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: AppColor.primaryColor)),
          ),
        ));
  }
}
