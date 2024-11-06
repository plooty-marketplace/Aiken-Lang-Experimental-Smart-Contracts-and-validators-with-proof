use aiken/builtin
use aiken/collection/dict
use aiken/collection/list
use aiken/crypto.{blake2b_256}
use aiken/primitive/bytearray
use cardano/address.{Address, PaymentCredential, Script}
use cardano/assets.{PolicyId}
use cardano/transaction.{
  InlineDatum, Input, Output, OutputReference, Transaction,
} as tx

pub type Action {
  Mint(Int)  // Mint a specific number of NFTs
  Burn       // Burn the NFT
}

pub type SpendTokenName = ByteArray  // This will represent the token name

validator nft_gift_card(creator: ByteArray) {
  // Function for spending the NFT
  spend(
    datum: Option<SpendTokenName>, // The token name being burned
    _r: Data,
    own_ref: OutputReference,
    transaction: Transaction,
  ) {
    let Transaction { inputs, mint, .. } = transaction

    // Find the input corresponding to the output reference
    expect Some(own_input) =
      list.find(inputs, fn(input) { input.output_reference == own_ref })

    let Input {
      output: Output { address: Address { payment_credential, .. }, .. },
      ..
    } = own_input

    // Ensure the spending is authorized by the script policy
    expect Script(own_validator_hash) = payment_credential
    expect Some(datum) = datum

    // Ensure the NFT is being burned (quantity == -1)
    (mint |> assets.quantity_of(own_validator_hash, datum)) == -1
  }

  // Function for minting the NFT
  mint(rdmr: Action, policy_id: PolicyId, transaction: Transaction) {
    let Transaction { inputs, mint, extra_signatories, outputs, .. } = transaction

    let minted_assets =
      mint |> assets.tokens(policy_id) |> dict.to_pairs()

    when rdmr is {
      Mint(total) -> {
        expect [input, ..] = inputs

        // Create a unique base using the UTXO reference
        let base = builtin.serialise_data(input.output_reference)

        // Create a list of expected minted token names
        let expected_minted_token_names =
          create_expected_minted_nfts(base, total, [])

        // Ensure the contract creator is a signer of this transaction
        let signature_check =
          list.any(extra_signatories, fn(n) { creator == n })

        // Validate minting conditions
        signature_check && check_mint_and_outputs(
          minted_assets,
          outputs,
          expected_minted_token_names,
          Script(policy_id),
        )
      }
      Burn -> {
        // Ensure all minted assets have a quantity of -1 when burned
        list.all(
          minted_assets,
          fn(asset) {
            let Pair(_, amount) = asset
            amount == -1  // NFT is burned, so quantity should be -1
          },
        )
      }
    }
  }

  else(_) {
    fail  // If any other case, fail the transaction
  }
}

// Function to insert an element into a list while maintaining order
fn insert(self: List<a>, e: a, compare: fn(a, a) -> Ordering) -> List<a> {
  when self is {
    [] -> [e]
    [x, ..xs] -> {
      if compare(e, x) == Less {
        [e, ..self]
      } else {
        [x, ..insert(xs, e, compare)]
      }
    }
  }
}

// Check if each minted token name is in the expected list, has quantity of 1,
// and has a corresponding output with datum containing token name.
fn check_mint_and_outputs(
  minted_assets: Pairs<ByteArray, Int>,
  outputs: List<Output>,
  expected_assets: List<ByteArray>,
  validator_cred: PaymentCredential,
) -> Bool {
  when minted_assets is {
    [] -> True
    [Pair(minted_asset_name, quantity), ..rest_assets] -> {
      // Ensure the minted asset name matches the expected name
      expect
        list.any(
          expected_assets,
          fn(expected_asset) { expected_asset == minted_asset_name },
        )

      // Check if there’s an output corresponding to the minted asset with the right datum
      expect
        list.any(
          outputs,
          fn(output) {
            let Output { address, datum, .. } = output
            datum == InlineDatum(minted_asset_name) && address.payment_credential == validator_cred
          },
        )

      // Ensure the quantity is 1 for NFTs
      quantity == 1 && check_mint_and_outputs(
        rest_assets,
        outputs,
        expected_assets,
        validator_cred,
      )
    }
  }
}

// Create a list of expected minted NFTs based on a base reference and count
fn create_expected_minted_nfts(
  base: ByteArray,
  counter: Int,
  accum: List<ByteArray>,
) -> List<ByteArray> {
  if counter == 0 {
    accum
  } else {
    // Create a unique token name using Blake2b hashing
    let token_name = blake2b_256(bytearray.push(base, counter))

    let accum =
      [token_name, ..accum]

    create_expected_minted_nfts(base, counter - 1, accum)
  }
}
