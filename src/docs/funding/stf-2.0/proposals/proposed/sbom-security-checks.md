<!--
Original Author: Hendrik
Category: Security
-->

# SBOM and Security Scorecard Verification

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/181

**Original Item:** "Plugin/extension / Whatever that checks for all dependencies if A) SBOM is published publicly, B) Security information like OpenSSF Scorecard is published publicly and shows warnings / throw errors if not applied (Hendrik)"

**Note (Green):** "Idea: CRA is coming. It should help collect information about the dependencies based on SBOM and OpenSSF scorecard, for example. Possible solution: new report plugin Maybe a relationship between both"

## Problem Statement

With new regulations like the Cyber Resilience Act (CRA), every project must be way more aware of the security and quality of its dependencies.
It is important to not create vulnerabilities in the future.

## Current State / Starting Point

Today Maven does not check any project dependency or use plugins for security issues.

## Expected Outcomes / Benefits

It would be great to have a Maven plugin that checks all dependencies and plugins for security issues.
Here several checks could be applied like:
- SBOM is published publicly
- OpenSSF Scorecard is published publicly and shows warnings / throw errors if not applied

The plugin should be highly configurable to allow different levels of strictness / reporting.

## Discussion Summary

Community feedback pointed out that [such tools already exist](https://github.com/support-and-care/maven-support-and-care/discussions/181#discussioncomment-15574953): [OWASP DependencyCheck](https://dependency-check.github.io/DependencyCheck/dependency-check-maven/index.html) and [Sonatype OSS Index Maven Plugin](https://sonatype.github.io/ossindex-maven/maven-plugin/).
The proposal should clarify its unique value compared to existing solutions — whether this is about checking Maven itself, integrating SBOM/scorecard verification at a deeper level, or improving the CRA compliance story specifically.
