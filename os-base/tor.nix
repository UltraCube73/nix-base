{ pkgs, ... }:
{
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = [
        "obfs4 92.252.24.38:8080 02F00A33017A24E99112E5CA498AECD204F913F3 cert=eWfCYOE/3kdmDpYy/tT0CuKI01dWKY6BtSAMSu0uuD4ixo7RE4/av+0fNjw4sbZmORLKVQ iat-mode=0"
        "obfs4 85.92.108.65:20443 110DCE293D0AEF91738A3BA86B3B8E4D5E588855 cert=e6E5HWW5zmRjsuu8cfCP2ap0uWYBB9Sgw6gF1HTC+aa2Q+V5JXdzQoy72nUBeQIKHTXPRw iat-mode=0"
        "obfs4 49.13.126.113:17521 547A3A858B92D28C584FD0DA3B1E932467B244BA cert=j5iBsig0Q0FWbyzOBRAcqoO3vZ6FSgvfsYV2Fv3sDBlkA6lrzsu5G4NNcZJWnsa8HXC9cg iat-mode=0"
        "obfs4 95.217.11.29:22134 9859875C752128125D3179F90BA6351744B09040 cert=W+qSHr6JcFY6UyJiXR3Ec5I5bYHFwDAXNq8HRQU3C56h/aJB8PQqbr8Sq04zKvhEWGbxEw iat-mode=0"
      ];
    };
  };
}