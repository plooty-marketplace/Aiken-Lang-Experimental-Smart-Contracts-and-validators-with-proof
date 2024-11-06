use aiken/collection/list
use cardano/assets
use cardano/transaction.{Transaction}

validator mint_nft {
  mint(redeemer: List<Int>, policy_id: ByteArray, self: Transaction) {
    trace @"minting NFT": policy_id, @"with", redeemer

    let quantities =
      self.mint
        |> assets.flatten
        |> list.map(fn(t) { t.3rd })

    (quicksort(redeemer) == quantities)?
  }

  else(_) {
    fail
  }
}

fn quicksort(xs: List<Int>) -> List<Int> {
  when xs is {
    [] -> []
    [p, ..tail] -> {
      let before = tail |> list.filter(fn(x) { x < p }) |> quicksort
      let after = tail |> list.filter(fn(x) { x >= p }) |> quicksort
      list.concat(before, [p, ..after])
    }
  }
}
