<!--
Original Author: Hendrik
Category: Security
-->

# Dependency Hash Verification

**Original Item:** "Extension for dependency definition in POM to add hash to a dependency that will be checked at build time to make bad dependency injection not possible (Hendrik)"

## Problem Statement

A company could have an internal repository that contains / caches dependencies.
This repository could be used by multiple projects, and multiple teams have write access to it.
Somebody could inject a malicious dependency into the repository.
This dependency would be available for all projects that depend on it.

## Current State / Starting Point

While Maven central and maven in general are already aware of hashes, it is not possible to define a hash for a dependency in the POM itself.
This would make it possible to verify the dependency at build time to ensure that the dependency is not manipulated.

## Expected Outcomes / Benefits

Maven can verify the integrity of dependencies at build time.
To do so, it must be possible to specify the hash of a dependency (or plugin) in the POM.

