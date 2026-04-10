# ADR 001 — Documentation Site Generator

**Status:** pending

**Decision makers:** Support and Care Dev Team

**Date:** 2026-04-08

**Related issues:** [GitHub #185](https://github.com/support-and-care/maven-support-and-care/issues/185), [GitHub #186](https://github.com/support-and-care/maven-support-and-care/issues/186)

## Context and Problem Description

As part of the "Getting started" documentation effort, we collected requirements for a modern documentation tool [GitHub #185](https://github.com/support-and-care/maven-support-and-care/issues/185). The goal is to use the Getting Started documentation as a proof of concept for how documentation could look today.

### Requirements (from GitHub #185)

| Priority | Requirement |
|----------|-------------|
| Must | Docs-as-Code with Markdown or AsciiDoc |
| Must | Code snippets (syntax highlighting, line numbers, copy without line numbers) |
| Must | Search functionality |
| Must | PDF export |
| Must | Table of contents with linkable subheaders |
| Must | Responsive design for mobile and desktop without wasting space on desktop |
| Must | Easy and continuous deployment (CI/CD pipeline support) |
| Must | Accessibility support |
| Nice | Dead link detection |

Based on these requirements, we built **four proof-of-concept repositories** (GitHub #186) with similar content so we could compare ergonomics, runtimes, and integration cost.

### MkDocs ecosystem risk

During evaluation, the MkDocs project entered a period of significant instability. MkDocs has seen no meaningful development in over 18 months. A controversial v2 rewrite by the original author removes the plugin system that the ecosystem depends on. Material for MkDocs, the theme used by the vast majority of MkDocs sites, has entered maintenance mode. The community has fragmented into three successor initiatives (ProperDocs, MaterialX, Zensical). For a detailed account see [The Slow Collapse of MkDocs](https://fpgmaas.com/blog/collapse-of-mkdocs/) (March 2026). This risk factor weighed heavily against choosing MkDocs.

## Considered Options

1. **MkDocs with Material for MkDocs**
2. **Zensical**
3. **Quarkus Roq**
4. **Docusaurus v3**

## Decision

**Zensical**

We chose Zensical because it inherits the proven UX of Material for MkDocs while avoiding the governance and maintenance risks that now affect the MkDocs project. Zensical is built from scratch by the same team that created Material for MkDocs (@squidfunk) and has been joined by key MkDocs ecosystem contributors such as @pawamoy (author of mkdocstrings). It reads existing `mkdocs.yml` files natively. The tool ships with code annotations, copy-to-clipboard, syntax highlighting with line numbers, built-in search (redesigned engine), responsive design, dark/light theme toggle, table of contents with linkable subheaders, content tabs, admonitions, Mermaid diagrams, and accessibility-friendly markup  satisfying almost all "Must" requirements from GitHub #185. With over 4,000 GitHub stars already, Zensical is the most actively adopted MkDocs successor and the most likely to receive sustained long-term investment.

## Positive Consequences

- Built and maintained by the team behind Material for MkDocs, the most widely used MkDocs theme continuity of design quality and domain expertise.
- Authors write Markdown in `docs/` and configure `zensical.toml`, the authoring experience is familiar to anyone who has used MkDocs + Material.
- Almost all "Must" requirements from GitHub [GitHub #185](https://github.com/support-and-care/maven-support-and-care/issues/185) are met out of the box without third-party plugins apart from PDF export which is in progress https://zensical.org/docs/community/faqs/?h=pdf#will-you-provide-support-for-producing-pdf-outputs.
- Avoids the governance and stagnation risk that currently affects MkDocs.
- Fastest build times of the evaluated options (claimed 5x faster than MkDocs).

## Pros and Cons of the Options

### MkDocs with Material for MkDocs

Python and pip, configuration in `mkdocs.yml`, **Material** theme provides search, dark/light mode, tabs, Mermaid, and copy-to-clipboard for code. PDF is available via `mkdocs-with-pdf` (WeasyPrint and system libraries). **AsciiDoc** is supported via a plugin (Asciidoctor when installed). **Lychee** can validate the built `site/` in CI.

- Good: Very large existing community and plugin set.
- Good: Authors only need Markdown for the common case.
- Good: Documentation and publishing patterns (e.g. `mkdocs gh-deploy`) are well established.
- Good: Strict `mkdocs build --strict` fits CI gates.
- Bad: **Project has seen no meaningful development in 18 months.**
- Bad: **Material for MkDocs has entered maintenance mode (Nov 2025).**
- Bad: **MkDocs v2 rewrite removes the plugin system, breaking the ecosystem, the community has fragmented into competing successors.**
- Bad: Python + optional Ruby (AsciiDoc) + PDF stack increases dependency surface.

### Zensical

TOML configuration (`zensical.toml`), feature flags for navigation, search highlighting, code annotations, and theme variants. Strong authoring experience for Markdown extensions (admonitions, tabs, Mermaid, footnotes, math, tooltips). Built by the creators of Material for MkDocs (@squidfunk) with @pawamoy now also contributing.

- Good: Built by the team with the deepest experience in documentation tooling for the MkDocs ecosystem.
- Good: Reads existing `mkdocs.yml` natively.
- Good: 5x faster rebuilds and redesigned search engine.
- Good: Single tool covers all "Must" requirements without plugins.
- Good: Most adopted MkDocs successor (4,000+ GitHub stars as of April 2026).
- Bad: Younger project - ecosystem and third-party integrations are still maturing.
- Bad: Team familiarity may be lower initially, though the authoring model is very similar to Material for MkDocs.

### Quarkus Roq

Fits **Java-first** teams already on **Quarkus**: `mvn quarkus:dev` for local preview, batch generation for static output. Demonstrates **AsciiDoc** in-repo, **Pagefind** for search, **PDF** and **Lychee** in CI, aligned with the MkDocs POC feature set at a high level.

- Good: Native fit for microservices or platforms where Quarkus is already standard.
- Good: Static output under `target/roq/` for Pages, reuse of Maven/CI patterns.
- Bad: Heavier than a pure docs tool if the repo is documentation-only.
- Bad: Authors must be comfortable with the Roq content/layout model.
- Bad: Node tooling still appears for PDF/search automation in the POC.

### Docusaurus v3

**Node.js >= 20**, docs in **Markdown/MDX** with React components when needed, **local search** via `docusaurus-plugin-search-local`, **Mermaid** via theme plugin, build fails on broken links when configured (`onBrokenLinks: 'throw'`). AsciiDoc in the POC uses a **build-time conversion** path (not first-class `.adoc` routing).

- Good: Excellent for product docs that may grow into custom React UI.
- Good: Strong versioning and i18n story for larger doc programs.
- Good: Large community and hosting examples.
- Bad: MDX and npm ecosystem overhead for teams who want "only Markdown".
- Bad: AsciiDoc is indirect compared to Roq/MkDocs AsciiDoc paths.
- Bad: PDF is scripted (Playwright) rather than a single first-party "export docs" command.

## Links

### Deployed POCs

- [MkDocs POC](https://ndacyayisenga-droid.github.io/mkdocs-poc/)
- [Docusaurus POC](https://ndacyayisenga-droid.github.io/docusaurus-poc/)
- [Roq POC](https://ndacyayisenga-droid.github.io/roq-poc/)
- [Zensical POC](https://ndacyayisenga-droid.github.io/zensical-poc/)

### References

- [Zensical documentation](https://zensical.org/docs/)
- [Roq](https://iamroq.com/) · [quarkus-roq](https://github.com/quarkiverse/quarkus-roq)
- [Docusaurus](https://docusaurus.io/)
- [The Slow Collapse of MkDocs](https://fpgmaas.com/blog/collapse-of-mkdocs/) — March 2026 article documenting the MkDocs maintainership crisis
