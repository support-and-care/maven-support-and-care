<!--
Original Author: Hendrik
Category: Modernization
-->

# Test Fixtures Best Practice for Maven 4

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/183

**Original Item:** "A best practice way for [testFixtures](https://blog.cronn.de/de/testing/java/gradle/2023/04/20/gradle-testfixtures.html) in Maven 4. Solution for JPMS and classic classpath should be provided (Hendrik)"

## Problem Statement

With projects getting more complex and modular, it is important to have a good way to test the integration of those modules.
Especially with Java modules and access restrictions, tests of those modules can become more complex.

## Current State / Starting Point

While Gradle has the concept of [test fixtures](https://docs.gradle.org/current/userguide/java_testing.html#sec:java_test_fixtures), Maven does not have a similar concept.
A (bad) workaround for such situations is a test-jar or a maven submodule that contains shareable test logic.
But the test fixtures concept is way more elegant and especially for JPMS based projects it has a lot of benefits.

## Expected Outcomes / Benefits

We need something similar to Gradle test fixtures in Maven.

## Discussion Summary

The community questioned whether this is [similar to the existing `jar:test-jar` functionality](https://github.com/support-and-care/maven-support-and-care/discussions/183#discussioncomment-15575091), suggesting a preference for improving existing Maven features rather than adding new ones.
The proposal should clarify what test fixtures provide beyond test-jar, particularly for JPMS-based projects.
