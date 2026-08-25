# scrypt-kitty/homebrew-tap

Homebrew formulae and casks for [scrypt-kitty](https://github.com/scrypt-kitty)
projects.

## Install

```sh
brew tap scrypt-kitty/tap
brew install --cask parchment
```

Or in one line, without tapping first:

```sh
brew install --cask scrypt-kitty/tap/parchment
```

## Why a tap rather than homebrew-cask

The official `homebrew-cask` repository applies
[notability requirements](https://docs.brew.sh/Acceptable-Casks#rejected-casks)
— roughly 30 forks, 30 watchers, or 75 stars — which a new project does not
meet. A tap works immediately and installs identically; submitting upstream is
worth doing once a project has the traction to qualify.

## Casks

| Cask | Description |
|---|---|
| [`parchment`](Casks/parchment.rb) | A fast, private, open-source Markdown viewer |

Casks here are updated automatically when the upstream project publishes a
release.
