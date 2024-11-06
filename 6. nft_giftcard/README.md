# nft_giftcard

Write validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.
# proof

<img width="1734" alt="Screenshot 2024-11-03 at 7 17 29 AM" src="https://github.com/user-attachments/assets/e64915c9-2851-453d-9879-c8b0439c3914">



```aiken
validator my_first_validator {
  spend(_datum: Option<Data>, _redeemer: Data, _output_reference: Data, _context: Data) {
    True
  }
}
```
<img width="1051" alt="Screenshot 2024-11-03 at 7 18 24 AM" src="https://github.com/user-attachments/assets/2a0c61ac-9859-4a11-9539-8953e4f4a22b">
<img width="833" alt="Screenshot 2024-11-03 at 7 18 18 AM" src="https://github.com/user-attachments/assets/3bcc42ed-72c8-4884-8909-fb7762b3adbd">
<img width="1051" alt="Screenshot 2024-11-03 at 7 18 24 AM" src="https://github.com/user-attachments/assets/62898939-7c8f-45ba-a5ea-4ae5eed9c794">

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
