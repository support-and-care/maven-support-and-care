---
month: October
year: 2026
excerpt: Advanced Apache Trusted Releases (ATR) adoption for Maven projects and the atr-maven-plugin, launched SBOM Reporting with Dependency-Track integration, and released Maven Surefire 3.6.1 alongside integration-test fixes for Maven 3.10.0 and Maven 4.
contributors:
  - https://github.com/sparsick
  - https://github.com/Ndacyayisenga-droid
  - https://github.com/slawekjaranowski
  - https://github.com/sebtiem
  - https://github.com/olamy
  - https://github.com/Mayaleeeee
---

# October 2026

## Work Package 1 — Security of the Supply Chain

- type: IMPROVEMENT
  text: Create GH workflow for PR verifications, like required licenses, migrate pull_request_target to workflow_run
  link: https://github.com/support-and-care/maven-support-and-care/issues/257#issuecomment-6346743155

- type: IMPROVEMENT
  text: Prepare configuration for ATR in Maven projects
  link: https://github.com/support-and-care/maven-support-and-care/issues/256#issuecomment-6586654726

- type: IMPROVEMENT
  text: Cleanup of Maven project configuration in ATR
  link: https://github.com/support-and-care/maven-support-and-care/issues/256#issuecomment-6586920109

- type: IMPROVEMENT
  text: Prepare atr-maven-plugin for automatically releases
  link: https://github.com/support-and-care/maven-support-and-care/issues/259#issuecomment-6586791739

- type: IMPROVEMENT
  text: Build the SBOM Reporting landing page
  link: https://github.com/support-and-care/sbom-reporting/pull/23

- type: IMPROVEMENT
  text: Connect SBOM Reporting to Dependency-Track for live project and artifact data
  link: https://github.com/support-and-care/sbom-reporting/pull/29

- type: IMPROVEMENT
  text: Add a concise SBOM explainer page
  link: https://github.com/support-and-care/sbom-reporting/pull/27

## Work Package 2 — Maintenance

- type: MAINTENANCE
  text: Release of Maven Surefire 3.6.1 (using Junit platform only) to fix related issues
  link: https://github.com/support-and-care/maven-support-and-care/issues/246#issuecomment-6551558117

- type: MAINTENANCE
  text: Fix Maven 4 related IT issues in Maven Surefire
  link: https://github.com/support-and-care/maven-support-and-care/issues/253

- type: MAINTENANCE
  text: Fix ITs for Maven 3.10.0 in Surefire 3.6.x and 3.5.x
  link: https://github.com/support-and-care/maven-support-and-care/issues/246#issuecomment-6551558117

- type: MAINTENANCE
  text: Optimize execution when phases of same lifecycle are called
  link: https://github.com/support-and-care/maven-support-and-care/issues/252

## Work Package 3 — Modernization of Core Feature

## Work Package 4 — Documentation
