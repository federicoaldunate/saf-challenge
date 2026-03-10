# Sales Tax Receipt Calculator

## Requirements

- Ruby 3+
- Bundler

## Setup

```bash
bundle install
```

## Run

Pass any of the provided input files:

```bash
ruby bin/console inputs/input1.txt
ruby bin/console inputs/input2.txt
ruby bin/console inputs/input3.txt
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

I'm using BigDecimal to handle money, another way of doing it is creating a class named Money to handle that, or/and using integers for cents. This is because BigDecimal will no longer be part of the default gems since Ruby 3.4.0, so after 3.4.0 is not going to be part of the standard library.

## More tests with the help of LLM
With the help of AI I added 2 more test cases (inpput 4 & input 5) and verified them manually.