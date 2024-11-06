# aiken-mint-validator
<img width="1717" alt="Screenshot 2024-11-01 at 5 10 10 AM" src="https://github.com/user-attachments/assets/860ddc9a-c52e-4700-941f-62453877b3c1">
<img width="1231" alt="Screenshot 2024-11-01 at 5 10 51 AM" src="https://github.com/user-attachments/assets/8615a075-1228-4e81-8278-db3ddf5bc632">
<img width="767" alt="Screenshot 2024-11-01 at 5 10 45 AM" src="https://github.com/user-attachments/assets/10efceaf-8a9a-4e3e-9a0d-48843839362c">

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
# fuzz install
...
aiken add aiken-lang/fuzz --version v2

...
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
