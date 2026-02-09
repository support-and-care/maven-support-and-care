<!--
Original Author: Hendrik
Category: Modernization
-->

# Maven Initializer V2

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/175

**Original Item:** "Maven Initializer V2 (Hendrik)"

## Problem Statement

The Maven Initializer is a tool to help new users get started with Maven.
It is missing several features that are important for a modern build.

## Current State / Starting Point

We have a basic version of the Maven Initializer that can create simple Maven projects.

## Expected Outcomes / Benefits

Several improvements to the Maven Initializer, including:
- Make the API usable from other tools
- Java Module support
- Add at least all metadata (author, ...) is needed for publishing to Maven Central
- Provide ready-to-use tooling for Maven Central publishing
- GitHub (+ Codeberg) integration to directly create the project on GitHub/Codeberg
- Configuration and tooling for CI/CD pipelines (GitHub Actions, ...)
- Setup for JMH benchmarks
- ...

## Discussion Summary

There was initial [confusion about what the Maven Initializer is vs. archetypes](https://github.com/support-and-care/maven-support-and-care/discussions/175#discussioncomment-15548710), and the relationship between the two should be clarified in the proposal.
Concerns were raised about [hardcoded dependency choices](https://github.com/support-and-care/maven-support-and-care/discussions/175#discussioncomment-15548800) (e.g., AssertJ) in generated projects.
The web UI concept was [well received](https://github.com/support-and-care/maven-support-and-care/discussions/175#discussioncomment-15548988) once understood.
See also the related [Modernization of Maven Archetypes](archetype-modernization.md) proposal.
