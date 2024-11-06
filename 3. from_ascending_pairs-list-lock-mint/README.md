# from_ascending_pairs-list-lock-mint
# Proof


<img width="1739" alt="Screenshot 2024-11-01 at 5 55 53 PM" src="https://github.com/user-attachments/assets/46f95c67-01d2-47c6-ad52-50822e896f61">

<img width="690" alt="Screenshot 2024-11-01 at 6 02 54 PM" src="https://github.com/user-attachments/assets/f5ca739c-6a76-4d50-be6b-eab6ef04ee05">
<img width="677" alt="Screenshot 2024-11-01 at 6 02 26 PM" src="https://github.com/user-attachments/assets/358c06b5-ab91-43e3-adf9-316dac6a7983">




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
