---
# Do not change this
issue: 44
# This might change in the course of the work
title: Migrate to Maven Dependency Injection
# This might be one of TBD
status: Draft
---

**[Epic 44](https://github.com/support-and-care/maven-support-and-care/issues/44)**

The major task of this epic is to _migrate (Maven) away from Plexus_ (original [title](https://github.com/OpenElements/maven-support-care/issues/44)).
The [discussion](https://github.com/OpenElements/maven-support-care/discussions/28) which led to the epic even mentioned a migration to [Eclipse Sisu](https://projects.eclipse.org/projects/technology.sisu).

However, this seems to be some kind of incomplete or at least non-precise as there are many Plexus components used in Maven.
Hence, we first need to clarify the scope of the epic by evaluating the current state and lead some [stakeholder discussions](../conventions.md#stakeholder-discussions).

## Problem statement

### Background: Context and Dependency Injection

While running a Maven build, Maven executes many plugins.
In fact, Maven can be considered as a framework for plugin execution.
Plugins need some context, and - in many cases - options to communicate across so-called lifecycle phases.
The context contains information about the surrounding environment, in the case of Maven, the project which is subject to the Maven build.

To provide context, Java frameworks have established the so-called  [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) technique (Note: We will not elaborate on implementation considerations and a pro/con discussion here) (DI), thus following the [Dependency Inversion](https://en.wikipedia.org/wiki/Dependency_inversion_principle) principle.
Historically, Maven has used the [Plexus Container](https://codehaus-plexus.github.io/plexus-containers/) framework to implement DI.
Plexus Container now is in deprecated state and has moved to [Eclipse Sisu](https://eclipse.dev/sisu/).

## Further Findings

<dl><dt><strong>🔥 CAUTION: Unclear project/source status</strong></dt><dd>

As of 2025-01-04,
the contained Eclipse Sisu project seems outdated on its [Eclipse project page](https://projects.eclipse.org/projects/technology.sisu).
</dd></dl>

### Target: Use Maven Dependency Injection

For misc.&#160;reasons (TBD:
which reasons), Maven 4 developed its own [DI container](https://maven.apache.org/ref/4.0.0-alpha-13/api/maven-api-di/).
Now, all (core) components should switch to the new DI framework,
resulting in complete independence of Eclipse Sisu (and any other intermediate DI framework,
e.g., [Google Guice](https://github.com/google/guice)).

## Boundaries

[Plexus](https://codehaus-plexus.github.io/) is a large framework containing many components to make Java development easier, for instance, by

* Handling operating-system-specific issues.
* Adding convenient language features.
* Handling compilers.

Therefore, we will find many dependencies to some of the classic Plexus' components.
But we should be aware that only very little has a relationship to dependency injection.
Getting rid of more Plexus dependencies is subject to other activities and beyond our scope here.

## Todos

* [ ] Document [current state](#current-state-of-di-migration)
  * [ ] Check current documentation
  * [ ] Evaluate dependencies, e.g., with [jQAssistant](https://jqassistant.org)&#160;->&#160;This might also help for other Epics
* [ ] Document new DI framework ([Code](https://github.com/apache/maven/tree/master/api/maven-api-di) seems to have not even Javadocs)
* [ ] Propose a migration path
* [ ] Add automation where possible, e.g., via [OpenRewrite](https://docs.openrewrite.org/)

## Current state of DI migration

TBD

### Current documentation

* Check the [dev mailing list](https://lists.apache.org/list?dev@maven.apache.org:2021-2:Dependency%20Injection)
* Check Confluence, e.g.,
  * for [Dependency Injection](https://cwiki.apache.org/confluence/dosearchsite.action?queryString=dependency+injection&where=MAVEN&additional=page+excerpt&labels=&contentType=),
  * [Plexus](https://cwiki.apache.org/confluence/dosearchsite.action?cql=siteSearch+~+%22plexus%22+and+space+%3D+%22MAVEN%22&queryString=plexus), or
  * [Guice](https://cwiki.apache.org/confluence/dosearchsite.action?cql=siteSearch+~+%22guice%22+and+space+%3D+%22MAVEN%22&queryString=guice)
* Check [Jira](https://issues.apache.org/jira/), e.g.,
  * [MNG-7954](https://issues.apache.org/jira/browse/MNG-7954): Provide a cleaner DI api
  * Note that searching Jira is hard in this case, as many issues contain the terms `dependency` or `Plexus`

### Current DI dependencies

* Check the list of [internal/widely used plugins](https://maven.apache.org/plugins/)
* Search for other plugins, e.g.,
  * [Mojohaus](https://github.com/mojohaus)
  * [Fabric8](https://github.com/fabric8io)
  * Other ASF projects like [JMeter](https://github.com/jmeter-maven-plugin)
  * [Sonatype](https://github.com/sonatype)
  * GitHub in General (note: There are not so many that have the `<packaging>maven-plugin</packaging>`, according to some API search)

    ```shell
    curl -H "Accept: application/vnd.github.v3+json" \
         "https://api.github.com/search/repositories?q=<packaging>maven-plugin</packaging>&type=repositories" | tee gh-repos.json
    ```
