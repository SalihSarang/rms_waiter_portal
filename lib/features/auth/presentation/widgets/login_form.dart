import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_event.dart';
import '../bloc/login_form/login_form_cubit.dart';

import 'login_form_components/login_email_field.dart';
import 'login_form_components/login_password_field.dart';
import 'login_form_components/login_submit_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  void _openDemoCredentialsDialog(BuildContext context, LoginFormCubit cubit) {
    RmsDemoCredentialsDialog.show(
      context,
      currentPortalSpec: DemoConfig.waiter,
      initialSessionCode: DemoSessionManager.activeSessionId,
      onAutoFill: (email, password, sessionCode) {
        cubit.fillCredentials(email, password);
      },
      onAutoFillAndSignIn: (email, password, sessionCode) {
        cubit.fillCredentials(email, password);
        context.read<AuthBloc>().add(DemoSignInEvent(sessionCode: sessionCode));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginFormCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginEmailField(),
          LoginPasswordField(),
          const SizedBox(height: 16),
          LoginSubmitButton(),
          RmsDemoCredentialsButton(
            onPressed: () => _openDemoCredentialsDialog(context, cubit),
          ),
        ],
      ),
    );
  }
}
