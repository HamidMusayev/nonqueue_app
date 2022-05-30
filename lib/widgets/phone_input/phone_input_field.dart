import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nonqueue_app/widgets/phone_input/phone_number.dart';

import 'country_sc.dart';

class IntlPhoneField extends StatefulWidget {
  const IntlPhoneField(
      {Key? key,
      this.initialCountryCode,
      this.obscureText = false,
      this.textAlign = TextAlign.left,
      this.textAlignVertical,
      this.onTap,
      this.readOnly = false,
      this.initialValue,
      this.keyboardType = TextInputType.phone,
      this.autovalidate = true,
      this.controller,
      this.focusNode,
      this.decoration = const InputDecoration(),
      this.style,
      this.dropdownTextStyle,
      this.onSubmitted,
      this.validator,
      this.onChanged,
      this.countries,
      this.onCountryChanged,
      this.onSaved,
      this.showDropdownIcon = true,
      this.dropdownDecoration = const BoxDecoration(),
      this.inputFormatters,
      this.enabled = true,
      this.keyboardAppearance = Brightness.light,
      this.searchText = 'Search by Country Name',
      this.iconPosition = IconPosition.leading,
      this.dropDownIcon = const Icon(Icons.arrow_drop_down),
      this.autofocus = false,
      this.textInputAction,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.showCountryFlag = true,
      this.dialCodeSearch = true,
      this.cursorColor,
      this.disableLengthCheck = false,
      this.flagsButtonPadding = EdgeInsets.zero,
      this.invalidNumberMessage})
      : super(key: key);
  final bool obscureText;
  final bool dialCodeSearch;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final VoidCallback? onTap;
  final bool readOnly;
  final FormFieldSetter<PhoneNumber>? onSaved;
  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<PhoneNumber>? onCountryChanged;
  final FutureOr<String?> Function(String?)? validator;

  @Deprecated('use autovalidateMode instead as it offers more options')
  final bool autovalidate;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final Brightness keyboardAppearance;
  final String? initialValue;
  final String? initialCountryCode;
  final List<String>? countries;
  final InputDecoration decoration;
  final TextStyle? style;
  final bool disableLengthCheck;
  final bool showDropdownIcon;
  final BoxDecoration dropdownDecoration;
  final TextStyle? dropdownTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final String searchText;
  final IconPosition iconPosition;
  final Icon dropDownIcon;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final bool showCountryFlag;
  final String? invalidNumberMessage;
  final Color? cursorColor;
  final EdgeInsetsGeometry flagsButtonPadding;
  final TextInputAction? textInputAction;

  @override
  _IntlPhoneFieldState createState() => _IntlPhoneFieldState();
}

class _IntlPhoneFieldState extends State<IntlPhoneField> {
  late List<Country> _countryList;
  late Country _selectedCountry;
  late List<Country> filteredCountries;
  late String number;
  bool hasChanged = false;

  String? validationMessage;

