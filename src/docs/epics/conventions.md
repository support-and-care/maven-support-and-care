# Epic documentation

<dl><dt><strong>📌 NOTE: Give it a try!</strong></dt><dd>

This is currently just a first try to structure our work and the respective documentation.
It may vanish (or migrate) in the future when we find better/other ways to structure our work.

Sample: [Epic 44](44-migrate-to-maven-di/index.md).
</dd></dl>

## Why do we have these files/directories?

All of our work on [Support & Care](https://open-elements.com/support-care-maven/) for [Apache Maven](https://maven.apache.org/) usually starts with an [Epic issue in GitHub](https://github.com/OpenElements/maven-support-care/issues?q=is%3Aissue+is%3Aopen+label%3Aepic) (or even a [discussion](https://github.com/OpenElements/maven-support-care/discussions)).
So we try to establish the major requirements up front.

When taking further steps to prepare and implement a solution, we might need

* More clarifications,
* Boundaries wrt.&#160;other epics,
* Feasibility considerations,
* Exploration of different solutions&#160;(e.g., by Proof-of-concepts),
* Conceptual preparations,
* Finer grained work items (user stories),
* Decision-making (and documentation of results),
* ...

Some work will result from [Stakeholder Discussions](#stakeholder-discussions).
But some preparations might culminate in intermediate evaluations and reports, work item lists, etc.
We can write down these intermediate steps and eventually compile a final approach to tackle the issue.

## Stakeholder Discussions

We will need to work out and discuss some epics with other stakeholders.
Our major stakeholders are the _Apache Maven Community_, and in particular, the Maven committers (contributors).

Consequently, we have to get in touch with them through the respective media, i.e.,

* ASF Slack [Maven](https://the-asf.slack.com/archives/C7Q9JB404) channel,
* Mailing lists, in particular the [Maven Developers List](mailto:dev@maven.apache.org) ([Subscribe](mailto:dev-subscribe@maven.apache.org), [archive](https://lists.apache.org/list?dev@maven.apache.org)),
* [Jira](https://issues.apache.org/jira/) or (in the future) GitHub issues of the respective Maven projects,
* Personal communication,
* ...

Additionally, the Maven-Support-and-Care team will have their discussions, meetings, etc.

## Naming and Structure

The idea would be to just create a subdirectory for each epic, including at least one file, the _index_ (hence, usually a file named `index.md`).

### Directory name

The directory name should be starting with the epic number (e.g., [44](https://github.com/OpenElements/maven-support-care/issues/44)) for the sake of ordering and simple cross-references to the issue lists.
The remainder of the directory name should be a short title of the issue.
In the course of the work, the title might change over time, but the unique issue number grants a stable reference.

### Contents and Structure

When we start working on an issue, we least provide an index file with additional information (and some optional [Front Matter](#front-matter).

TBD: Which information should it cover?

### More files

Whenever we need to persist more information, e.g., some evaluations or reports, we can add more files to the directory, i.e., diagrams, documents, worksheets, data, etc.

## Life Cycle

### Starting the document

We should start with a respective document whenever we consider the first practical steps beyond the initial issue.

### Epic preparation and implementation phase

<dl><dt><strong>❗ IMPORTANT: Iterative development</strong></dt><dd>

We are aware that working on a complex problem does very often not result in a strict separation of preparation and implementation phases.
Much IT endeavors run in iterations of explore and implementation phases.

* Start/continue exploring a problem domain.
* Get a first/deeper understanding.
* Implement it.
* Show it to other stakeholders.
* Get feedback which leads to a better understanding, i.e., going back to the first phases.
</dd></dl>

During the preparation and implementation iterations, we can add more items to the document(s).
Note that these should not reflect detailed discussions with stakeholders, but rather focus on (deep) understanding of the problem and the solution space.
Keep discussions where they are and only set references where necessary

### Finalize Work

Whenever we finish the work on a particular epic/issue, the result may contain documentation as well.
This final documentation might focus on the achieved solution despite the way which led to it.
For historical reasons (what work led to the respective result), we should keep this documentation here (but mark it as _done_, e.g., by the status).

**💡 TIP**\
You may treat it as some kind of long ADR (architecture decision record).

## Technical considerations

### Front Matter

Note also that the index document may contain some [front-matter](https://docs.asciidoctor.org/asciidoctor/latest/html-backend/skip-front-matter/#front-matter-for-static-site-generators) which might support automatic linking and evaluation of the document later.

**Front matter of Epic 44**

```yaml
---
---
```
