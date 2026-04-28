<div align="center"><h1>yank-file.yazi</h1></div>

Yazi plugin to copy file content to the clipboard.

<!-- ![showcase](https://github.com/crawraps/yank-file.yazi/assets/VIDEO_OR_IMAGE_ID) -->

## Installation

```sh
ya pack -a crawraps/yank-file.yazi
```

Or manually:

```sh
git clone https://github.com/crawraps/yank-file.yazi ~/.config/yazi/plugins/yank-file.yazi
```

## Dependencies

- **[wl-copy](https://github.com/bugaevc/wl-copy)** — Wayland clipboard manager (required)

> **Note:** This plugin currently only supports `wl-copy` (Wayland). Support for other clipboard managers (`xclip`, `xsel`, etc.) may be added in the future.

## Usage

Hover over a file and trigger the plugin — its content is copied to your system clipboard.

```toml
[[mgr.prepend_keymap]]
on = [ "y", "c" ]
run = "plugin yank-file"
desc = "copy file content to clipboard"
```
