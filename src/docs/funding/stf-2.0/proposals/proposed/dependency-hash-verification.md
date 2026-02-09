<!--
Original Author: Hendrik
Category: Security
-->

# Dependency Hash Verification

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/169

**Original Item:** "Extension for dependency definition in POM to add hash to a dependency that will be checked at build time to make bad dependency injection not possible (Hendrik)"

## Problem Statement

A company could have an internal repository that contains / caches dependencies.
This repository could be used by multiple projects, and multiple teams have write access to it.
Somebody could inject a malicious dependency into the repository.
This dependency would be available for all projects that depend on it.

## Current State / Starting Point

While Maven central and Maven in general are already aware of hashes, it is not possible to define a hash for a dependency in the POM itself.
This would make it possible to verify the dependency at build time to ensure that the dependency is not manipulated.

## Expected Outcomes / Benefits

Maven can verify the integrity of dependencies at build time.
To do so, it must be possible to specify the hash of a dependency (or plugin) in the POM.

## Discussion Summary

Community feedback revealed that Maven [already provides integrity verification mechanisms](https://github.com/support-and-care/maven-support-and-care/discussions/169#discussioncomment-15614559): the `--strict-checksums` flag, three kinds of checksums (external, included in artifact, and provided separately), and lockfile support.
A working example of a fully locked-down build is demonstrated in [java-ipfs-http-client](https://github.com/support-and-care/maven-support-and-care/discussions/169#discussioncomment-15614559).
Additionally, a [blog post on lockfiles](https://maveniverse.eu/blog/2025/12/06/lockfiles/) describes the current state of the art.
The scope of this proposal should be reevaluated against existing capabilities to identify what is genuinely missing vs. what needs better documentation.

