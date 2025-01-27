{ config, pkgs, lib, ... }:
{
  home.packages = [
    (pkgs.python311.withPackages (
      ps: with ps; [
      python
      numpy
      matplotlib
      pandas
      scikit-learn
      jupyter
      pillow
      seaborn
      torch-bin
      ]
    ))
  ];
}
