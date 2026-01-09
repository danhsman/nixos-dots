# NixOS Dotfiles

My personal, modular NixOS configuration using **Flakes** and **Home Manager**.
Designed for my **Lenovo Legion 5** w/ an NVIDIA 5070 Mobile GPU & Core Ultra 7 255HX .

## Highlights

* **Modular Structure:** Clean separation between System (`core`) and User (`home`) configurations.
* **Window Manager:** [Niri](https://github.com/YaLTeR/niri) (Scrollable Tiling Wayland Compositor).
* **Terminal:** Foot + Bash (Will be changed in the future)
* **Graphics:** Configured PRIME for Nvidia and Intel drivers for Wayland.

## Structure

```text
nixos-dots/
├── flake.nix             # Entry point
├── system/
│   └── legion5/          # Host-specific configuration (Hardware, Boot)
├── modules/
│   ├── core/             # System modules (Nvidia, Pipewire, Users)
│   └── home/             # User modules (Niri, Git, Foot, Neovim)
└── templates/            # Flake templates for DevShellsixOS flake setup


