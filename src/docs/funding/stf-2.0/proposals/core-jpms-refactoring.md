<!--
Original Author: Hendrik
Category: Maintenance
-->

# Refactor Maven Core to Full Java Modules

**Original Item:** "Refactor all Maven Core parts and dependencies to full JPMS modules (if not possible for a dependency, at least automatic module is a must) (Hendrik)"

## Problem Statement

While we add more and more support for Java modules to the functionality of Maven, the project itself stays a non-modular-source project.

## Current State / Starting Point

Maven Core is not itself based on Java modules (modular-sources).
Some dependencies might be Java modules, some might be automatic modules, and some are not Java-module aware.

## Expected Outcomes / Benefits

We should move Maven forward and refactor it to become based on Java modules that can use respective benefits (like access restrictions).
This will end in a better modularization of Maven and better support for JPMS-based projects.
All dependencies should be Java modules. Here we will contribute to those dependencies that are not yet Java modules.
