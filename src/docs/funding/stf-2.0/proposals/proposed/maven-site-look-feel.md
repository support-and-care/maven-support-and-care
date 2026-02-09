<!--
Original Author: Hendrik
Category: Documentation
-->

# Update Look and Feel of Generated Maven Sites

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/176

**Original Item:** "Update Look and Feel of generated Maven sites (Hendrik)"

## Problem Statement

The output of the Maven Site Plugin is not very appealing.
It should be updated to look more modern.

## Current State / Starting Point

The Maven Site Plugin currently generates sites using the default skin and basic CSS styling.
The resulting pages are functional but look dated, with a simple layout and limited responsiveness or branding.

## Expected Outcomes / Benefits

We need to update the Maven Site Plugin to look more modern.
Here a well-known CSS framework can be used.

## Discussion Summary

This proposal received [strong pushback against "modern" redesigns](https://github.com/support-and-care/maven-support-and-care/discussions/176#discussioncomment-15548652) that prioritize aesthetics over usability.
The suggested approach is to [create a new skin](https://github.com/support-and-care/maven-support-and-care/discussions/176#discussioncomment-15564671) rather than modifying the site plugin itself.
There was support for [dark mode](https://github.com/support-and-care/maven-support-and-care/discussions/176#discussioncomment-15611247), with a preference for respecting browser/OS theme preferences via plain HTML and `prefers-color-scheme` CSS rather than adding heavy frameworks.
