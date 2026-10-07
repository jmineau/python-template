# Contributing to python-template

## Working on the template

- `template/` is the generated project. Files ending in `.jinja` are rendered
  with the answers from `copier.yml` (the suffix is dropped); all other files
  are copied verbatim, so GitHub Actions `${{ }}` expressions and Sphinx's
  autosummary templates need no escaping there. Inside a `.jinja` file, wrap
  GitHub expressions in `{% raw %}...{% endraw %}`.
- Values every project shares but nobody should be asked for (`python_max`,
  `uv_version`) are computed questions (`when: false`) in `copier.yml`. Bump
  them there; `copier update` carries the change into each project.
- In `justfile.jinja`, recipes take arguments as `"$@"` (`set positional-arguments`)
  so just's `{{ }}` never collides with Jinja's.

## Testing a change

You need uv and just.

```bash
just bake            # render the working tree into $TMPDIR/python-template-bake
just test            # bake both publish_to_pypi variants and, in each, run
                     # quality-check, build-docs, every pre-commit hook, dist,
                     # and the tag/dev version checks
```

`just test` is what the Template workflow runs on every pull request.
pre-commit needs git 2.31 or newer.

Before tagging a template release, also run on a baked project:

```bash
uvx --from "sp-repo-review[cli]" sp-repo-review .   # Scientific Python checks
uvx zizmor --offline .github                        # workflow security
```

## Releasing the template

Projects record the template version in `.copier-answers.yml` (`_commit`), and
`copier update` moves them to the newest tag. Tag releases `vX.Y.Z`: a new
major version for changes that need manual follow-up in projects, a minor one
for new tooling, a patch for fixes. Note what changed, and anything a project
must do by hand, in the release notes.

## Guidelines

- Encode what the packages actually do; a convention earns its place here once
  it has proved itself in a real package.
- Keep generated projects passing `just test`, repo-review, actionlint and zizmor.
- Commit messages follow Conventional Commits.
