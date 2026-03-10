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

```
ruby scripts/verify_outputs.rb
Input 1: ✅ PASS
Input 2: ✅ PASS
Input 3: ✅ PASS
```

## Assumptions

- Product type (book, food, medical) is inferred from the item name.
- Prices in the input are shelf prices (pre-tax).
- Tax is rounded up to the nearest $0.05 per the problem spec.
