<!--
Original Author: Benjamin
Category: Documentation
-->

# Leverage the Maven Build Cache Extension

**Discussion:** https://github.com/support-and-care/maven-support-and-care/discussions/149

## Problem Statement

The Apache Maven Build Cache Extension is one of the most underrated extensions provided by the Apache Maven core team. It offers significant performance improvements — reducing builds "from minutes to mere seconds" — yet remains underutilized. People attending talks (e.g., [snail-pace-rocket-speed](https://github.com/mthmulders/snail-pace-rocket-speed-talk)) are often astonished how much time they might save. However, adoption is low because the documentation lacks practical guidance, and enterprises may be afraid that things break without support.

Related: Discussion [#17](https://github.com/support-and-care/maven-support-and-care/discussions/17#discussioncomment-9405498) ties this to the common assumption that Maven is slow.

## Current State / Starting Point

The existing documentation pages have significant gaps:

- **[Performance](https://maven.apache.org/extensions/maven-build-cache-extension/performance.html)**: Does not explain how and when to apply the extension
- **[Usage](https://maven.apache.org/extensions/maven-build-cache-extension/usage.html)**: Does not give enough details
- **[How-To](https://maven.apache.org/extensions/maven-build-cache-extension/how-to.html)**: Page title says "Overview" (misleading); only gives code solutions without explaining concepts. Phrasing is hard to understand. It is essentially a Q&A, with confusing headings like "I occasionally cached build with -DskipTests=true, and tests do not run now" — without explaining when, how, and why that is a problem. Reconciliation parameters are not explained (why not the default? when not to use them?)
- **[Parameters](https://maven.apache.org/extensions/maven-build-cache-extension/parameters.html)**: Just a list without explanation. Missing: which parameters to use in CI, different parameters for branches, what "Location of baseline build for comparison" actually points to, when/why to use "Restore artifacts from remote cache lazily"

## Expected Outcomes / Benefits

1. **Practical Documentation**: Clear getting-started guide, CI integration examples, and enterprise configuration patterns
2. **Adoption Increase**: More Maven users leveraging the cache extension for faster builds
3. **Best Practices**: Documented patterns for shared caches, SNAPSHOT handling, and remote cache scenarios
4. **Compatibility Guide**: Clear guidance on Maven 3 vs. 4 support and migration path

## Open Questions

The following questions from the community need to be addressed in the documentation:

- How to correctly set up CI with the build cache?
- How to set up an enterprise-ready shared cache for both CI and users? Should there be two caches? Could it fail some builds?
- Can user benefit be monitored? How?
- Should the extension go into `~/.m2/extensions.xml` starting with Maven 4?
- Will builds break between Maven 3 and Maven 4?
- What happens with `mvn4 install` if the project requires installing artifacts locally first (e.g., CXF, TomEE run tests on locally installed artifacts)?
- Can it be combined with caching of `~/.m2/repository` and/or mimir for even better performance?
- How to handle SNAPSHOT dependencies? From Maven's perspective SNAPSHOTs are not advised, but practical guidance and clarification are needed
- How to use a shared remote cache as "cache repo" to pre-fetch existing caches for given hashes, avoiding a full cacheless first build? This could save hours per build/pipeline per feature branch in large projects

## Discussion Summary

Community feedback confirmed the importance of this proposal.
Most developers and enterprises are [unaware of the extension or afraid to use it](https://github.com/support-and-care/maven-support-and-care/discussions/149#discussioncomment-11308627), reinforcing the need for better documentation.
Specific requests include documentation for SNAPSHOT caching behavior and guidance on [shared remote cache usage to avoid full cacheless first builds on CI](https://github.com/support-and-care/maven-support-and-care/discussions/149#discussioncomment-15609741).
