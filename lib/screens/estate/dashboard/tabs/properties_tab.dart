import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:manager/util/colors.dart';
import 'package:provider/provider.dart';

import '../../../../providers/login_response_provider.dart';
import '../../../../providers/workspace_provider.dart';
import '../../../../util/size_model.dart';
import '../../../../util/spacing.dart';
import '../../property_unit/create/property_address_screen.dart';
import '../model/properties_model.dart';
import '../widgets/property_units.dart';

class PropertiesTab extends StatefulWidget {
  const PropertiesTab({Key? key}) : super(key: key);

  @override
  State<PropertiesTab> createState() => _PropertiesTabstate();
}

class _PropertiesTabstate extends State<PropertiesTab> {
  late List PropertyUnits;
  List _propertyUnits = [];

  getPus() async {
    final profile = Provider.of<LoginResponseProvider>(context, listen: false)
        .loginResponse;
    final prov = Provider.of<WorkspaceProvider>(context, listen: false);
    String workspaceId = prov.getWorkspace!['workspace']['workspaceId'];
    String propertyUnitId =
        prov.getWorkspace!['latestProperty']['id'].toString();

    Map<String, dynamic>? pu = await prov.fetchPropertyUnits(
        workspaceId, propertyUnitId, profile.accessToken);

    setState(() {
      _propertyUnits = pu!['results'];
    });
  }

  @override
  void initState() {
    PropertyUnits = getPropertyUnits();
    super.initState();
    getPus();
  }

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: FxSpacing.fromLTRB(19, 10, 10, 0),
              child: Text(
                "Search for Property Units",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(15, 10, 15, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: FxSpacing.vertical(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              color: AppColors.borderLine, width: .7),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: FxSpacing.left(12),
                            child: Icon(
                              MdiIcons.magnify,
                              color: AppColors.stepperBg,
                              size: 28,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: FxSpacing.left(12),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: AppColors.stepperBg,
                                  hintText: "Search for Properties and People",
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  isDense: true,
                                ),
                                textCapitalization:
                                    TextCapitalization.sentences,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            /* SingleChildScrollView(
              child: Column(
                children: [
                  PropertyUnitCard(
                    address: 'Room 1 B2',
                    propertyOccupant: 'Ebi Okpongu',
                  ),
                  PropertyUnitCard(
                    address: 'Room 2 B5',
                    propertyOccupant: 'Kingsley Amadi',
                  ),
                ],
              ),
            ) */
            Expanded(
              child: ListView.builder(
                itemCount: _propertyUnits.length,
                itemBuilder: (context, index) {
                  return PropertyUnitCard(
                    address:
                        '[${_propertyUnits[index]['billingGroup']['name']}] ${_propertyUnits[index]['houseNumber']} ${_propertyUnits[index]['streetName']}',
                    propertyOccupant:
                        '${_propertyUnits[index]['activeTenures'][0]['primaryResidents'][0]['displayName']}',
                    propertyUnit: _propertyUnits[index],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddPropertyAddressScreen()));
          },
          elevation: 0,
          backgroundColor: AppColors.defaultBlue,
          label: Text('Add Property Unit'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}

List getPropertyUnits() {
  return [
    PropertyUnits(
      address: "House 115, Olive Drive",
      propertyType: "Bungalow",
    ),
    PropertyUnits(
      address: "House 115, Olive Drive",
      propertyType: "Bungalow",
    ),
    PropertyUnits(
      address: "House 115, Olive Drive",
      propertyType: "Bungalow",
    ),
    PropertyUnits(
      address: "House 115, Olive Drive",
      propertyType: "Bungalow",
    ),
    PropertyUnits(
      address: "House 115, Olive Drive",
      propertyType: "Bungalow",
    ),
    PropertyUnits(
      address: "House 115, Olive Drive",
      propertyType: "Bungalow",
    ),
    PropertyUnits(
      address: "House 115, Olive Drive",
      propertyType: "Bungalow",
    ),
  ];
}
