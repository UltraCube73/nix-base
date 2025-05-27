{ lib, ... }:
{
  boot.loader.timeout = lib.mkForce 0;
}