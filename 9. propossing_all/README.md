# propossing_all

Write validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.
# proof


<img width="655" alt="Screenshot 2024-11-03 at 7 54 35 AM" src="https://github.com/user-attachments/assets/bd72e6fe-13a5-4430-b5da-6443fb3f3864">
<img width="1041" alt="Screenshot 2024-11-03 at 7 54 29 AM" src="https://github.com/user-attachments/assets/8a41afc8-d6d1-42ff-aa62-b9cd75329695">
<img width="1706" alt="Screenshot 2024-11-03 at 7 52 41 AM" src="https://github.com/user-attachments/assets/98352f2d-0e3e-48cb-a8c3-808e7662c347">



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
