# complete-lastf

A zsh plugin that does filename completion. 

For example, it replaces the user's `lastf` with the last modified file in the current directory.

[中文版](./README.zh.md)

## Demo

![插件使用效果](./demo.gif)

## Features

The **last file** is specifically the last modified file in the current directory.

1. Replace `lastfN` with the last N files.

   For example, `lastf2` replaces with the last 2 files.

   If `N` is not provided, like in `lastf`, it defaults to 1.

2. Replace `lastdN` with the last N directories.

## Dependencies

- ~~[eza](https://github.com/eza-community/eza): A modern replacement for `ls`. The `-D` option lists only directories, which is difficult with `ls`.~~

  **Note**: This plugin now uses zsh built-in glob patterns instead of external commands for better reliability.

  **Important**: eza version 0.23.0 and later has compatibility issues in certain execution environments (such as zsh widget contexts). This plugin switched to zsh built-in glob patterns to avoid dependency on external commands.

## Installation

1. Clone the repository to `~/.oh-my-zsh/custom/plugins/complete-lastf`.

2. Add the following line to your `~/.zshrc`:

   ```shell
   plugins=(...  complete-lastf)
   ```
