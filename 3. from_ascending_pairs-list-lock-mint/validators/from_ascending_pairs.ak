use aiken/collection/list
use aiken/fuzz
use cardano/assets
use cardano/transaction.{Transaction}

validator main {
  mint(redeemer: List<Int>, policy_id: ByteArray, self: Transaction) {
    trace @"minting": policy_id, @"with", redeemer

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
    [] ->
      []
    [p, ..tail] -> {
      let before =
        tail
          |> list.filter(fn(x) { x < p })
          |> quicksort
      let after =
        tail
          |> list.filter(fn(x) { x >= p })
          |> quicksort
      list.concat(before, [p, ..after])
    }
  }
}

fn from_ascending_pairs(pairs: List<(Int, Int)>) -> List<Int> {
  pairs
    |> list.flat_map(fn(pair) {
      let (a, b) = pair
      if a <= b {
        [a, b]
      } else {
        [b, a]
      }
    })
}

test quicksort_0() {
  quicksort([]) == []
}

test quicksort_1() {
  quicksort([3, 2, 1, 4]) == [1, 2, 3, 4]
}

test quicksort_2() {
  quicksort([1, 2, 3, 4]) == [1, 2, 3, 4]
}

test quicksort_prop(xs via fuzz.list(fuzz.int())) {
  fuzz.label_when(list.is_empty(xs), @"empty", @"non-empty")
  quicksort(xs) == quicksort(quicksort(xs))
}

test from_ascending_pairs_test() {
  from_ascending_pairs([(1, 3), (2, 4), (5, 5)]) == [1, 3, 2, 4, 5, 5]
}
