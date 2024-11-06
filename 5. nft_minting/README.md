# nft_minting
# NFT_Minting Description


This code provides a foundational structure for NFT minting and swapping in Aiken, with a sorting utility included. For a complete solution, you'd need to fill in the ownership verification logic in the `swap` function and implement the necessary error handling and transaction management according to your marketplace requirements. If you need more help with a specific aspect or further enhancements.
proof:


<img width="1897" alt="Screenshot 2024-11-02 at 3 41 45 AM" src="https://github.com/user-attachments/assets/30938c9b-e12f-40dd-8252-59e0024c64f1">
<img width="1304" alt="Screenshot 2024-11-02 at 3 38 04 AM" src="https://github.com/user-attachments/assets/2649b9dc-cbb0-4ead-8f70-801549567256">
<img width="864" alt="Screenshot 2024-11-02 at 3 37 58 AM" src="https://github.com/user-attachments/assets/21684450-7764-42d8-acd3-2453cdc0be89">

Write validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.

```aiken
validator my_first_validator {
  spend(_datum: Option<Data>, _redeemer: Data, _output_reference: Data, _context: Data) {
    True
  }
}
```

## Building

```sh
aiken build
```

## Configuring

**aiken.toml**
```toml
[config.default]
network_id = 41
```

Or, alternatively, write conditional environment modules under `env`.

## Testing

You can write tests in any module using the `test` keyword. For example:

```aiken
use config

test foo() {
  config.network_id + 1 == 42
}
```

To run all tests, simply do:

```sh
aiken check
```

To run only tests matching the string `foo`, do:

```sh
aiken check -m foo
```

## Documentation

If you're writing a library, you might want to generate an HTML documentation for it.

Use:

```sh
aiken docs
```

## Resources

Find more on the [Aiken's user manual](https://aiken-lang.org).
