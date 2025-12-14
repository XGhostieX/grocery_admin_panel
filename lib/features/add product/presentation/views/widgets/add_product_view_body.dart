import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/elevated_btn.dart';
import '../../../../../core/widgets/header.dart';
import '../../../../dashboard/presentation/views_model/menu_controller.dart';
import 'dot_border.dart';

class AddProductViewBody extends ConsumerStatefulWidget {
  const AddProductViewBody({super.key});

  @override
  ConsumerState<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends ConsumerState<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();
  String _catValue = 'Vegetables';
  int _groupValue = 1;
  bool _pickedImage = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _titleController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: Theme.of(context).scaffoldBackgroundColor,
      border: InputBorder.none,
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1.0)),
    );
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Header(
                  title: 'Add Product',
                  showSearch: false,
                  fct: () {
                    ref.read(menuControllerProvider).controlAddProductsMenu();
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const CustomText(text: 'Product title*', isBold: true),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _titleController,
                          key: const ValueKey('Title'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Title';
                            }
                            return null;
                          },
                          decoration: inputDecoration,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: MediaQuery.sizeOf(context).width > 650 ? 1 : 2,
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const CustomText(text: 'Price in \$*', isBold: true),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 120,
                                      child: TextFormField(
                                        controller: _priceController,
                                        key: const ValueKey('Price \$'),
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Price is missing';
                                          }
                                          return null;
                                        },
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                        ],
                                        decoration: inputDecoration,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const CustomText(text: 'Porduct category*', isBold: true),
                                    const SizedBox(height: 10),
                                    Container(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            style: TextStyle(
                                              color: Theme.of(context).textTheme.bodyLarge!.color,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                            value: _catValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _catValue = value!;
                                              });
                                            },
                                            hint: const Text('Select a category'),
                                            items: const [
                                              DropdownMenuItem(
                                                value: 'Vegetables',
                                                child: Text('Vegetables'),
                                              ),
                                              DropdownMenuItem(
                                                value: 'Fruits',
                                                child: Text('Fruits'),
                                              ),
                                              DropdownMenuItem(
                                                value: 'Grains',
                                                child: Text('Grains'),
                                              ),
                                              DropdownMenuItem(value: 'Nuts', child: Text('Nuts')),
                                              DropdownMenuItem(
                                                value: 'Herbs',
                                                child: Text('Herbs'),
                                              ),
                                              DropdownMenuItem(
                                                value: 'Spices',
                                                child: Text('Spices'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const CustomText(text: 'Measure unit*', isBold: true),
                                    const SizedBox(height: 10),
                                    RadioGroup(
                                      groupValue: _groupValue,
                                      onChanged: (value) => setState(() {
                                        _groupValue = value!.toInt();
                                      }),
                                      child: const Row(
                                        children: [
                                          CustomText(text: 'KG'),
                                          Radio(value: 1, activeColor: Colors.green),
                                          CustomText(text: 'Piece'),
                                          Radio(value: 2, activeColor: Colors.green),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  const CustomText(text: 'Image URL', isBold: true),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: _imageController,
                                      key: const ValueKey('Image URL'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter an Image URL';
                                        }
                                        return null;
                                      },
                                      decoration: inputDecoration,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: MediaQuery.sizeOf(context).width > 650
                                          ? 350
                                          : MediaQuery.sizeOf(context).width * 0.45,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: _pickedImage == false
                                          ? const DotBorder()
                                          : ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                              child: CachedNetworkImage(
                                                imageUrl: _imageController.text,
                                                fit: BoxFit.cover,
                                                errorWidget: (context, url, error) => Container(
                                                  alignment: Alignment.center,
                                                  child: const CustomText(
                                                    text:
                                                        'Please Enter a Valid Image URL or Check Your Enternet Connection',
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FittedBox(
                                child: Column(
                                  children: [
                                    TextButton(
                                      onPressed: () => setState(() {
                                        _imageController.clear();
                                        _pickedImage = false;
                                      }),
                                      child: const CustomText(text: 'Clear', color: Colors.red),
                                    ),
                                    TextButton(
                                      onPressed: () => setState(() {
                                        _pickedImage = true;
                                      }),
                                      child: const CustomText(
                                        text: 'Update image',
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedBtn(
                                function: () {
                                  setState(() {
                                    _groupValue = 1;
                                    _priceController.clear();
                                    _titleController.clear();
                                    _imageController.clear();
                                    _catValue = 'Vegetables';
                                    _pickedImage = false;
                                  });
                                },
                                title: 'Clear form',
                                icon: IconlyBold.danger,
                                bgColor: Colors.red.shade300,
                                fgColor: Colors.white,
                              ),
                              ElevatedBtn(
                                function: () {
                                  _formKey.currentState!.validate();
                                },
                                title: 'Upload',
                                icon: IconlyBold.upload,
                                bgColor: Colors.blue,
                                fgColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
