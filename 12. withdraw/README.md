# withdraw

Write validators in the `validators` folder, and supporting functions in the `lib` folder using `.ak` as a file extension.

<img width="1531" alt="Screenshot 2024-11-04 at 1 16 25 AM" src="https://github.com/user-attachments/assets/8b883d7f-a961-44e3-bfe6-1f3f2470b0fb">
<img width="918" alt="Screenshot 2024-11-04 at 1 16 16 AM" src="https://github.com/user-attachments/assets/06acc354-8e08-4bfe-9e42-0b44d57ac66b">
<img width="1119" alt="Screenshot 2024-11-04 at 1 16 09 AM" src="https://github.com/user-attachments/assets/a96152c6-6c2d-4277-bb96-3d158bb84ee0">



For example, as `validators/always_true.ak`

```gleam
validator {
  fn spend(_datum: Data, _redeemer: Data, _context: Data) -> Bool {
    True
  }
}
```

## Building

```sh
aiken build
```

## Testing

You can write tests in any module using the `test` keyword. For example:

```gleam
test foo() {
  1 + 1 == 2
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
