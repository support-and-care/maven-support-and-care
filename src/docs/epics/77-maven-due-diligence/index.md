---
# Do not change this
issue: 77
# This might change in the course of the work
title: Maven Due Dilligence
# This might be one of TBD
status: Draft
---

**[Epic 77](https://github.com/support-and-care/maven-support-and-care/issues/77)**

The major task of this epic is to _investigate the current state of the Maven build_ and to ensure that we can build all projects with the required JDK and Maven versions.
We want to use tools like [jQAssistant](https://jqassistant.org) to analyze the quality of Maven and perform further analysis like overall dependency checks.
A precondition for successful analysis is that we can build all projects with the respective JDK and Maven versions.

<dl><dt><strong><a name="box:maven-source"></a>❗ IMPORTANT: Maven Source and Reactor Build</strong></dt><dd>

* **Maven Source**\
Most of the content in this document refers to the so-called _Maven Source_ (cf. [SCM section](https://maven.apache.org/scm.html) of the Maven documentation).
Whenever we use this term, we refer to the collection of Maven components provided with the described SCM structure.
* **Reactor Build**\
Note that the Maven Source also contains a Maven [_reactor build_](https://github.com/apache/maven-sources/blob/master/aggregator/pom.xml)
which builds most of the Maven components in a single run (in the checked-out state of the source, you can find the reactor in `sources/aggregator`).
</dd></dl>

## Summary and resulting tasks

We would like to ensure that we can build all Maven projects with the required JDK and Maven versions

* As _reactor build_ (cf. [Building Maven](https://maven.apache.org/guides/development/guide-building-maven.html)), but also
* As _individual_ projects (e.g., to check for outdated dependencies).

### Current state

The Maven build is in a rather good state, taking into account that there are 133 subprojects developed and maintained since about 20 years by only a small number of committers.
The build is well-structured and uses a reactor build to build most projects in a single run.
However, there are some problems with the build, mainly due to outdated Java versions and dependencies.
The [detailed investigation](#detailed-build-investigation) (current state) shows the problems which prohibit a successful build of the Maven projects.

### Resulting tasks

#### Reactor build still open

Though applying [initial quick-wins](#initial-quick-wins), improved the _reactor build_ already,
we still experience build problems (also by ongoing development)&#160;->&#160;[Reactor Build problems](#reactor-build-problems).

#### Further tasks

The following tasks are just ideas and have no particular order!

##### Component design

* [ ] Check for some components whether the Maven committers should keep them in the current form, or whether some rework is necessary.
For example, the Doxia tools (`linkcheck`, `book-renderer`, `book-maven-plugin`) are based on Doxia 1.3, which is outdated.
In particular, it contains some [deprecated](https://maven.apache.org/doxia/references/index.html) formats (e.g., iText).

##### Branches

* [ ] Check the setup of the `maven-studies` repository (cf. [Maven Studies](#maven-studies)).
Either merge them into a single branch or drop them from the overall structure.
* [ ] Check the purpose of the open branches and in particular if they are still necessary.
Perhaps we can close some of them as they are already merged?
* [ ] Should there be a branch naming policy in the long run?

##### Documentation

* [ ] Almost all components have a `README.md` file which contains some generic text how to contribute to the project.
It would be nice to have a more detailed description of the component itself in the `README.md` file (or at least some link to further documentation).
* [ ] Make all sections in the Maven site referable (e.g., by using anchors).
* [ ] Test/ensure referential integrity of docs and code, i.e.,
  * Ensure all [SCM](https://github.com/apache/maven-site/blob/master/content/markdown/scm.md) projects correspond to the actual projects in the [Google repo configuration](https://github.com/apache/maven-sources/blob/master/default.xml) (aka. [box:maven-source](#box:maven-source)).
  * Ensure they correspond to the component graphics in the [SCM](https://maven.apache.org/scm.html) page.

##### Integration Tests

* [ ] Run integration tests (profile `run-its`) for all Maven projects and check out the result&#160;(->&#160;Stability of the build).

##### Reactor build

* [ ] Enable Maven `verify` for the [reactor build](https://github.com/apache/maven-sources).
* [ ] Enable reactor build for pull-requests of the subprojects&#160;->&#160;Trigger reactor build with particular branch of subproject repository (how to handle forks?).

## Detailed Build investigation

### Preconditions

<a name="box:sac-maven-tools"></a>**Support and Care Maven Tools**

If you are a member of the Support and Care team, or interested in our approach to the Maven build, you can use our [SAC Maven Tools](https://github.com/support-and-care/sac-maven-tools.git) to check out and work with the [box:maven-source](#box:maven-source) (Hint: Among others it asks you to perform the following step as well to get the Maven Source code, so the approach is not completely different).

* (Otherwise,{nbsp) Check out the [box:maven-source](#box:maven-source) from the ASF GitHub repositories by following the instructions in the [SCM section](https://maven.apache.org/scm.html) of the Maven documentation.
* Use JDK 21 (we found the following problems with Temurin 21.0.5 on Apple Silicon).
* Use Maven 3.9.9 and 4.0.0-RC-2 (not yet 3.6.3).

### Build Maven projects and reactor

* **Either (Users of [Support and Care Maven Tools](#box:sac-maven-tools))**\
Run the `run-maven` script from the `bin` directory of the Maven Source, e.g.,
  * `bin/run-maven clean verify` (Build all projects separately, except for the reactor)
  * `PROJECTS=core/maven,core/maven-3 bin/run-maven clean verify` (Build only Maven 3 + 4 core)
  * `PROJECTS=shared/shared-io bin/run-maven clean verify` (Build `maven-shared-io` only)
  * `PROJECTS=sources/aggregator bin/run-maven -P run-its clean install` (Build and install reactor and run integration tests)
* **Or**\
Build the Maven projects with `mvn` (few contain a Maven wrapper), e.g.,
  * `cd ...; mvn clean verify` (Build the respective project)
  * If you want to build separate projects, you have to change to the respective directories.
  * `cd sources/aggregator mvn -P run-its clean install` (Build reactor and run integration tests)

### General questions

#### Maven Studies

The [box:maven-source](#box:maven-source) contains some case studies or proof-of-concepts (i.e., `maven-studies`).
They live on different branches of the same repository, which makes it hard to work with them, in particular with the `repo` tool of [box:maven-source](#box:maven-source).

* Should we merge them into a single branch?
* Or completely drop them from the overall structure (at least from the reactor build)?

**🔥 CAUTION**\
A similar problem might occur with the `core/maven` and `core/maven-3` repositories as they follow the same pattern which makes working with [box:maven-source](#box:maven-source) difficult.

#### Maven 4 (.0.0-RC-2) branches

Some projects have `mvn4` branches (some even `maven4`) which seem rather old (though Maven 4 is not yet GA released).
Could we drop them as this is somehow irritating to new users of the Maven Source?

### Build problems

#### Reactor Build problems

A reactor build currently still reveals the following problems.

* **core/mvnd**\
Failed to create context for skin: Cannot use skin: has [1.11.1,2.0.0-M1) Doxia Sitetools prerequisite)
* **plexus/classworlds**\
Failed to obtain site model: Error parsing site descriptor: Unrecognised tag: 'name' (position: START_TAG seen ...&lt;bannerLeft>\n    &lt;name>... @24:11))

#### Other build problems (not part of reactor)

##### Plexus Swizzle

[Plexus Swizzle](https://github.com/codehaus-plexus/plexus-swizzle.git):

* `The following artifacts could not be resolved: org.codehaus.plexus:plexus-components:pom:4.0-SNAPSHOT (absent): org.codehaus.plexus:plexus-components:pom:4.0-SNAPSHOT`

### Archived Components

Should the Maven committers drop them from Maven Source?

* https://github.com/apache/maven-sandbox
* https://github.com/apache/maven-repository-tools
* https://github.com/apache/maven-doxia-ide
* https://github.com/codehaus-plexus/plexus-components
* https://github.com/codehaus-plexus/plexus-containers
* https://github.com/codehaus-plexus/plexus-swizzle
  * uses `org.codehaus.plexus:plexus-components` in version 4.0.0-SNAPSHOT as parent which does not resolve.
  The parent is a SNAPSHOT, but the repository (version) needs to be identified.
  Version [4.0](https://github.com/codehaus-plexus/plexus-components/releases/tag/plexus-components-4.0) is close, but the owner has archived the source code by Dec. 2023, and it contains many later versions.
* https://github.com/codehaus-plexus/plexus-digest
* https://github.com/codehaus-plexus/plexus-cli
* https://github.com/codehaus-plexus/plexus-cipher

## Resolved issues

Since starting this epic, we could resolve the following issues.

### Initial Quick wins

<dl><dt><strong>❗ IMPORTANT</strong></dt><dd>

To visualize the problems and the results of below discussed quick wins, we added a build to the Maven projects.
Both currently make use of JDK 21 and Maven 3.9.9, as well as Maven 4.0.0-RC-2.
We can show the initial results of the builds (without changes), and the results for both Maven versions.

It is clear that this does not yet cover all remaining (and to be detected) open problems of the Maven build.
For instance, it does not yet cover full integration tests or documentation checks.
Nevertheless, it is a starting point that allows for step-by-step improvements.
In particular, it allows to build the projects (and execute at least their unit tests) with the required JDK and currently two out of three supported Maven versions.

* For each of the single repositories below (running `mvn verify`), the builds (on the respective PRs) are successful.
See the build links in the discussion below.
* For the reactor build (running `mvn install site`. (Note: We know, `install` is not necessary here, `verify should do the job for a full reactor build. We already prepare for further build steps based on the fresh installation.)), it is a bit more complicated.
  * For Maven 3.9.9, the build is successful, but with some errors (resulting from site building).
  * For Maven 4.0.0-RC-2, the build still has some problems, and it will take us some time to resolve them&#160;(->&#160;Work-in-Progress).
</dd></dl>

We derived the following tasks from the current state above.
They make sure that we can at least execute the Maven build with the required JDK and Maven versions without running into basic build problems.

* **Triage**\
Check with the Maven committers if we could thin out the _reactor build_ and the overall [box:maven-source](#box:maven-source).
  * [ ] Archive unnecessary components. (Note: Actual archiving is up to the Maven committers and out of scope for the Maven Support & Care team)
  * [x] Drop them from the Maven Source (or at least from the reactor build; [Merged PR for both M3 and M4](https://github.com/apache/maven-sources/pull/13)).
  The reactor build would become easier if the following components were dropped from the reactor build
    * The so-called _Maven Studies_ (as they are causing trouble, cf. our forks) are moved to a Maven profile (`studies`),
      * [Consumer POM](https://github.com/apache/maven-studies/tree/consumer-pom) (SaC: [fork](https://github.com/support-and-care/maven-studies/tree/consumer-pom), [bugfix](https://github.com/support-and-care/maven-studies/tree/bugfix/77-make-project-build-again-consumer-pom), [Successful GH Action with M3](https://github.com/support-and-care/maven-studies/actions/runs/12733456692)),
      * [Extension Demo Study](https://github.com/apache/maven-studies/tree/maven-extension-demo) (SaC: [fork](https://github.com/support-and-care/maven-studies/tree/maven-extension-demo), [bugfix](https://github.com/support-and-care/maven-studies/tree/bugfix/77-add-maven-verify-maven-extension-demo), [Successful GH Action with M3](https://github.com/support-and-care/maven-studies/actions/runs/12734023531)),
      * [Eventsound Extension Demo](https://github.com/apache/maven-studies/tree/maven-eventsound-extension) (SaC: [fork](https://github.com/support-and-care/maven-studies/tree/maven-eventsound-extension), [bugfix](https://github.com/support-and-care/maven-studies/tree/bugfix/77-make-project-build-again-maven-extension-demo), [Successful GH Action with M3](https://github.com/support-and-care/maven-studies/actions/runs/12734023531)),
    * The [Maven Project Utils](https://github.com/apache/maven-project-utils) as they are soon to be archived,
    * The [Maven Artifact Transfer](https://github.com/apache/maven-artifact-transfer) as it is deprecated and should be archived soon, and
    * The [Maven Repository Tools](https://github.com/apache/maven-repository-tools) (aka.
    Maven _Meeper_) from the reactor build ([Draft PR for M3](https://github.com/apache/maven-sources/pull/13) will be withdrawn) as
      * It is archived (so no further development is expected),
      * It has many non-straightforward problems (see below).

<dl><dt><strong>❗ IMPORTANT</strong></dt><dd>

For the next steps below, we assume that the components mentioned above
will not survive the [triage](#desc-item:triage) and concentrate on the remaining components.
</dd></dl>

* **Maven 3 (.9.9) Updates**\
To enable a successful build with Maven 3 (.9.9) the following changes are necessary.
  * [x] [Maven Verifier Plugin](https://github.com/apache/maven-verifier-plugin)
    * Update the Java version to at least Java 8, and
    * Drop duplicate license from [`VerifierMojo.java`](https://github.com/apache/maven-verifier-plugin/blob/1330656e1945dfe7ef1a1f3e8034b64138887f10/src/main/java/org/apache/maven/plugins/verifier/VerifierMojo.java#L29) as it leads to a checkstyle error due to splitting the import statements.
  * [x] [Maven Stage Plugin](https://github.com/apache/maven-stage-plugin): Update the Java version to at least Java 8
  * [x] [Maven Mapping](https://github.com/apache/maven-mapping): Update the Java version to at least Java 8
* **Maven 4 (.0.0-RC-2) updates**\
To enable a successful build with Maven 4 (.0.0-RC-2) the following changes are necessary.
  * [x] [Maven Shared IO](https://github.com/apache/maven-shared-io) ([PR for M3](https://github.com/apache/maven-shared-io/pull/27), also works with M4; [Successful GH Action](https://github.com/support-and-care/maven-shared-io/actions/runs/12734042142)):
    * Fix parent,
    * and add Plexus-XML dependency (in test scope).
  * [x] Maven Verifier Plugin ([Merged PR](https://github.com/apache/maven-verifier-plugin/pull/6), [Successful GH Action](https://github.com/support-and-care/maven-verifier-plugin/actions/runs/12738839164)):
    * Upgrade to Parent version 43.
    * Apply Spotless to the codebase.
  * [x] Maven Stage Plugin ([Merged PR](https://github.com/apache/maven-stage-plugin/pull/15), [Successful GH Action](https://github.com/support-and-care/maven-stage-plugin/actions/runs/12738868925)):
    * Drop `parent.relativePath`.
    * Refactor `DefaultRepositoryCopier::copy` to use less than 150 lines of code.
    * Upgrade to Parent version 43.
    * Apply Spotless to the codebase.
  * [x] Maven Mapping ([Merged PR](https://github.com/apache/maven-mapping/pull/8), [Successful GH Action](https://github.com/support-and-care/maven-mapping/actions/runs/12734150620)):
    * Drop `parent.relativePath`.
    * Upgrade to Parent version 43.
    * Apply Spotless to the codebase.

In particular, the following problems were resolved

#### Maven Wagon

[Maven Wagon](https://github.com/apache/maven-wagon) has Flaky (unit) tests (at least in the reactor builds).
+
We perform no action by now, perhaps test retries in the future?

#### Maven Verifier Plugin

[Maven Verifier Plugin](https://github.com/apache/maven-verifier-plugin)

* **Maven 3 (.9.9)**\
Wrong Java Version
  * Compile error(s): `Source option 7 is no longer supported. Use 8 or later.`

    -> Change property `javaVersion` to `8` to resolve the problem.
  * Reveals a checkstyle error due to duplicate license in `src/main/java/org/apache/maven/plugins/verifier/VerifierMojo.java`:

+
+
-> Dropping the license led to successful builds.

* **Maven 4 (.0.0-RC-2)**
  * Enforcer Error:

    ```text
    [ERROR] Failed to execute goal org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce (enforce-maven-version) on project maven-verifier-plugin: Execution enforce-maven-version of goal org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce failed: An API incompatibility was encountered while executing org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce: java.lang.NoSuchMethodError: 'void org.apache.maven.plugin.PluginParameterExpressionEvaluator.<init>(org.apache.maven.execution.MavenSession, org.apache.maven.plugin.MojoExecution, org.apache.maven.project.path.PathTranslator, org.codehaus.plexus.logging.Logger, org.apache.maven.project.MavenProject, java.util.Properties)'
    ```

    -> Update to Parent 43
  * Spotless Errors:

    ```text
    [ERROR] Failed to execute goal com.diffplug.spotless:spotless-maven-plugin:2.43.0:check (default) on project maven-verifier-plugin: The following files had format violations:
    ...
    ```

    -> Apply Spotless to the codebase.

#### Maven Stage Plugin

[Maven Stage Plugin](https://github.com/apache/maven-stage-plugin)

* **Maven 3 (.9.9)**\
Wrong Java Version
  * Enforcer error: `Restricted to JDK 1.7 yet commons-io:commons-io:jar:2.14.0:compile contains org/apache/commons/io/ByteOrderMark.class targeted to JDK 8
  Found Banned Dependency: commons-io:commons-io:jar:2.14.0`

    -> Add property `javaVersion` with value `8` to resolve the problem.
* **Maven 4 (.0.0-RC-2)**
  * Validation error: ’parent.relativePath' of POM org.apache.maven.plugins:maven-stage-plugin:1.1-SNAPSHOT (/Users/ascheman/wrk/maven/maven/plugins/tools/maven-stage-plugin/pom.xml) points at '../../pom/maven/maven-plugins/pom.xml' but no POM could be found`

    -> Drop.
  * Enforcer Error: `[ERROR] Failed to execute goal org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce (enforce-maven-version) on project maven-stage-plugin: Execution enforce-maven-version of goal org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce failed: An API incompatibility was encountered while executing org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce: java.lang.NoSuchMethodError: 'void org.apache.maven.plugin.PluginParameterExpressionEvaluator.<init>(org.apache.maven.execution.MavenSession, org.apache.maven.plugin.MojoExecution, org.apache.maven.project.path.PathTranslator, org.codehaus.plexus.logging.Logger, org.apache.maven.project.MavenProject, java.util.Properties)'`

    -> Update to Parent 43.
  * Checkstyle error: `[ERROR] src/main/java/org/apache/maven/plugins/stage/DefaultRepositoryCopier.java:[83,5] (sizes) MethodLength: Method copy length is 192 lines (max allowed is 150).``

    -> Refactor `DefaultRepositoryCopier::copy` to use less than 150 lines of code.
  * Spotless error (cf. build this commit):

    ```text
    [ERROR] Failed to execute goal com.diffplug.spotless:spotless-maven-plugin:2.43.0:check (default) on project maven-stage-plugin: The following files had format violations:
    ...
    ```

    -> Apply Spotless to the codebase.

#### Maven Artifact Transfer (Deprecated)

[Maven Artifact Transfer](https://github.com/apache/maven-artifact-transfer): Wrong Java Version

* Component is _deprecated_ (on its `master` branch)

  -> Dropping it from the reactor build.
* Compile error(s): `Source option 7 is no longer supported. Use 8 or later.` ...

  -> Change property `javaVersion` to `8` to resolve the problem.

#### Maven Mapping

[Maven Mapping](https://github.com/apache/maven-mapping)

* **Maven 3 (.9.9)**\
Wrong Java Version
  * Compile error(s): `Source option 7 is no longer supported. Use 8 or later.` ...

    -> Change property `javaVersion` to `8` to resolve the problem.
* **Maven 4 (.0.0-RC-2)**
  * Validation error: ’parent.relativePath' of POM org.apache.maven.shared:maven-mapping:3.0.1-SNAPSHOT (/Users/ascheman/wrk/maven/maven/shared/mapping/pom.xml) points at '../../pom/maven/maven-shared-components/pom.xml' but no POM could be found, please verify your project structure @ line 23, column 3`

    -> Drop.
  * Enforcer error: `[ERROR] Failed to execute goal org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce (enforce-maven-version) on project maven-mapping: Execution enforce-maven-version of goal org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce failed: An API incompatibility was encountered while executing org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce: java.lang.NoSuchMethodError: 'void org.apache.maven.plugin.PluginParameterExpressionEvaluator.&lt;init>(org.apache.maven.execution.MavenSession, org.apache.maven.plugin.MojoExecution, org.apache.maven.project.path.PathTranslator, org.codehaus.plexus.logging.Logger, org.apache.maven.project.MavenProject, java.util.Properties)'
  ...`

    -> Update to Parent 43
  * Spotless error: `[ERROR] Failed to execute goal com.diffplug.spotless:spotless-maven-plugin:2.43.0:check (default) on project maven-mapping: The following files had format violations:
  ...`

    -> Apply Spotless to the codebase.

#### Maven Project Utils (Deprecated)

[Maven Project Utils](https://github.com/apache/maven-project-utils)

* **Maven 3 (.9.9)**\
Wrong Java Version
  * Compile error(s): `Source option 7 is no longer supported. Use 8 or later.` ...

    -> Change property `javaVersion` to `8` to resolve the problem.
* **Maven 4 (.0.0-RC-2)**
  * Enforcer error: `[ERROR] Failed to execute goal org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce (enforce-maven-version) on project maven-project-utils: Execution enforce-maven-version of goal org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce failed: An API incompatibility was encountered while executing org.apache.maven.plugins:maven-enforcer-plugin:1.4.1:enforce: java.lang.NoSuchMethodError: 'void org.apache.maven.plugin.PluginParameterExpressionEvaluator.<init>(org.apache.maven.execution.MavenSession, org.apache.maven.plugin.MojoExecution, org.apache.maven.project.path.PathTranslator, org.codehaus.plexus.logging.Logger, org.apache.maven.project.MavenProject, java.util.Properties)'` -> Update to Parent 43
  * Spotless error: `[ERROR] Failed to execute goal com.diffplug.spotless:spotless-maven-plugin:2.43.0:check (default) on project maven-project-utils: The following files had format violations:
  ...`

#### Maven Studies

[Maven Studies](https://github.com/apache/maven-studies):

* **Maven 3 (.9.9)**\
Wrong Java Version(s)
  * [Consumer POM](https://github.com/apache/maven-studies/tree/consumer-pom):
    * Compile error(s): `Source option 7 is no longer supported. Use 8 or later.` ...
    * Adding properties `maven.compiler.source` and `maven.compiler.target` with value `8` resolved the problem.
  * [Eventsound Extension](https://github.com/apache/maven-studies/tree/maven-eventsound-extension): Checkstyle violations
    * `There are two errors reported by Checkstyle 6.18 with config/maven_checks.xml ruleset.
    [ERROR] src/main/java/org/apache/maven/extensions/eventsound/SoundPlayingListener.java:[46] (javadoc) JavadocType: Missing a Javadoc comment.
    [ERROR] src/main/java/org/apache/maven/extensions/eventsound/SoundPlayingListener.java:[68,72] (whitespace) ParenPad: ')' is not preceded with whitespace.`
    * Adding a Javadoc comment to `SoundPlayingListener.java` and fixing the whitespace issue resolved the problem.
  * [Extension Demo Study](https://github.com/apache/maven-studies/tree/maven-extension-demo): Wrong Java Version
    * Compile error(s): `Source option 7 is no longer supported. Use 8 or later.` ...

      -> Add property `javaVersion` to `8` to resolve the problem.
* **Maven 4 (.0.0-RC-2)**\
Not investigated (we should drop them, at least from the reactor build).

#### Maven Repository Tools

[Maven Repository Tools](https://github.com/apache/maven-repository-tools): Dependency problem + Wrong Java version

**⚠️ WARNING**\
The project is in _archived_ state (see [Archived Components](#archived-components))!
Why is it still part of the reactor build?

* Build error: `[ERROR] Failed to execute goal on project maven-meeper: Could not collect dependencies for project org.apache.maven:maven-meeper:jar:1.0-SNAPSHOT
[ERROR] Failed to read artifact descriptor for org.apache.commons:commons-csv:jar:1.0-SNAPSHOT`
* Changing the version of `commons-csv` to `1.0` lead to the next problem: `[ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:2.0.2:compile (default-compile) on project maven-meeper: Compilation failure: Compilation failure:
[ERROR]: Source option 1.4 is no longer supported.
Use 8 or later.
[ERROR] error: Target option 1.4 is no longer supported.
Use 8 or later.`

  -> Adding property `javaVersion` to `8` did _not_ resolve the problem.
  * Changing to a newer (current) parent POM (`43`) revealed new problems:
  ...

**🔥 CAUTION**\
This project has so many problems and seems completely unused&#160;->&#160;We suggest dropping it from the reactor build.

#### Maven Shared IO

[Maven Shared IO](https://github.com/apache/maven-shared-io): Misc.&#160;errors

* The reactor build leads to `[ERROR] Failed to execute goal com.diffplug.spotless:spotless-maven-plugin:2.28.0:check (default) on project maven-shared-io: Execution default of goal com.diffplug.spotless:spotless-maven-plugin:2.28.0:check failed: An API incompatibility was encountered while executing com.diffplug.spotless:spotless-maven-plugin:2.28.0:check: java.lang.NoSuchMethodError: 'com.sun.tools.javac.tree.JCTree com.sun.tools.javac.tree.JCTree$JCImport.getQualifiedIdentifier()'`

  -> Upgrade to the current parent project (`43`)
* Leads to: Test errors

  `[ERROR] Errors:
  [ERROR]   DefaultDownloadManagerTest.testShouldLookupInstanceDefaultRoleHint:77->PlexusTestCase.lookup:201->PlexusTestCase.getContainer:141->PlexusTestCase.setupContainer:98 » NoClassDefFound org/codehaus/plexus/util/xml/pull/XmlPullParserException`

  -> Add the dependency `org.codehaus.plexus:plexus-xml` (with `test` scope) to resolve the problem.
