import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/widgets/login_form_components/login_submit_button.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/login_form/login_form_cubit.dart';
import 'package:rms_design_system/rms_design_system.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockLoginFormCubit extends MockCubit<LoginFormState>
    implements LoginFormCubit {}

void main() {
  late AuthBloc authBloc;
  late LoginFormCubit loginFormCubit;

  setUp(() {
    authBloc = MockAuthBloc();
    loginFormCubit = MockLoginFormCubit();

    // Default mock behavior
    when(() => authBloc.state).thenReturn(AuthInitial());
    when(() => loginFormCubit.state).thenReturn(const LoginFormState());
    when(
      () => loginFormCubit.emailController,
    ).thenReturn(TextEditingController());
    when(
      () => loginFormCubit.passwordController,
    ).thenReturn(TextEditingController());
    when(() => loginFormCubit.formKey).thenReturn(GlobalKey<FormState>());
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: authBloc),
            BlocProvider.value(value: loginFormCubit),
          ],
          child: const LoginSubmitButton(),
        ),
      ),
    );
  }

  testWidgets('renders RmsButton with "Login" text', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(RmsButton), findsOneWidget);
  });

  testWidgets('shows loading indicator when state is AuthLoading', (
    tester,
  ) async {
    when(() => authBloc.state).thenReturn(AuthLoading());
    await tester.pumpWidget(createWidgetUnderTest());

    // Check if RmsButton is in loading state
    final button = tester.widget<RmsButton>(find.byType(RmsButton));
    expect(button.isLoading, isTrue);
  });
}
