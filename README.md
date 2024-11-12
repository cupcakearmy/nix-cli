# Nix

Nix setup for server

## Install

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
nix run home-manager -- switch --flake github:cupcakearmy/nix-cli#root -b bkp
```
