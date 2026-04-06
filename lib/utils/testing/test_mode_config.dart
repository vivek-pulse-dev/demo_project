import 'dart:math';
import 'package:demo_project/features/usermanagement/models/user.dart';
import 'package:demo_project/utils/services/db_service.dart';
import 'package:demo_project/utils/logs/log_utils.dart';

/// --- TESTING MODE CONFIGURATION ---
/// Set [isTestMode] to true to enable auto-generation of mock data.
/// WARNING: Enabling this will CLEAR the database on every app start.
bool isTestMode = true;

/// Number of users to generate if [isTestMode] is true.
int testUserCount = 100;

/// Prepare the database with mock data if testing mode is enabled.
Future<void> setupTestData() async {
  if (!isTestMode) return;

  LogUtils.info('TESTING MODE ENABLED: Preparing mock data...');

  try {
    // 1. Clear existing data
    await DbService.deleteAllUsers();
    LogUtils.info('Database cleared.');

    // 2. Generate random users
    final List<String> firstNames = [
      'James',
      'Mary',
      'Robert',
      'Patricia',
      'John',
      'Jennifer',
      'Michael',
      'Linda',
      'William',
      'Elizabeth',
      'David',
      'Barbara',
      'Richard',
      'Susan',
      'Joseph',
      'Jessica',
      'Thomas',
      'Sarah',
      'Charles',
      'Karen',
      'Wilson',
      'Anderson',
      'Thomas',
      'Taylor',
      'Moore',
      'Jackson',
      'Martin',
    ];
    final List<String> lastNames = [
      'Smith',
      'Johnson',
      'Williams',
      'Brown',
      'Jones',
      'Garcia',
      'Miller',
      'Davis',
      'Rodriguez',
      'Martinez',
      'Hernandez',
      'Lopez',
      'Gonzalez',
      'Wilson',
      'Anderson',
      'Thomas',
      'Taylor',
      'Moore',
      'Jackson',
      'Martin',
      'Linda',
      'William',
      'Elizabeth',
      'David',
      'Barbara',
      'Richard',
      'Susan',
      'James',
      'Mary',
      'Robert',
      'Patricia',
      'John',
      'Jennifer',
      'Michael',
    ];

    final Random random = Random();

    for (int i = 1; i <= testUserCount; i++) {
      final String firstName = firstNames[random.nextInt(firstNames.length)];
      final String lastName = lastNames[random.nextInt(lastNames.length)];
      final String email =
          '${firstName.toLowerCase()}.${lastName.toLowerCase()}.$i@example.com';

      // Random birth date between 1970 and 2005
      final int year = 1970 + random.nextInt(36);
      final int month = 1 + random.nextInt(12);
      final int day = 1 + random.nextInt(28);
      final String birthDate =
          '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

      final user = User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: 'Password123!',
        birthDate: birthDate,
      );

      await DbService.insertUser(user);
    }

    LogUtils.info('Successfully generated $testUserCount mock users.');
  } catch (e, stack) {
    LogUtils.error('Failed to setup test data', e, stack);
  }
}
