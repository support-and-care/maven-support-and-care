<!--
Original Author: Hendrik
Category: Maintenance
-->

# Refactor Maven Core to Full JPMS Modules

**Original Item:** "Refactor all maven Core parts and dependencies to full JPMS modules (if not possible for a dependency, at least automodule is a must) (Hendrik)"

## Problem Statement

While we add more and more support for JPMS and module based projects to the functionallity of maven, the project itself stays a non JPMS project.

## Current State / Starting Point

Maven is a not a JPMS project.
Some dependencies might be JPMS modules, some might be automodules and some are non JPMS aware.

## Expected Outcomes / Benefits

We should move Maven forward and refactor it to become a JPMS based project that can use the benefits (like access restrictions) of JPMS.
This will end in a better modularization of Maven and a better support for JPMS based projects.
All dependencies should be JPMS modules. Here we will contribute to those dependencies that are not yet JPMS modules.
