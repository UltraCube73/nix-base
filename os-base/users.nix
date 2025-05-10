{
  users.users.shooter = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.mutableUsers = false;
}