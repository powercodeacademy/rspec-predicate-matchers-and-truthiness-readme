# RSpec: Predicate Matchers & Truthiness

Welcome to Lesson 13! In this lesson, you'll learn about RSpec's predicate matchers (`be_truthy`, `be_falsey`, `be_nil`, `be_empty`, etc.) and how to use them to write expressive, readable specs. We'll cover what "truthy" and "falsey" mean in Ruby, and show how predicate matchers map to Ruby methods.

---

## What Are Predicate Matchers?

Predicate matchers let you test for common Ruby predicates (methods ending in `?`). RSpec automatically provides matchers like `be_empty`, `be_nil`, `be_truthy`, and `be_falsey`.

```ruby
# /spec/predicate_matchers_spec.rb
RSpec.describe "Predicate Matchers" do

  it "checks for truthiness (including 0 and empty string)" do
    expect(1).to be_truthy
    expect(0).to be_truthy # 0 is truthy in Ruby!
    expect("").to be_truthy # empty string is also truthy!
    expect(nil).to be_falsey
    expect(false).to be_falsey
  end

  it "checks for nil" do
    expect(nil).to be_nil
  end

  it "checks for empty" do
    expect([]).to be_empty
    expect({}).to be_empty
  end
end
```

**Sample Output:**

```shell
Predicate Matchers
  checks for truthiness
  checks for nil
  checks for empty

Finished in 0.01 seconds (files took 0.1 seconds to load)
3 examples, 0 failures
```

---

## More Predicate Matcher Examples

### Checking for even/odd numbers with custom predicate matchers

```ruby
# /spec/custom_predicate_matchers_spec.rb
RSpec.describe "Custom Predicate Matchers" do
  it "checks for even numbers" do
    expect(4).to be_even
    expect(5).not_to be_even
  end

  it "checks for odd numbers" do
    expect(5).to be_odd
    expect(4).not_to be_odd
  end
end
```

**Sample Output:**

```shell
Custom Predicate Matchers
  checks for even numbers
  checks for odd numbers

Finished in 0.01 seconds (files took 0.1 seconds to load)
2 examples, 0 failures
```

---

### Checking for empty strings and arrays (and what doesn't work)

```ruby
# /spec/empty_strings_arrays_spec.rb
RSpec.describe "Empty Strings and Arrays" do
  it "checks for empty string" do
    expect("").to be_empty
    expect("hello").not_to be_empty
  end

  it "checks for empty array" do
    expect([]).to be_empty
    expect([1,2,3]).not_to be_empty
  end

  it "does not work for numbers" do
    expect { expect(0).to be_empty }.to raise_error(NoMethodError)
  end
end
```

**Sample Output:**

```shell
Empty Strings and Arrays
  checks for empty string
  checks for empty array

Finished in 0.01 seconds (files took 0.1 seconds to load)
2 examples, 0 failures
```

---

### Checking for falsey values

```ruby
# /spec/falsey_values_spec.rb
RSpec.describe "Falsey Values" do
  it "checks for false and nil" do
    expect(false).to be_falsey
    expect(nil).to be_falsey
    expect(0).not_to be_falsey
  end
end
```

**Sample Output:**

```shell
Falsey Values
  checks for false and nil

Finished in 0.01 seconds (files took 0.1 seconds to load)
1 example, 0 failures
```

## How Predicate Matchers Work

- `be_truthy` passes for any value except `false` or `nil` (including 0 and "").
- `be_falsey` passes for `false` or `nil`.
- `be_nil` passes only for `nil` (so `false` is not nil, but is falsey).
- `be_empty` passes for empty collections (arrays, hashes, strings), but not for numbers.

**Predicate matcher syntax:**

`be_something` maps to Ruby’s `something?` method. For example, `be_even` calls `even?`, `be_empty` calls `empty?`, and so on. You can use this with any object that defines a predicate method.

## Practice Prompts

1. Write specs using `be_truthy`, `be_falsey`, and `be_nil` for different values (including 0 and "").
2. Write specs using `be_empty` for arrays, hashes, and strings. What happens if you try it on a number?
3. Try using a custom predicate matcher (e.g., `be_even` for numbers).
4. (Challenge) Write a custom class with a predicate method (e.g., `def ready?`) and use `be_ready` in your spec. What happens if you misspell the method?

---

## Predicate Matcher Cheat Sheet

| Matcher         | Ruby Predicate Method | Passes For                | Example Usage                |
|-----------------|----------------------|---------------------------|------------------------------|
| `be_truthy`     | —                    | Anything except `false`/`nil` | `expect(0).to be_truthy`      |
| `be_falsey`     | —                    | `false` or `nil`          | `expect(nil).to be_falsey`    |
| `be_nil`        | `nil?`               | Only `nil`                | `expect(nil).to be_nil`       |
| `be_empty`      | `empty?`             | Empty arrays, hashes, strings | `expect([]).to be_empty`      |
| `be_even`       | `even?`              | Even numbers              | `expect(4).to be_even`        |
| `be_odd`        | `odd?`               | Odd numbers               | `expect(5).to be_odd`         |
| `be_zero`       | `zero?`              | Zero                      | `expect(0).to be_zero`        |
| `be_positive`   | `positive?`          | Positive numbers (Ruby 2.3+) | `expect(1).to be_positive`    |
| `be_negative`   | `negative?`          | Negative numbers (Ruby 2.3+)| `expect(-1).to be_negative`   |

**Note:** `be_something` maps to Ruby’s `something?` method. You can use this with any object that defines a predicate method—including your own custom classes!

**be_nil vs be_falsey:**

- `be_nil` only passes for `nil`.
- `be_falsey` passes for both `nil` and `false`.

---

## Resources

- [RSpec: Predicate Matchers](https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/predicate-matchers)
- [Ruby Guides: Truthy and Falsey](https://www.rubyguides.com/2018/01/true-false-ruby/)
- [Better Specs: Matchers](https://www.betterspecs.org/#expect)
