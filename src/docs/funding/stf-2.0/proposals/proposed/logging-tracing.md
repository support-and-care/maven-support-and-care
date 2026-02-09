<!--
Original Author: Gerd
Category: Maintenance
-->

# Logging and Tracing Policy for Maven

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/174

**Original Item:** "Logging, Tracing Policy (Gerd)"

## Problem Statement

Maven's current logging output is often too verbose at the INFO level for typical builds, yet lacks sufficient detail for troubleshooting complex issues. There is no consistent policy defining which events should be logged at which level. While the underlying logger supports trace logging, there is no CLI switch to easily enable it. Developers struggling with build issues have limited visibility into Maven's internal operations.

## Current State / Starting Point

- Maven uses SLF4J with a simple logger implementation
- INFO level output includes many details that could be DEBUG/TRACE
- Trace logging can be activated via system properties, but this is not user-friendly
- No standardized approach for categorizing log events by severity

## Expected Outcomes / Benefits

1. **Logging Policy Definition**: Establish clear guidelines for which events belong at which log level (ERROR, WARN, INFO, DEBUG, TRACE)

2. **Reduced Verbosity**: Make Maven less verbose at INFO level for cleaner build output in normal operation

3. **CLI Trace Switch**: Add a proper CLI option (e.g., `-X` enhancement or new flag) to enable trace-level logging for deep problem analysis

**Note**: A metrics collection for goal execution timing and performance analysis is covered by [Build Observability and Reporting](build-observability.md).

## Discussion Summary

The community broadly agreed on [reducing INFO-level verbosity](https://github.com/support-and-care/maven-support-and-care/discussions/174#discussioncomment-15548519).
Maven 4 already adds [per-plugin debug logging](https://github.com/support-and-care/maven-support-and-care/discussions/174#discussioncomment-15564189), which partially addresses the need.
Challenges were raised around [logging in parallel and forked execution](https://github.com/support-and-care/maven-support-and-care/discussions/174#discussioncomment-15591087) scenarios where output interleaving can make logs hard to read.
It was noted that [Maven 4 may already address some of these concerns](https://github.com/support-and-care/maven-support-and-care/discussions/174#discussioncomment-15570160), so the scope should be validated against the current Maven 4 state.
