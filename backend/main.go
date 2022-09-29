package main

import (
	"context"
	"fmt"
	"github.com/ethereum/go-ethereum/common"
	"log"

	"github.com/ethereum/go-ethereum/ethclient"
)

func main() {
	conn, err := ethclient.Dial("https://mainnet.infura.io/v3/59b67bea7d7c499e93d5ea41106218f9")
	if err != nil {
		log.Fatalf("Something went wrong => %v", err)
	}
	ctx := context.Background()
	tx, pending, err := conn.TransactionByHash(ctx, common.HexToHash("0xd02d1301b78d53a81907a01b0877a268041bd9137f401684d4d016375fb74411"))
	if err != nil {
		log.Fatalf("Something went wrong => %v", err)
	}

	if !pending {
		fmt.Println(tx)
	}
}
