### Repository structure
Single root flake to handle userspace and system configurations.
```
.
├── hosts
│   ├── desktop
│   └── laptop
├── lib
├── modules
│   ├── desktop
│   │   ├── hyprland
│   │   │   └── keybindings
│   │   └── waybar
│   ├── dev
│   │   ├── nvim
│   │   │   └── lua
│   │   │       ├── core
│   │   │       ├── lsp
│   │   │       └── plugins
│   │   └── vscode
│   ├── fonts
│   ├── programs
│   │   ├── rofi
│   │   └── shell
│   ├── services
│   │   └── sddm
│   │       └── themes
│   │           └── Gruvbox
│   ├── system
│   └── users
├── overlays
└── wallpapers
``` 

### Import handling
Strictly uses relative imports. Any deviation from is considered as an issue.

Each directory contains a `default.nix` file for folder-import syntax.
`default.nix` files are solely for file aggregation. They should NOT cointain anything else.
```nix
{
    imports = [
        ...
    ];
}
```

### Options
Configuration is supposed to be fully togglable.
See module's `README.md` for options.
