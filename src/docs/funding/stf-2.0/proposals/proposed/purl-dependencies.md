<!--
Original Author: Hendrik
Category: Modernization
-->

# Define Maven Dependencies by Using purl-spec

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/197

## Problem Statement

Maven lacks support for the Package URL (purl-spec) standard, a language- and build-system-independent URL schema for identifying software packages. Adopting purl would improve interoperability with security tooling (CVE databases, SBOM tools) and cross-ecosystem dependency management.

## Current State / Starting Point

- The purl-spec standard is defined at [tc54.org/purl/](https://tc54.org/purl/) (ECMA TC54)
- A Java implementation exists: [github.com/package-url/packageurl-java](https://github.com/package-url/packageurl-java)
- Maven currently uses its own GAV (GroupId:ArtifactId:Version) coordinate system
- Security and SBOM tools increasingly use purl for cross-ecosystem identification

## Expected Outcomes / Benefits

1. **Standard Compliance**: Maven can produce and consume purl identifiers for dependencies
2. **Security Tooling Integration**: Better interoperability with CVE databases and vulnerability scanners that use purl
3. **Cross-Ecosystem**: Standardized package identification across build tools and languages

## Open Questions

- Maven 4's type system (e.g., `annotation-processor`, `module-jar`) doesn't map cleanly to purl's simpler classification, which may require workarounds
- Scope of integration: read-only purl generation vs. purl as input in POM files

## Discussion Summary

Strong community opposition to using PURL in POM files.
Using PURL in the POM [goes against Maven 4 design choices](https://github.com/support-and-care/maven-support-and-care/discussions/197#discussioncomment-15658764) and should stay decoupled for evolvability.
The [current PURL specification is lossy](https://github.com/support-and-care/maven-support-and-care/discussions/197#discussioncomment-15694227) — it does not support snapshots, repository IDs, and other Maven-specific concepts, which would break routing (RRF).
The proposal should be refocused on read-only PURL generation for interoperability with security tooling, not on using PURL as input in POM files.
