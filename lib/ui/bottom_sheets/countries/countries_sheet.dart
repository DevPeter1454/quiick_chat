import 'package:flutter/material.dart';

import 'package:quiick_chat/ui/bottom_sheets/countries/countries_sheet.form.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/common/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'countries_sheet_model.dart';

@FormView(
    autoTextFieldValidation: false, fields: [FormTextField(name: 'search')])
class CountriesSheet extends StackedView<CountriesSheetModel>
    with $CountriesSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CountriesSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CountriesSheetModel viewModel,
    Widget? child,
  ) {
    ScrollController scrollController = ScrollController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      height: screenHeight(context) * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title ?? 'Hello Stacked Sheet!!',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          verticalSpace(20),
          CustomTextField(
            controller: searchController,
            hintText: "Search country",
            keyboardType: TextInputType.text,
            onChanged: (value) {
              viewModel.searchCountries(value);
              // Keep any existing onChanged functionality
            },
          ),
          verticalSpaceLarge,
          viewModel.countries.isEmpty
              ? Center(
                  child: Text(
                    "No countries found",
                    style: AppTextstyles.medium,
                  ),
                )
              : Expanded(
                  child: Scrollbar(
                    controller: scrollController,
                    thumbVisibility: true,
                    thickness: 6,
                    radius: const Radius.circular(10),
                    child: ListView(
                      controller: scrollController,
                      children: viewModel.countries.map((item) {
                        return ListTile(
                          title: Text(
                            item.name,
                            style: AppTextstyles.medium,
                          ),
                          onTap: () {
                            viewModel.setSelectedCountry(item);
                            searchController.clear();
                            completer!(SheetResponse(data: item));
                            // Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  @override
  CountriesSheetModel viewModelBuilder(BuildContext context) =>
      CountriesSheetModel();

  @override
  void onViewModelReady(CountriesSheetModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }
}
