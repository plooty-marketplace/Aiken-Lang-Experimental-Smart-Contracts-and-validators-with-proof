<img width="1709" alt="Screenshot 2024-11-01 at 5 05 31 AM" src="https://github.com/user-attachments/assets/5673c0bd-6991-49f3-bde4-82d0e00275e0"># mint-list-lock


# install dependency
<img width="1709" alt="Screenshot 2024-11-01 at 5 05 31 AM" src="https://github.com/user-attachments/assets/fb8f2c66-ff99-4582-8d60-2d50f3004b9b">
aiken add aiken-lang/fuzz --version v2

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
