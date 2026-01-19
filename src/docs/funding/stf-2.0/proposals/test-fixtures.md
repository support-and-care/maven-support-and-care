<!--
Original Author: Hendrik
Category: Modernization
-->

# Test Fixtures Best Practice for Maven 4

**Original Item:** "A best practice way for [testFixtures](https://blog.cronn.de/de/testing/java/gradle/2023/04/20/gradle-testfixtures.html) in Maven 4. Solution for JPMS and classic classpath should be provided (Hendrik)"

## Problem Statement

With projects getting more complex and modular, it is important to have a good way to test the integration of those modules.
Especially with Java modules and access restrictions, tests of those modules can become more complex.

## Current State / Starting Point

While Gradle has the concept of [test fixtures](https://docs.gradle.org/current/userguide/java_testing.html#sec:java_test_fixtures), Maven does not have a similar concept.

## Expected Outcomes / Benefits

We need something similar to Gradle test fixtures in Maven.
