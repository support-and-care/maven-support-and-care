<!--
Original Author: Hendrik
Category: Maintenance
-->

# Migrate All Apache Plugins to Maven 4 APIs

**Original Item:** "Migrate all Apache Plugins to Maven 4 APIs and standards to move forward (Hendrik)"

## Problem Statement

Maven 4 provides a new plugin API.
While Maven 4 is upward compatible to Maven 3 plugins, we should move all Apache maintained plugins to the new APIs and standards to be able to move forward with new features and improvements.

## Current State / Starting Point

Most plugins are still using Maven 3 APIs.

## Expected Outcomes / Benefits

All plugins are using Maven 4 APIs.
A v3 version of the plugins can be maintained in LTS support as part of the funding round.
The LTS support must be included in the calculation of the funding for this epic.
