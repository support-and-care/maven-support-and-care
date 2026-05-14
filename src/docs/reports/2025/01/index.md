# January 2025

## Work Package 1 — Security of the Supply Chain

* We explore how the project [ORT - Server](https://github.com/eclipse-apoapsis/ort-server) can help us to improve the security in Apache Maven supply chain.

## Work Package 2 — Maintenance

* We continued our work on the [due-diligence](../../../epics/77-maven-due-diligence/index.md) we started in [December 2024](../../2024/12/index.md).
Several pull requests to re-enable Maven builds of components that are part of the reactor build were created, approved and merged by the Maven committers.
This was a first step to establish trust into our quality improvements.
* We got some feedback for the Jira issues to GitHub migration tool and extended it based on that feedback.

## Work Package 3 — Modernisation of Core Feature

* Additionally, we could start on the first original work package epic, the [migration of Plexus containers to Maven DI](../../../epics/44-migrate-to-maven-di/index.md) (dependency injection).
For historic reasons, Maven was dependent on several versions of external dependency injection frameworks.
These frameworks either lack active maintenance, or other organizations control the development of these frameworks.
Both circumstances result in a risk to further development.
Hence, the Maven team has a strong demand to eliminate at least the oldest and most remote dependencies, aiming towards a unique solution for dependency injection.

## Work Package 4 — Documentation

* We started to improve the documentation for Maven DI, especially we created a [sample](https://github.com/apache/maven/pull/2055) how a pure Maven 4 plugin should look like.
Also, we clean up elder mentions to Plexus DI.
