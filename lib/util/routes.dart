import 'package:flutter/material.dart';
import '../screens/estate/expenditure/expenditure_screen.dart';
import '../screens/estate/expense/add_expense_screen.dart';
import '../screens/estate/ledger/ledger_screen.dart';
import '../screens/estate/more/services/manage/services_list_screen.dart';
import '../screens/estate/more/settings/account_settings_screen.dart';
import '../screens/estate/payment/manage/payment_screen.dart';
import '../screens/estate/property_unit/create/property_address_screen.dart';
import '../screens/estate/payment/record_payment/record_payment.dart';
import '../screens/estate/more/analytics/analytics_screen.dart';
import '../screens/estate/more/debtors/debtors_list_screen.dart';
import '../screens/estate/more/financial_report/financial_report_screen.dart';
import '../screens/estate/more/guests/guest_list_screen.dart';
import '../screens/estate/more/incident_report/incident_report_screen.dart';
import '../screens/estate/more/messages/messages_screen.dart';
import '../screens/estate/more/projects/projects_list_screen.dart';
import '../screens/estate/move_out_residence/move_out_resident_screen.dart';
import '../screens/estate/settlements/settlement_list_screen.dart';
import '../screens/welcome/splash_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  // Dashboard menu route
  '/splashscreen': (context) => const SplashScreen(),
  // Record Payment Estate Manager
  '/record_payment': (context) => RecordPaymentScreen(),
  // Add Property Unit
  '/add_property_unit': (context) => AddPropertyAddressScreen(),
  // Record Expenses
  '/record_expenses': (context) => RecordExpensesScreen(),
  // Remove Resident
  '/remove_resident': (context) => RemoveResidentScreen(),

  // payments
  '/manager_payment': (context) => ManagerPaymentScreen(),
  '/manager_ledger': (context) => LedgerScreen(),
  '/manager_expenditure': (context) => ExpenditureScreen(),

  // Estate Settlement
  '/settlements': (context) => SettlementListScreen(),
  
  // more tab
  '/guest_list': (context) => GuestListScreen(),
  '/analytics': (context) => AnalyticsScreen(),
  '/debtors_list': (context) => DebtorsListScreen(),
  '/projects_list': (context) => ProjectsListScreen(),
  '/services_list': (context) => ServicesListScreen(),
  '/messages': (context) => MessagesScreen(),
  '/incident_report': (context) => IncidentScreen(),
  '/financial_report': (context) => FinancialReportScreen(),
  '/settings': (context) => AccountSettingsScreen(),

  
  
};