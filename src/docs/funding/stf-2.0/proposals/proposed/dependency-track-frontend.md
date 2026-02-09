<!--
Original Author: Hendrik
Category: Security
-->

# New Frontend for Dependency-Track

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/170

**Original Item:** "New Frontend (or refactoring the current one) for Dependency-Track that does not need any login to search and find results for libs (Hendrik)"

## Problem Statement

Users need an account to search and find libs in Dependency-Track.

## Current State / Starting Point

We provide a public Dependency-Track instance for the community.
The current frontend needs a login to search and find results for libs.
Next to that, the general Dependency-Track frontend is not that intuitive to find libs and their known vulnerabilities.


## Expected Outcomes / Benefits

A simple-to-use frontend that does not require a login and provides security relevant information.

## Discussion Summary

Community feedback [questioned whether this is within scope for the Maven project](https://github.com/support-and-care/maven-support-and-care/discussions/170#discussioncomment-15548555).
Existing alternatives like `mvn dependency:tree`, mvnrepository.com, and modern IDEs [already provide vulnerability information](https://github.com/support-and-care/maven-support-and-care/discussions/170#discussioncomment-15591102).
The value proposition of this proposal needs to be clarified against these existing capabilities.
