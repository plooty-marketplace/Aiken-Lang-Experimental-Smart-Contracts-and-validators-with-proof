# get_first
aiken stdlib 2.0

proof:


Wr<img width="626" alt="Screenshot 2024-11-02 at 5 45 54 AM" src="https://github.com/user-attachments/assets/601ee194-0284-4965-8c7a-04cacaae8748">
<img width="1078" alt="Screenshot 2024-11-02 at 5 45 19 AM" src="https://github.com/user-attachments/assets/f9df1538-baf9-4bd3-adcd-8017555e4358">
<img width="1757" alt="Screenshot 2024-11-02 at 5 43 56 AM" src="https://github.com/user-attachments/assets/23a4545e-d7e4-4b33-81d1-71bd4dff9e55">
ite validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.

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