  @override
  void initState() {
    super.initState();
    _countryList = widget.countries == null
        ? countries
        : countries
            .where((country) => widget.countries!.contains(country.code))
            .toList();
    filteredCountries = _countryList;
    number = widget.initialValue ?? '';
    if (widget.initialCountryCode == null && number.startsWith('+')) {
      number = number.substring(1);
      // parse initial value
      _selectedCountry = countries.firstWhere(
          (country) => number.startsWith(country.dialCode),
          orElse: () => _countryList.first);
      number = number.substring(_selectedCountry.dialCode.length);
    } else {
      _selectedCountry = _countryList.firstWhere(
          (item) => item.code == (widget.initialCountryCode ?? 'US'),
          orElse: () => _countryList.first);
    }
    if (widget.autovalidateMode == AutovalidateMode.always) {
      var x = widget.validator?.call(widget.initialValue);
      if (x is String) {
        setState(() => validationMessage = x);
      } else {
        (x as Future).then((msg) => setState(() => validationMessage = msg));
      }
    }
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => Dialog(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    labelText: widget.searchText,
                  ),
                  onChanged: (value) {
                    filteredCountries = widget.dialCodeSearch &&
                            isNumeric(value)
                        ? _countryList
                            .where(
                                (country) => country.dialCode.contains(value))
                            .toList()
                        : _countryList
                            .where((country) => country.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                    if (mounted) setState(() {});
                  },
                ),
                const Divider(color: Colors.transparent),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredCountries.length,
                    itemBuilder: (ctx, index) => Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset(
                              'assets/flags/${filteredCountries[index].code.toLowerCase()}.png',
                              width: 32),
                          title: Text(filteredCountries[index].name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          trailing: Text(
                              '+${filteredCountries[index].dialCode}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          onTap: () {
                            _selectedCountry = filteredCountries[index];
                            widget.onCountryChanged?.call(
                              PhoneNumber(
                                countryISOCode: _selectedCountry.code,
                                countryCode: '+${_selectedCountry.dialCode}',
                                number: '',
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                        const Divider(thickness: 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //initialValue: number,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      cursorColor: widget.cursorColor,
      onTap: widget.onTap,
      controller: widget.controller,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onSubmitted,
      decoration: widget.decoration.copyWith(
        prefixIcon: _buildFlagsButton(),
        counterText: !widget.enabled ? '' : null,
      ),
      style: widget.style,
      onSaved: (value) {
        widget.onSaved?.call(
          PhoneNumber(
            countryISOCode: _selectedCountry.code,
            countryCode: '+${_selectedCountry.dialCode}',
            number: value!,
          ),
        );
      },
      onChanged: (value) async {
        hasChanged = true;
        final phoneNumber = PhoneNumber(
          countryISOCode: _selectedCountry.code,
          countryCode: '+${_selectedCountry.dialCode}',
          number: value,
        );
        // validate here to take care of async validation
        String? msg;
        if (widget.autovalidateMode != AutovalidateMode.disabled) {
          msg = widget.disableLengthCheck ||
                  value.length >= _selectedCountry.minLength &&
                      value.length <= _selectedCountry.maxLength
              ? null
              : (widget.invalidNumberMessage ?? 'Invalid Mobile Number');
          msg ??= await widget.validator?.call(phoneNumber.completeNumber);
          setState(() => validationMessage = msg);
        }
        widget.onChanged?.call(phoneNumber);
      },
      validator: (value) => validationMessage,
      maxLength: widget.disableLengthCheck ? null : _selectedCountry.maxLength,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      keyboardAppearance: widget.keyboardAppearance,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      autovalidateMode: widget.autovalidateMode,
    );
  }

  DecoratedBox _buildFlagsButton() {
    return DecoratedBox(
      decoration: widget.dropdownDecoration,
      child: InkWell(
        borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius?,
        onTap: widget.enabled ? _changeCountry : null,
        child: Padding(
          padding: widget.flagsButtonPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.enabled &&
                  widget.showDropdownIcon &&
                  widget.iconPosition == IconPosition.leading) ...[
                widget.dropDownIcon,
                const SizedBox(width: 4),
              ],
              if (widget.showCountryFlag) ...[
                Image.asset(
                    'assets/flags/${_selectedCountry.code.toLowerCase()}.png',
                    width: 32),
                const SizedBox(width: 8),
              ],
              FittedBox(
                child: Text(
                  '+${_selectedCountry.dialCode}',
                  style: widget.dropdownTextStyle,
                ),
              ),
              if (widget.enabled &&
                  widget.showDropdownIcon &&
                  widget.iconPosition == IconPosition.trailing) ...[
                const SizedBox(width: 4),
                widget.dropDownIcon,
              ],
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  bool isNumeric(String s) => s.isNotEmpty && double.tryParse(s) != null;
}

enum IconPosition {
  leading,
  trailing,
}
