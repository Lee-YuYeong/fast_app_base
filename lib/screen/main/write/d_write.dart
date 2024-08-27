import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:after_layout/after_layout.dart';

class WriteTodoDialog extends DialogWidget<WriteTodoResult> {
  WriteTodoDialog({super.key});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog> with AfterLayoutMixin{

  DateTime selectedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundedContainer(
        color: context.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                const Text('할 일을 작성해주세요.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                spacer,
                Text(selectedDate.formattedDate, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w200),),

                IconButton(onPressed: _selectDate, icon: const Icon(Icons.calendar_month_outlined))
              ],
            ),
            height20,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    focusNode: node,
                  ),
                ),
                RoundButton(
                  text: '추가',
                  onTap: () {
                    widget.hide(WriteTodoResult(dateTime: selectedDate, text: textController.text));
                  })
              ],
            )
          ],
        ),
      )
    );
  }
  
  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate, 
      firstDate: DateTime.now().subtract(const Duration(days: 365)), 
      lastDate: DateTime.now().add(const Duration(days: 365 * 10))
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    AppKeyboardUtil.show(context, node);  
  }
}