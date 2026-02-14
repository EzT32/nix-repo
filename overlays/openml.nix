{ pkgs, ... }:
let
  openml = final: prev: {
    openml = prev.python3Packages.buildPythonPackage {
      pname = "openml";
      version = "0.15.1";

      src = pkgs.python3Packages.fetchPypi {
        inherit (final.openml) pname version;
        hash = "sha256-WK44QLbqc2u2xpvLsw1Ye4F/ZNsHDcaRrbngm5kBiBY=";
      };

      propagatedBuildInputs = with pkgs.python3Packages; [
        final.liac-arff
        requests
        xmltodict
        scikit-learn
        python-dateutil
        scipy
        numpy
        pandas
        minio
        pyarrow
        tqdm
      ];

      pyproject = true;
      build-system = with pkgs.python3Packages; [ setuptools ];
    };
  };
in
{
  nixpkgs.overlays = [
    openml
  ];
}
