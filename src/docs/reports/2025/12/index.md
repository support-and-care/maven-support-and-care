# December 2025

## Work Package 1 — Security of the Supply Chain

## Work Package 2 — Maintenance

* Release of the Maven 3.9.12

## Work Package 3 — Modernization of Core Feature

* Refactoring of surefire plugin to use only the Junit Platform to run test for junit3,4,5,6 and testng.
* Make progress in migration of JUnit3 based tests that using `AbstractMojoTestCase` to JUnit 5 - https://github.com/support-and-care/maven-support-and-care/issues/136
* Java Modules (aka JPMS):
  * Merged outstanding [PR #11505](https://github.com/apache/maven/pull/11505) to Apache Maven Core (cf. [November 2025 report](../11/index.md)):
  * Continued collaboration with Martin Desruisseaux (Geomatys) on JPMS support:
    * Contributed [refactoring PR](https://github.com/Geomatys/maven-compiler-plugin/pull/1) for the maven-compiler-plugin (merged Dec 21).
    * Supporting [maven-jar-plugin PR #508](https://github.com/apache/maven-jar-plugin/pull/508) (migration from Maven Archiver to standard `jar` tool).
  * Started a new [Maven Modular Sources Showcases](https://github.com/support-and-care/maven-modular-sources-showcases-private) repository:
    * Blog series in preparation demonstrating Maven 4 + JPMS usage.
    * Practical examples with Maven 4.0.0-rc-5 and modular source hierarchy.

## Work Package 4 — Documentation

* Kickoff meeting about documentation improvements for the Maven core internals, plugins and extensions
* Finalize the first version of Maven Initializer. Live Go during January 2026
