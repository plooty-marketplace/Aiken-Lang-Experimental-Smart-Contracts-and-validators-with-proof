# proposing_pparams

Write validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.

# Proof


<img width="1740" alt="Screenshot 2024-11-03 at 8 03 40 AM" src="https://github.com/user-attachments/assets/2aebe876-c363-45f8-9e8f-90322c8b6913">
<img width="717" alt="Screenshot 2024-11-03 at 8 02 54 AM" src="https://github.com/user-attachments/assets/955b6189-c489-4a31-ba48-d00bd122182f">
<img width="1136" alt="Screenshot 2024-11-03 at 8 02 50 AM" src="https://github.com/user-attachments/assets/a71d60fd-6384-4fef-b70d-1976c226e6b8">


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
