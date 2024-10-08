# fosu-chtf-omz-plugin

A custom Oh My Zsh plugin I built for myself to manage Terraform versions using [`chtf`](https://github.com/Yleisradio/chtf). Not really maintained, but if it works, great. If not, well, you knew the risks.

## Features

1. **chtf integration**: Loads `chtf` if available.
2. **Version handling**: Sources `.chtfrc` from the current or home directory to select the appropriate Terraform version.
3. **Fallback for missing Terraform**: Prompts the user if no version is found.

## Installation

Place the `fosu-chtf.plugin.zsh` in your Oh My Zsh custom plugins directory (e.g., `~/.oh-my-zsh/custom/plugins/fosu-chtf/`) and add `fosu-chtf` to your `.zshrc`:

```zsh
plugins=(... fosu-chtf)
```

## License

This project is licensed under the [UNLICENSE](http://unlicense.org/), allowing free use, modification, and distribution.

## Disclaimer

This plugin is provided "as is" and is not actively maintained. Use at your own risk.