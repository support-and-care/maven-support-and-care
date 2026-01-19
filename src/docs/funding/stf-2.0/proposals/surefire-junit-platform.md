<!--
Original Author: Olivier
Category: Maintenance
-->

# Surefire JUnit Platform Migration

## Problem Statement

The current Maven Surefire/Failsafe plugin architecture maintains separate test providers for JUnit 3, JUnit 4, JUnit 5/Jupiter, and TestNG, creating a maintenance complexity with 5 different
implementations to maintain. This fragmented approach makes adding new features or fixing bugs across all testing frameworks time-consuming and discourages new contributors. Additionally,
JUnit 3 and older JUnit 4 versions (pre-4.12) are outdated and no longer actively supported, yet the plugins still maintain compatibility code for these legacy versions.

## Current State / Starting Point

The major refactoring work in PR #3179 (https://github.com/apache/maven-surefire/pull/3179) has consolidated all test execution under the JUnit Platform infrastructure:

 - Completed: JUnit 3 provider completely removed; JUnit 3 tests now run via JUnit Vintage engine
 - Completed: Minimum JUnit 4 version enforced to 4.12; older versions are no longer supported
 - Completed: JUnit 4 tests are now executed via JUnit Platform + Vintage engine instead of a separate provider
 - Completed: TestNG integration migrated to run under JUnit Platform with proper group/tag mappings
 - Completed: A minimum TestNG version is set to 6.14.3
 - In Progress: Fine-tuning parallel execution, error handling, and lifecycle behaviors under the unified platform
 - In Progress: Addressing compatibility edge cases and behavioral differences from the provider consolidation

## Expected Outcomes / Benefits

 - Single Implementation: Reduced the maintenance burden from 5 test providers down to 1 JUnit Platform-based runner, making feature additions and bug fixes significantly easier
 - Better Java Module Support: Unified platform approach enables proper Java Module System support for testing, including integration testing scenarios
 - Framework Flexibility: Built-in support for future testing frameworks through JUnit Platform's extensible engine architecture (Cucumber, Spock, etc.)
 - Simplified Configuration: Consolidated test configuration approach instead of framework-specific settings, reducing user complexity
 - Modern Foundation: Current, actively maintained testing infrastructure foundation that aligns with industry standards and ensures long-term viability
 - Contributor Friendly: Simplified codebase encourages new contributors by eliminating the need to understand multiple testing provider implementations