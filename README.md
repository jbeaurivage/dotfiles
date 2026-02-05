
# Dotfiles & Home Manager Configuration

This repository contains Nix-based configuration for system setup and user environments, using Home Manager and NixOS modules. It is organized for maintainability and modularity, supporting both desktop and server use cases.

## Getting Started

### Prerequisites
- [Nix](https://nixos.org/download.html) installed on your system
- (Optional) [Home Manager](https://nix-community.github.io/home-manager/) for user environment management

### Usage

#### Flake-based Setup
This repo uses Nix flakes. To apply a configuration:

1. Clone the repository:
	 ```sh
	 git clone https://github.com/yourusername/dotfiles.git
	 cd dotfiles
	 ```
2. For a Home Manager configuration:
	 ```sh
	 home-manager --flake .
	 ```
3. For a NixOS system configuration (if using NixOS):
	 ```sh
	 sudo nixos-rebuild switch --flake .#sol-server
	 ```

See the [NixOS manual](https://nixos.org/manual/nixos/stable/) and [Home Manager manual](https://nix-community.github.io/home-manager/) for more details.

## Repository Structure

```
flake.nix                # Flake entrypoint, defines system and user configs
home-manager/            # Home Manager modules and user environment configs
	home.nix               # Main Home Manager config (desktop/user)
	home-sol-server.nix    # Home Manager config for server user
	packages/              # Modular package configs
		helix/               # Helix editor config and theme
		git/                 # Git config
		zsh/                 # Zsh config and theme
	scripts/               # Utility scripts and their Nix wrappers
		merge-pdf/           # PDF merging script and module
		trim-mp4/            # MP4 trimming script and module
system/                  # NixOS system configuration
	sol-server/            # Server-specific system config
		configuration.nix    # Main NixOS config for server
		hardware-configuration.nix # Hardware details
		services/            # Service modules (e.g., podman)
vscode/                  # VS Code settings
	settings.json          # Editor settings
```

## Customization

- Edit `home-manager/home.nix` for user-level changes (packages, dotfiles, shell, editor, etc.)
- Edit `system/sol-server/configuration.nix` for system-level changes (services, hardware, etc.)
- Add or modify modules in `home-manager/packages/` for reusable config blocks

## Notes

- This repo is intended for personal use but can be adapted for other users or hosts.
- Flake inputs are pinned for reproducibility; update as needed.
- Scripts in `home-manager/scripts/` are wrapped for easy installation via Home Manager.

## License

See LICENSE file if present. Otherwise, default to personal use.
