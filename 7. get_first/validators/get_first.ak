use aiken/collection/list
use aiken/fuzz
use cardano/assets
use cardano/transaction.{Transaction}

// Main validator
validator main {
  // Minting function for creating NFTs
  mint(redeemer: List<Int>, policy_id: ByteArray, self: Transaction) {
    trace @"minting": policy_id, @"with", redeemer

    let quantities =
      self.mint
        |> assets.flatten
        |> list.map(fn(t) { t.3rd })

    // Check if sorted quantities match redeemer after sorting
    (quicksort(redeemer) == quantities)?
  }

  else(_) {
    fail
  }
}

// Function to get the first element of a list, if it exists
fn get_first(xs: List<Int>) -> Option<Int> {
  when xs is {
    [] -> None
    [head, .._] -> Some(head)
  }
}

// Sorting function: QuickSort
fn quicksort(xs: List<Int>) -> List<Int> {
  when xs is {
    [] ->
      []
    [p, ..tail] -> {
      let before = tail |> list.filter(fn(x) { x < p }) |> quicksort
      let after = tail |> list.filter(fn(x) { x >= p }) |> quicksort
      list.concat(before, [p, ..after])
    }
  }
}

// Test cases for QuickSort
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

// Test cases for get_first function
test get_first_0() {
  get_first([]) == None
}

test get_first_1() {
  get_first([1, 2, 3]) == Some(1)
}

test get_first_2() {
  get_first([42]) == Some(42)
}
