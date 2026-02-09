<!--
Original Author: Hendrik
Category: Modernization
-->

# Global Dependency Replacements

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/172

**Original Item:** "Global Replacements for dependencies (Hendrik)"

## Problem Statement

In a bigger multi-module project you can have multiple modules that depend on the same dependency.
Such a dependency can bring in transitive dependencies that are not needed/wanted in all modules.
It must be easy to handle such transitive dependencies in a global way.

## Current State / Starting Point

Today the transitive dependencies of a dependency are only handled on a per-module basis.
Even if the dependency itself is `dependencyManagement` of the parent pom.

## Expected Outcomes / Benefits

It must be possible to define global replacements for dependencies in the `dependencyManagement` section of a parent pom.
Such a replacement can be an exclusion of a transitive dependency or a replacement of a transitive dependency with another version.
This must be applied to all modules that inherit from the parent pom.

## Discussion Summary

Community feedback revealed that [this is already possible in Maven 4](https://github.com/support-and-care/maven-support-and-care/discussions/172#discussioncomment-15614669).
The feature was implemented in response to the Log4Shell vulnerability (CVE-2021-44228).
The scope of this proposal should shift to documentation and promoting awareness of the existing Maven 4 capability rather than implementing new functionality.