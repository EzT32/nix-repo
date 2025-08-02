### Repository structure
Single root flake to handle userspace and system configurations.
```
.
├── home-manager
│   ├── modules
│   │   ├── apps
│   │   ├── cli
│   │   │   ├── git
│   │   │   └── shell
│   │   ├── desktop
│   │   │   ├── hyprland
│   │   │   │   └── keybindings
│   │   │   │       └── options
│   │   │   └── waybar
│   │   └── dev
│   │       ├── nvim
│   │       │   └── plugin
│   │       └── python
│   ├── profiles
│   └── wallpapers
├── hosts
│   ├── desktop
│   └── laptop
├── lib
├── modules
│   ├── desktop
│   ├── programs
│   │   ├── cli
│   │   └── gui
│   ├── services
│   ├── system
│   └── users
└── overlays
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
