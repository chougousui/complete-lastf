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

- [eza](https://github.com/eza-community/eza): A modern replacement for `ls`. The `-D` option lists only directories, which is difficult with `ls`.

## Installation

1. Clone the repository to `~/.oh-my-zsh/custom/plugins/complete-lastf`.

2. Add the following line to your `~/.zshrc`:

   ```shell
   plugins=(...  complete-lastf)
   ```
