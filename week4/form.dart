import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext c) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const MultiStepForm(),
      );
}

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final _formKey = GlobalKey<FormState>();
  int _step = 0;

  final _email = TextEditingController(text: 'amalbs1305@gmail.com');
  final _password = TextEditingController();
  final _name = TextEditingController(text: 'Amal Benny');
  final _phone = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _next() {
    if (_step == 0) {
      // Validate only Account step fields
      final emailValid = _email.text.isNotEmpty && RegExp(r'\S+@\S+\.\S+').hasMatch(_email.text);
      final passwordValid = _password.text.length >= 8;

      if (emailValid && passwordValid) {
        setState(() => _step = 1);
      } else {
        _formKey.currentState!.validate(); // Trigger UI errors
      }
    } else if (_step == 1) {
      // Validate only Personal Details step fields
      final nameValid = _name.text.isNotEmpty;
      final phoneValid = _phone.text.length >= 10;

      if (nameValid && phoneValid) {
        _submit();
      } else {
        _formKey.currentState!.validate();
      }
    }
  }

  void _back() {
    if (_step > 0) setState(() => _step -= 1);
  }

  void _submit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Submission Successful!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Multi-Step Registration')),
        body: Form(
          key: _formKey,
          child: Stepper(
            currentStep: _step,
            onStepContinue: _next,
            onStepCancel: _step > 0 ? _back : null,
            controlsBuilder: (context, details) {
              final isLastStep = _step == 1;
              return Row(
                children: [
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(isLastStep ? 'Submit' : 'Next'),
                  ),
                  if (_step > 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                    ),
                ],
              );
            },
            steps: [
              Step(
                title: const Text('Account'),
                isActive: _step == 0,
                state: _step > 0 ? StepState.complete : StepState.indexed,
                content: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (_step != 0) return null; // Validate only on this step
                        return v != null && RegExp(r'\S+@\S+\.\S+').hasMatch(v)
                            ? null
                            : 'Enter valid email';
                      },
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (v) {
                        if (_step != 0) return null;
                        return (v != null && v.length >= 8) ? null : 'Min 8 chars';
                      },
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text('Personal Details'),
                isActive: _step == 1,
                state: _step == 1 ? StepState.editing : StepState.indexed,
                content: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(labelText: 'Full Name'),
                      validator: (v) {
                        if (_step != 1) return null;
                        return (v != null && v.isNotEmpty) ? null : 'Enter your name';
                      },
                    ),
                    TextFormField(
                      controller: _phone,
                      decoration: const InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                      validator: (v) {
                        if (_step != 1) return null;
                        return (v != null && v.length >= 10) ? null : 'Enter valid phone';
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
