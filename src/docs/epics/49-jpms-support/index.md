---
# Do not change this
issue: 49
# This might change in the course of the work
title: Java Module path support
# This might be one of TBD
status: Draft
---

**[Epic 49](https://github.com/support-and-care/maven-support-and-care/issues/49)**

The major task of this epic is to extend Maven (4) towards support for the [Java Platform Module System](https://openjdk.org/projects/jigsaw/spec/) (JPMS), based on two discussions

* **[11](https://github.com/support-and-care/maven-support-and-care/discussions/11) (Better Java Module System support for Maven 4)**\
Requires (better) general support for JPMS in Maven 4, e.g., for Module generation, packaging, linking, testing, etc.
* **[35](https://github.com/support-and-care/maven-support-and-care/discussions/35) (Maven supports compilation and execution on the classpath or module path)**\
More specifically requires JPMS support wrt. Compilation and Execution.

<dl><dt><strong>📌 NOTE: Focus on Maven 4</strong></dt><dd>

Though this epic should mostly address Maven 4 support, the Maven Support & Care team has decided to at least try to fix major JPMS problems in Maven 3.
Additionally, it should not only cover Maven Core and its plugins, but also relevant third party plugins and extensions, e.g., [MojoHaus](https://www.mojohaus.org/) plugins.
</dd></dl>

## Relevant components

The following components (currently) relate to JPMS. (Note: Incomplete list, for sure.)

<dl><dt><strong>📌 NOTE: ASF Maven Confluence Page on JPMS support</strong></dt><dd>

We maintain a current list of Maven components and their support status wrt.
JPMS in the  ASF Confluence: [Full JPMS Support — Current State](https://cwiki.apache.org/confluence/x/rwp3Fw)
</dd></dl>

* **Maven**
  * **[`maven-compiler-plugin`](https://maven.apache.org/plugins/maven-compiler-plugin/)**\
  Compiles Java source code with support for module-path and module descriptors.

    <dl><dt><strong>📌 NOTE</strong></dt><dd>

    [Geomatys' fork](https://github.com/Geomatys/maven-compiler-plugin) contains POCs and PRs for Maven 4 (see its [Wiki](https://github.com/Geomatys/maven-compiler-plugin/wiki/)).
    </dd></dl>
  * **[`maven-jmod-plugin`](https://maven.apache.org/plugins/maven-jmod-plugin/)**\
  Creates JMOD files for packaging native code and other resources alongside Java modules.
  * **[`maven-jlink-plugin`](https://maven.apache.org/plugins/maven-jlink-plugin/)**\
  Creates custom runtime images using the jlink tool for modular applications.
* **MojoHaus**
  * **[`exec-maven-plugin`](https://www.mojohaus.org/exec-maven-plugin/)**\
  Executes Java programs and applications with support for both classpath and module-path execution.

## Related (Maven Developer) Discussions

### Users Mailing List Discussions

As of 2025-10-08, there were no discussions so far about [JPMS on the Users List](https://lists.apache.org/list?users@maven.apache.org:lte=1M:jpms).

### Dev Mailing List Discussions

TBD: filter out from [Dev List JPMS Search](https://lists.apache.org/list?dev@maven.apache.org:lte=1M:jpms)

### Slack Discussions

TBD

## Known issues

In the course of working on this epic, we detected or further investigated (and partly resolved) the following issues.

### Unresolved Issues

TBD

### Resolved Issues

* MojoHaus Exec Plugin:
  * Issue [426](https://github.com/mojohaus/exec-maven-plugin/issues/426) addresses a JPMS [sample application](https://github.com/siddhsql/maven-exec-jpms-bug) which does not work (the exec plugin cannot load a service provider).
  _We resolved_ this by PR [500](https://github.com/mojohaus/exec-maven-plugin/pull/500),
  introducing a Multi-Release JAR to add proper module loading (for JDKs >= 9).

## Potential Use-/Showcases

* [Issue 67 of m-JMOD-p](https://github.com/apache/maven-jmod-plugin/issues/67) (targeting [Yet Another JNI-D2XX Interface Project](https://sourceforge.net/projects/yad2xx/), USB-Drivers)
* Complex (integration) testing
  * Issue [372](https://github.com/mojohaus/flatten-maven-plugin/issues/372) for the MojoHaus [Maven Flatten Plugin](https://github.com/mojohaus/flatten-maven-plugin) proposes an extension to provide a starting point for a respective (flattened) test POM to run JPMS based integration tests.
  Note that the Flatten Plugin is more relevant to Maven 3, but this is nevertheless an interesting use case for JPMS.

## JPMS Samples and other information

* Apache Confluence [Search of JPMS in Maven space](https://cwiki.apache.org/confluence/dosearchsite.action?queryString=jpms&where=MAVEN&additional=page+excerpt&labels=&contentType=)
* [Example](https://github.com/ojitha/JPMSExample) of [Understand JPMS](https://ojitha.github.io/java/2021/03/27/Understand-JPMS.html)
* [Guide to Java Modularity (Baeldung)](https://www.baeldung.com/java-modularity)

## Specifications

* [Project Jigsaw: Module System Specification](https://openjdk.org/projects/jigsaw/spec/)
* [JEP 261: Module System](https://openjdk.org/jeps/261)

## Glossary

<dl><dt><strong>🔥 CAUTION</strong></dt><dd>

The terminology presented here is a first proposal for clarification purposes within this Epic.
Whether these terms will be adopted long-term and receive broader support from the Maven community remains to be seen.
</dd></dl>

* **Aggregator Project**\
A Maven project whose sole purpose is to group and build multiple modules or subprojects.
* **JPMS Module**\
A module defined by the Java Platform Module System introduced in Java 9.
It specifies encapsulation and dependencies for Java code at runtime and compile time.
* **Maven Module**\
A term used prior to Maven 4 to denote subprojects in a multi-module build.
Each module is a separate Maven project with its own POM, built under a parent aggregator.
* **(Maven) Multi-Release**\
A JAR format supporting multiple versions of class files targeting different Java runtime versions.
Allows a single artifact to provide specialized code for multiple JVM versions.
* **Multi-JPMS-Module-Project**\
A project (or subproject) providing multiple JPMS modules, in contrast to classic Maven (3) Multi-Module setups.
* **Multi-Module Setup**\
A _classic_ Maven project structure (prior to Maven 4) that contains multiple Maven modules built together.
It uses an aggregator POM to aggregate and manage the build of all contained components.
In Maven 4, this term should be avoided to prevent confusion with Java modules organized in a [module source hierarchy](https://docs.oracle.com/en/java/javase/25/docs/specs/man/javac.html#directory-hierarchies).
Preferred terms are "multi-project setup" (for Maven subprojects) or "Multi-JPMS-Module-Project" (for projects providing multiple JPMS modules).
* **Multi-Project Setup**\
A Maven build unit containing one or more subprojects, typically managed under a parent aggregator project.
* **Project**\
A Maven build unit defined by a POM file, representing either a single project or a parent of (Maven) modules or subprojects.
* **Single-Project Setup**\
A Maven build containing only one project without any subprojects nor modules.
* **Subproject**\
The preferred Maven 4 term, replacing _module_ to denote a nested Maven project within a multi-project setup.
Each subproject has its own POM and is referenced in the parent’s `<subprojects>` element.
