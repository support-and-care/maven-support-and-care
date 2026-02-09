<!--
Original Author: Hendrik
Category: Documentation
-->

# Support Versions in Hosted Maven Sites

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/184

**Original Item:** "Support Versions in hosted Maven Sites (Hendrik)"

**Note (Green):** "Mainly for examples"

## Problem Statement

Maven plugins evolve over time and so does the documentation.
When you depend on a specific version of a plugin, you should be able to access the documentation of that version.

## Current State / Starting Point

Today the Maven site plugin only supports one version of the documentation.

## Expected Outcomes / Benefits

Provide a way to host multiple versions of the documentation.

## Discussion Summary

The community was supportive.
A Maven committer [has ideas on how to implement this without changing everything](https://github.com/support-and-care/maven-support-and-care/discussions/184#discussioncomment-15570217) and is interested to help.
An important requirement is that [versions must be updateable independently of each other](https://github.com/support-and-care/maven-support-and-care/discussions/184#discussioncomment-15591061).
