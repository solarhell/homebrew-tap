# solarhell/homebrew-tap

Homebrew tap for [solarhell](https://github.com/solarhell) projects.

## Usage

```sh
brew tap solarhell/tap
```

## Casks

### solarhell-go2shell

Open terminal from Finder — [solarhell/go2shell](https://github.com/solarhell/go2shell)

```sh
brew trust --cask solarhell/tap/solarhell-go2shell
brew install --cask solarhell/tap/solarhell-go2shell
```

The cask token carries a `solarhell-` prefix because `homebrew/cask` ships an
unrelated cask named `go2shell`, and Homebrew requires cask tokens to be
globally unique.

#### Migrating from the old token

Installations made before the rename are mapped through `cask_renames.json`.
Trust entries, however, are stored per token and are *not* carried over, so
trust the new token before migrating:

```sh
brew trust --cask solarhell/tap/solarhell-go2shell
brew migrate --cask solarhell/tap/go2shell
```

## Development

The cask files in `Casks/` are the source of truth. Release automation in the
upstream repository only rewrites the `version` and `sha256` stanzas — anything
else you edit here is preserved.

Every push and pull request runs `brew style`, `brew audit` (both architectures),
and a consistency check on `cask_renames.json`. To run the same checks locally:

```sh
brew style solarhell/tap
brew audit --cask --tap solarhell/tap --arch=arm
brew audit --cask --tap solarhell/tap --arch=intel
python3 .github/scripts/validate_renames.py
```

## License

[MIT](LICENSE)
