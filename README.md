# homebrew-tap

Homebrew tap for [agent-wrap](https://github.com/andreichenchik/agent-wrap).

```bash
brew install andreichenchik/tap/agent-wrap
```

Apple silicon Macs on macOS 26+. The formula installs a prebuilt, signed binary; release
artifacts live in the agent-wrap repo. The formula is bumped automatically by `make release` there.

Formerly published as `container-primer`; `tap_migrations.json` migrates existing installs to
`agent-wrap` on `brew upgrade`.
