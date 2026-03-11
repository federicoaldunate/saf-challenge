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

## Architecture

- **Service objects** handle all business logic (`InterpreterService`, `CalculateTaxService`, etc.), keeping models as plain data containers.
- **Tax rules** (`Taxes::BasicSalesTax`, `Taxes::ImportedDutyTax`) are isolated classes. Adding a new tax type means adding a new class and registering it in `CalculateTaxService::TAX_RULES` — no existing code needs to change.
- **Composition over inheritance** throughout. No class inherits behaviour from another. SOLID principles are applied: each class has a single responsibility (SRP), tax rules are open for extension without modifying existing code (OCP), and all tax rule classes are interchangeable because they honour the same interface (LSP).

## Assumptions

- Product type (book, food, medical) is inferred from the item name.
- Prices in the input are shelf prices (pre-tax).
- Tax is rounded up to the nearest $0.05 per the problem spec.

## Notes

`BigDecimal` is used for all money arithmetic to avoid floating-point precision errors. Since it is part of Ruby's standard library, it does not violate the constraint against external libraries.

An alternative approach would be to represent money as integer cents, or to introduce a dedicated `Money` value object to encapsulate operations and formatting. The current solution assumes USD (2 decimal places). Note that some currencies use 4 decimal places and others have no decimals at all.

Worth noting: from Ruby 3.4.0 onwards, `BigDecimal` is no longer a default gem and must be added explicitly to the `Gemfile`. This has been done to remain compliant with the requirement of not using external libraries for the core solution.

## Additional test cases

Two extra test cases (input 4 & input 5) were added to improve coverage and verified manually against the tax rules.