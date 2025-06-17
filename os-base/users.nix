{
  users.users.shooter = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPqxDVOLkyhFF25weYnAMsS+6TIY7sTOMto70ZWE3TQm shooter@pc"
    ];
  };
  users.mutableUsers = false;
}