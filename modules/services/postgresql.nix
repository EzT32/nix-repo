{ lib, ... }:
{
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "testdb" ];

    authentication = lib.mkOverride 10 ''
      local all all trust
    '';
  };
}
