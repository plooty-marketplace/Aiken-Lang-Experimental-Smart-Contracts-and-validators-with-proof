# voting

Write validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.

# proof

<img width="1188" alt="Screenshot 2024-11-03 at 8 28 24 AM" src="https://github.com/user-attachments/assets/189b490f-3db9-44b9-b458-c7c7c0cd529f">
<img width="1710" alt="Screenshot 2024-11-03 at 8 24 32 AM" src="https://github.com/user-attachments/assets/a06f22d4-d0c1-4c71-901e-6de4d8c565da">



```aiken
validator my_first_validator {
  spend(_datum: Option<Data>, _redeemer: Data, _output_reference: Data, _context: Data) {
    True
  }
}
```

## Building

```sh
aiken build<img width="823" alt="Screenshot 2024-11-03 at 8 28 35 AM"/
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
