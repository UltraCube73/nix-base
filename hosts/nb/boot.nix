{ lib, ... }:
{
  boot.loader.timeout = lib.mkForce 5;
}