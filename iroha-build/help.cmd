
# memo : to pull submodules :git submodule update --init --recursive
#  memo : docker commit 8736d03f4c0c hyperledger/iroha-build

##### FOR TEST
#auto publicKey1 = "xrXCjvMwFf3LGMZ6w//rB6JHtvL0iQpiwaiVYWMIE9k=";
#auto privateKey1 = "sMrFd1JzbfJJ4LOffj6R6mVw2nTadzjYgs2L+KCPe3oVgO558ZiDMP38xXWUNstTgV7M1rXAuceiTFiPaoxjPA==";

#auto publicKey2 = "FZ7KQcL88eBkhMk41jNmQeKBBT0+jvpCMFXKowtDf8o=";
#auto privateKey2 = "0PpZ8x/hT5uUQ6y2e/Mq3Pk+j90+q1Zch3yDzBY42ny9bO6aQNKkn90JuwzigUTpRtjpyRWYpq3ZNDtwTdSSPQ==";


##### CREATE ACCOUNT

#curl -X POST http://172.17.0.2:1204/account/register -d"{\"alias\":\"francois\",\"publicKey\":\"xrXCjvMwFf3LGMZ6w//rB6JHtvL0iQpiwaiVYWMIE9k=\",\"timestamp\":1482760525}"

#curl -X POST http://172.17.0.2:1204/account/register -d"{\"alias\":\"jlp\",\"publicKey\":\"FZ7KQcL88eBkhMk41jNmQeKBBT0+jvpCMFXKowtDf8o=\",\"timestamp\":1482760525}"

#### GET ACCOUNT

#curl -X GET http://172.17.0.5:1204/account?uuid=b066d90cc6a261371dc014cfd32c08c731f8d6b1cb6e212654c3506044cf729c

#curl -X GET http://172.17.0.5:1204/account?uuid=29888f937b72d3d147f10e189b6bbf0b1e99a2a87992b794d931a1622c7f1f35




