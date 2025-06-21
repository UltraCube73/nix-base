{
  users.users.shooter = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPqxDVOLkyhFF25weYnAMsS+6TIY7sTOMto70ZWE3TQm shooter@pc"
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMfHF95ZKvqYNr8k415+rNFwWXDCg/Sa0UvC5lDjREnVDomYPiUgLT09olluLpH/iVrgTzIypmDdP6QfR//8KZk= rutoken"
    ];
  };
  users.mutableUsers = false;
}