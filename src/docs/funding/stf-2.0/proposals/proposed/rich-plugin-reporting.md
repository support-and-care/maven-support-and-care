<!--
Original Author: Hendrik
Category: Documentation
-->

# Rich Reporting for Important Plugins

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/180

**Original Item:** "Provide rich (HTML, nice print/pdf support, including graphs, …) reporting for important plugins like surefire, jacoco, spotbugs, ... (Hendrik)"

**Note (Green):** "Report Output in general independent of the Maven site plugin"

## Problem Statement

There are several well-known plugins for Maven (surefire, jacoco, spotbugs, ...) that provide reports.
While those reports are all machine-readable, there is not always a well-designed human-readable report.

## Current State / Starting Point

The different plugins provide different levels of reporting for humans.
Some plugins provide HTML reports, but those are often not very nice to read.

## Expected Outcomes / Benefits

Provide rich reporting for important plugins.
In the best case we provide a generic reporting framework that can be used by all plugins.

## Discussion Summary

There was [skepticism about creating a generic reporting framework](https://github.com/support-and-care/maven-support-and-care/discussions/180#discussioncomment-15548857) (cf. [xkcd #927](https://xkcd.com/927/)), with a suggestion to improve existing reports individually rather than building a new abstraction.
The question was also raised whether the [reports are produced by the plugins or the underlying tools themselves](https://github.com/support-and-care/maven-support-and-care/discussions/180#discussioncomment-15591111), which affects the scope of what Maven can improve.
