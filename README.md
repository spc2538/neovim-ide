# Neovim IDE

## Post installation steps

```sh
nvim
$ PackerInstall
find ~/ -type d -name 'coc.nvim'
cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim
yarn install
yarn add esbuild
yarn build
nvim
$ :CocInstall coc-python


```
