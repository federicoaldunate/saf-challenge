# Sales Tax Receipt Calculator

## Requirements

- Ruby 3+
- Bundler

## Setup

```bash
bundle install
```

```bash
chmod +x bin/console
```

## Run

There are 2 ways of running this

### Using input files

Pass any of the provided input files:

```bash
ruby bin/console inputs/input1.txt
ruby bin/console inputs/input2.txt
ruby bin/console inputs/input3.txt
```

### Using standard input

With 2 empty lines the program will execute its calculations and return the values
```bash
ruby bin/console
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85


2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

## Test

```bash
bundle exec rspec
```

## Assumptions

- Product type (book, food, medical) is inferred from the item name.
- Prices in the input are shelf prices (pre-tax).
- Tax is rounded up to the nearest $0.05 per the problem spec.

## Notes

I'm using BigDecimal to handle money, another way of doing it is creating a class named Money to handle that, or/and using integers as cents. This is because BigDecimal will no longer be part of the default gems since Ruby 3.4.0, so after 3.4.0 is not going to be part of the standard library.

## More tests with the help of LLM
With the help of AI I added 2 more test cases (inpput 4 & input 5) and verified them manually.