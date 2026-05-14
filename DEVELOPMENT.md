# Maven&trade; Support & Care Development

While working with this repository, you might perform the following tasks.

## Documentation site (Zensical)

The documentation site is built with [Zensical](https://zensical.org), a static site generator built by the creators of Material for MkDocs.
The source files live under `src/docs/` and the build is configured through `zensical.toml`.

### Prerequisites

* Python 3.10 or newer
* `pip` (or `uv`, `pipx`, etc.)

### Install Zensical

```shell
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Preview locally

```shell
zensical serve
```

This starts a local web server with hot reload at http://localhost:8000.

### Build the static site

```shell
zensical build
```

The generated site is written to the `site/` directory (ignored by Git).

## Deployment

The documentation has two deployment targets:

* **Production** is served from [Coolify](https://coolify.io), which builds the
  `Dockerfile` at the repository root on every push to `main`. Coolify is wired
  up to the repository directly (via its GitHub App or a webhook), so the
  GitHub Actions workflow in this repository does **not** trigger production
  deploys.
* **Pull request previews** are deployed to **GitHub Pages**. The GitHub Actions
  workflow at `.github/workflows/build-and-publish-docs.yaml` builds the site
  with Zensical on every push and pull request, and on pull-request events it
  uses [`rossjrw/pr-preview-action`](https://github.com/rossjrw/pr-preview-action)
  to publish the build to the `gh-pages` branch under
  `pr-preview/pr-<number>/`. The action posts the preview URL as a comment on
  the pull request and removes the preview again when the pull request is
  closed or merged.

### One-time GitHub Pages setup

In the repository, go to **Settings → Pages** and configure:

* **Source**: *Deploy from a branch*
* **Branch**: `gh-pages` / `/ (root)`

The `gh-pages` branch is created automatically the first time a pull request
preview is deployed.
