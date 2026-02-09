<!--
Original Author: Slawek
Category: Maintenance
-->

# Modernization of Maven Archetypes

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/191

## Problem Statement

Creating projects with existing Maven Archetypes yields outdated project structures and obsolete practices. The current archetypes at maven.apache.org rely on old conventions, and the generation process requires verbose commands with extensive parameters.

## Current State / Starting Point

- Official Maven archetypes produce outdated project structures
- Generation requires verbose commands, e.g.: `mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5`
- Some archetypes may be redundant or no longer relevant
- New users get a poor first impression of Maven due to outdated generated projects

## Expected Outcomes / Benefits

1. **Modern Templates**: Updated archetypes that produce contemporary project structures following current best practices
2. **Archetype Audit**: Evaluation of existing archetypes - identify which are still necessary, remove redundant or outdated ones
3. **Streamlined CLI**: Simplified execution methods, potentially including new goals for rapid project initialization
4. **Better Onboarding**: Improved first-time user experience with Maven

## Discussion Summary

A key pain point raised is that [generated projects are "detached" from their archetype](https://github.com/support-and-care/maven-support-and-care/discussions/191#discussioncomment-15694519) — when a new archetype version is released with updated plugins or dependencies, existing projects cannot be updated.
This relates to the idea of tracking the source archetype and enabling updates via tools like OpenRewrite.
The [domtrip](https://github.com/maveniverse/domtrip) library was mentioned as a foundation for lossless programmatic editing of Maven-related files, which could support archetype-based project upgrades.
