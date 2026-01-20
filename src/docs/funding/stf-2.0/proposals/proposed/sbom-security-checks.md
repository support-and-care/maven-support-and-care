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
