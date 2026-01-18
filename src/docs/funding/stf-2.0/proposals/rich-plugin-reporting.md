<!--
Original Author: Hendrik
Category: Documentation
-->

# Rich Reporting for Important Plugins

**Original Item:** "Provide rich (HTML, nice print/pdf support, including graphs, ....) reporting for important plugins like surefire, jacoco, spotbugs, ... (Hendrik)"

**Note (Green):** "Report Output in general independent of the maven site plugin"

## Problem Statement

There are several well known plugins for Maven (surefire, jacoco, spotbugs, ...) that provide reports.
While those reports are all machine-readable, there is not always a well designed human-readable report.

## Current State / Starting Point

The different plugins provide different levels of reporting for humans.
Some plugins provide HTML reports but those are often not very nice to read.

## Expected Outcomes / Benefits

Provide rich reporting for important plugins.
In best case we provide a generic reporting framework that can be used by all plugins.
