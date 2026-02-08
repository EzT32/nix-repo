{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ javaPackages.compiler.openjdk25 ];
}
