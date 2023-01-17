{
  description = "cosmic-epoch";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    cosmic-bg.url = "github:pop-os/cosmic-bg";
    cosmic-comp.url = "github:pop-os/cosmic-comp";
    cosmic-launcher.url = "github:pop-os/cosmic-launcher";
    cosmic-osd.url = "github:pop-os/cosmic-osd";
    cosmic-panel.url = "github:pop-os/cosmic-panel";
    cosmic-session.url = "github:pop-os/cosmic-session";
    # MISSING: # cosmic-settings.url = "github:pop-os/cosmic-settings";
    cosmic-settings-daemon.url = "github:pop-os/cosmic-settings-daemon";

    xdg-desktop-portal-cosmic.url = "github:pop-os/xdg-desktop-portal-cosmic";
  };

  outputs = inputs:
    let
      #   inherit (nixpkgs) lib;
      #   genSystems = lib.genAttrs [
      #     # Add more systems if they are supported
      #     "aarch64-linux"
      #     "x86_64-linux"
      #   ];

      pkgsFor = inputs.nixpkgs.legacyPackages;

      #   props = builtins.fromJSON (builtins.readFile ./props.json);

      #   mkDate = longDate: (lib.concatStringsSep "-" [
      #     (builtins.substring 0 4 longDate)
      #     (builtins.substring 4 2 longDate)
      #     (builtins.substring 6 2 longDate)
      #   ]);
    in
    {
      nixosModules.default = import ./nix/module.nix inputs;
      homeManagerModules.default = import ./nix/hm-module.nix inputs;
    };

  nixConfig = {
    # TODO: CI, provision cachix for cosmic
    # extra-substituters = ["https://cosmic.cachix.org"];
    # extra-trusted-public-keys = ["cosmic.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
