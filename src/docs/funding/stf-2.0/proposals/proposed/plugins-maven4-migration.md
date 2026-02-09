<!--
Original Author: Hendrik
Category: Maintenance
-->

# Migrate All Apache Plugins to Maven 4 APIs

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/179

**Original Item:** "Migrate all Apache Plugins to Maven 4 APIs and standards to move forward (Hendrik)"

## Problem Statement

Maven 4 provides a new plugin API.
While Maven 4 is upward compatible to Maven 3 plugins, we should move all Apache-maintained plugins to the new APIs and standards to be able to move forward with new features and improvements.

## Current State / Starting Point

Most plugins are still using Maven 3 APIs.

## Expected Outcomes / Benefits

All plugins are using Maven 4 APIs.
A v3 version of the plugins can be maintained in LTS support as part of the funding round.
The LTS support must be included in the calculation of the funding for this epic.

## Discussion Summary

Strong community feedback against a blanket migration.
Migration should be done [case by case when there is clear need and benefit](https://github.com/support-and-care/maven-support-and-care/discussions/179#discussioncomment-15548624), not as an overall project that distracts from bug fixes and features.
The community warned against [forking v4 versions just for the sake of using the new API](https://github.com/support-and-care/maven-support-and-care/discussions/179#discussioncomment-15570171): Maven 3 is not going away, maintaining v3 and v4 in parallel is hard, and Maven 4 is expected to support the Maven 3 API well.
The meaning of ["maintained" for v3 LTS needs clarification](https://github.com/support-and-care/maven-support-and-care/discussions/179#discussioncomment-15564297).
