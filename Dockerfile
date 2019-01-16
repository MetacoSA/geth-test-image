FROM ethereum/client-go:v1.8.21

ADD ./resources ./resources

RUN geth init ./resources/genesis.json --datadir /data
RUN geth account import ./resources/account.priv --password /dev/null --datadir /data
RUN geth makedag 0 ~/.ethash
RUN geth makedag 36000 ~/.ethash

EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["geth"]
