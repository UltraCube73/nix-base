{ pkgs, ... }:
{
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = [
        "obfs4 185.177.207.27:25394 5DC194350EE021A29080394D902EA1A30D2EC357 cert=p9L6+25s8bnfkye1ZxFeAE4mAGY7DH4Gaj7dxngIIzP9BtqrHHwZXdjMK0RVIQ34C7aqZw iat-mode=2"
        "obfs4 178.42.71.81:9003 A093DA0C7E933381720E054909EAEA5E2A695A8F cert=F4jRNMOInzXAvZFUJwaYwV8VMx9dqQUSPNIHgG5yZKAhNTC7cbHrU3LH/um1dHI2kHaJEg iat-mode=0"
        "obfs4 91.134.72.157:32254 899EF50F3A50266D6DBA241731AA8B7F2C4D0D8E cert=egt81Hl3jkIctuEU3/+c4oFSCcK15STPMWGW4pXpYzwU4KDQWgMb2XfzKkWH7sOFxP77NA iat-mode=0"
        "obfs4 57.128.57.245:3099 D655AC9C21147BB62C781149150F0E723C4F8FBC cert=fnU2eGPmE6L53eXZf/29d1JloUD2XI/4KHNImTquPr/eBvkrOuuutIlpwvJsZTV1NvZ4aw iat-mode=0"
      ];
    };
  };
}