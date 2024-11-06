# certificate

Write validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.

# proof
<img width="1067" alt="Screenshot 2024-11-03 at 7 41 16 AM" src="https://github.com/user-attachments/assets/071d4163-4f29-45aa-8430-c4228918a9d7">
<img width="1698" alt="Screenshot 2024-11-03 at 7 39 48 AM" src="https://github.com/user-attachments/assets/a58b2e43-d8f1-46e5-bfeb-4405763a4a5d">

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
