import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_eprhom/app/modules/home/controller.dart';
import 'package:teste_eprhom/core/values/colors.dart';
import 'package:teste_eprhom/core/values/strings.dart';

class AddPostForm extends Container {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: mainColor),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Theme(
                  data: ThemeData(
                    primaryColor: mainColor,
                    accentColor: mainColor,
                  ),
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      onChanged: (v) => this.controller.onChangedPost(v),
                      onSaved: (v) => this.controller.onSavedPost(v),
                      validator: (v) => this.controller.validatePost(v),
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      cursorColor: Colors.white,
                      maxLength: 380,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          disabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          labelText: hint_add_post,
                          labelStyle: TextStyle(color: Colors.white))),
                ),
              ),
              Container(
                width: 160.0,
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                    hoverColor: mainColor,
                    splashColor: mainColor,
                    highlightedBorderColor: mainColor,
                    highlightColor: mainColor,
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    onPressed: () {
                      final FormState form = this._formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        this.controller.addPost();
                      }
                    },
                    child: Text(
                      publish,
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
