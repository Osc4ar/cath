import 'package:cath/search_screen.dart';
import 'package:flutter/material.dart';
import 'app_header.dart';
import 'user_data_for_search.dart';

class ComparatorSection extends StatefulWidget {
  ComparatorSection({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ComparatorSectionState();
}

class ComparatorSectionState extends State<ComparatorSection> {

  int currentStep = 0;
  List<int> _destino = [0];
  List<int> _ingresos = [0];
  List<int> _plazo = [0];

  List<String> destinosTitles = [
    'COMPRAR CASA',
    'COMPRAR TERRENO',
    'CONSTRUIR',
    'REMODELAR',
    'CAMBIAR HIPOTECA',
  ];

  List<String> ingresosTitles = [
    'Menos de \$10,000',
    'Entre \$10,000 y \$20,000',
    'Entre \$20,000 y \$30,000',
    'Más de \$30,000',
  ];

  List<String> plazosTitles = [
    '5 años',
    '7 años',
    '10 años',
    '15 años',
    '20 años',
  ];

  Widget _buildRadioListTile(BuildContext context, int index, String title, List<int> groupValue) {
    return RadioListTile<int>(
      title: Text(title),
      value: index,
      groupValue: groupValue[0],
      onChanged: (int value) {
        setState(() {
          groupValue[0] = value;
        });
      },
    );
  }

  List<Widget> _buildRadioList(BuildContext context, List<String> titles, List<int> groupValue) {
    List<Widget> radioList = new List();
    for (int i = 0; i < titles.length; i++)
      radioList.add(_buildRadioListTile(context, i, titles[i], groupValue));
    return radioList;
  }

  List<Step> getSteps(BuildContext context) {
    return [
      Step(
        title: Text('Destino'),
        //subtitle: Text('Uso del crédito'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildRadioList(context, destinosTitles, _destino),
        ),
        isActive: true,
      ),
      Step(
        title: Text('Plazo'),
        //subtitle: Text('Tiempo para pagar crédito'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildRadioList(context, plazosTitles, _plazo),
        ),
        isActive: true,
      ),
      Step(
        title: Text('Ingresos'),
        //subtitle: Text('Ingresos mensuales'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildRadioList(context, ingresosTitles, _ingresos),
        ),
        isActive: true,
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        AppHeader('COMPARADOR CRÉDITOS HIPOTECARIOS', Color(0xFF182C47)),
        Container(
          height: 445,
          child: Stepper(
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepTapped: (index) {
                setState(() {
                  currentStep = index;
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currentStep > 0)
                    currentStep--;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (currentStep < 2)
                    currentStep++;
                  else {
                    Navigator.pushNamed(
                      context,
                      SearchScreen.routeName,
                      arguments: UserDataForSearch(
                        _destino[0],
                        _ingresos[0],
                        _plazo[0],
                      ),
                    );
                  }
                });
              },
              steps: getSteps(context),
              ),
        )
      ],
    );
  }
}