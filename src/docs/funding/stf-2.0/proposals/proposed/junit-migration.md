<!--
Original Author: Sandra
Category: Maintenance
-->

# Migration of JUnit 4/5 Based Tests to JUnit 6

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/173

**Original Item:** "Migration of JUnit 4-based tests to JUnit 5/6 (JUnit 4 EOL) (Sandra)"

## Problem Statement

The current tests in Apache Maven Core and Plugins are based on JUnit 4 and JUnit 5.
[JUnit 4](https://junit.org/junit4/) is in maintenance mode, and it is no longer supported by the community.
JUnit 6 is the current version of the testing framework.

## Current State / Starting Point
While working on the [Change the surefire/failsafe plugin and using JUnit as a platform only,](https://github.com/support-and-care/maven-support-and-care/issues/51) we already migrated JUnit 3-based tests or tests that had a dependency on JUnit 3 to JUnit 5.
JUnit 5 was chosen because some JUnit-5-based tests exist.
So in the end the test code base has tests based on JUnit 4 and 5.

## Expected Outcomes / Benefits

All tests in the Apache Maven ecosystem (Core and Plugins) are migrated to JUnit 6.
The benefit is that after the migration, the tests are based on the current version of the testing framework, so that continuous maintenance of the tests will be easier.

## Discussion Summary

This proposal generated significant discussion. Key concerns include:

- **JDK 8 compatibility**: Maven 3.x plugins [must remain compatible with JDK 8](https://github.com/support-and-care/maven-support-and-care/discussions/173#discussioncomment-15548574), which may limit JUnit 6 adoption
- **Migration necessity questioned**: There was [pushback on migrating for its own sake](https://github.com/support-and-care/maven-support-and-care/discussions/173#discussioncomment-15548574) when tests are working fine — the effort should be weighed against direct user value
- **JUnit 6 and Vintage**: JUnit 6 has [deprecated the JUnit Vintage engine](https://github.com/support-and-care/maven-support-and-care/discussions/173#discussioncomment-15607553), which means JUnit 4 tests would need actual migration rather than running via compatibility layers
- **Community help available**: OpenRewrite maintainers [offered to assist](https://github.com/support-and-care/maven-support-and-care/discussions/173#discussioncomment-15548204) with automated migration recipes

