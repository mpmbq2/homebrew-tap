# Homebrew Tap for Digi-Dx

Official Homebrew tap for [Digi-Dx](https://github.com/mpmbq2/digi-dx) on Apple Silicon macOS (M1/M2/M3/M4).

## Install

```bash
brew install mpmbq2/tap/digi-dx
brew services start digi-dx
```

Then open **<http://127.0.0.1:8788>** in your browser.

### Optional: Full Weak-Signal `jt9` Decoder

```bash
brew install --cask wsjtx
```

### Upgrade

```bash
brew update && brew upgrade digi-dx && brew services restart digi-dx
```

### Uninstall

```bash
brew services stop digi-dx
brew uninstall digi-dx
```

Your QSO database in `~/Library/Application Support/digi-dx` is preserved on uninstall.
