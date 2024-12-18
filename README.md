# Nix

Nix setup for server

## Install

```bash
# First time install
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate

# Install / Update
nix run home-manager -- switch --flake github:cupcakearmy/nix-cli#root -b bkp
```

## Update

This can be run on any machine. Just update and then just rerun on the targets

```bash
nix flake update

# To test
nix run home-manager -- build --flake .#root
```

```

```
