{ pkgs, ... }:
let
  vsg = final: prev: {
    vsg = prev.python3Packages.buildPythonPackage {
      pname = "vsg";
      version = "3.25.0";

      src = pkgs.python3Packages.fetchPypi {
        inherit (final.vsg) pname version;
        hash = "sha256-3jVkyeGMPPUktYXwI7DbByiyPMefuvXx++5y+Xr+69I=";
      };

      pyproject = true;

      build-system = with pkgs.python3Packages; [
        setuptools
        setuptools-scm
        setuptools-git-versioning
      ];

      propagatedBuildInputs = with pkgs.python3Packages; [
        pyyaml
      ];
    };
  };
in
{
  nixpkgs.overlays = [
    vsg
  ];
}
