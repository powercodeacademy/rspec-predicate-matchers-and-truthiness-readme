
# RSpec: Predicate Matchers & Truthiness (Smart Home Edition)

In this lesson, you'll learn about RSpec's predicate matchers (`be_truthy`, `be_falsey`, `be_nil`, `be_empty`, etc.) and how to use them to write expressive, readable specs. We'll cover what "truthy" and "falsey" mean in Ruby, and show how predicate matchers map to Ruby methods—all using a Smart Home Devices domain (Light, Thermostat, DoorLock) for hands-on practice.

---

## What Are Predicate Matchers?

Predicate matchers are a powerful feature in RSpec that let you write expressive, natural-language tests for Ruby methods that end in a question mark (`?`). These methods, called predicate methods, return a boolean value (`true` or `false`) and are commonly used in Ruby to check the state or property of an object. For example, `empty?`, `nil?`, `even?`, and custom methods like `on?` or `locked?`.

RSpec automatically creates special matchers for any predicate method, allowing you to write expectations like `expect(array).to be_empty` instead of `expect(array.empty?).to be true`. This makes your specs more readable and closely aligned with how you would describe the behavior in plain English.

Some of the most common built-in predicate matchers include `be_empty`, `be_nil`, `be_truthy`, and `be_falsey`. You can also use predicate matchers with your own custom classes, as long as they define methods ending in `?`.

Predicate matchers are useful because they:

- Make your tests more readable and intention-revealing.
- Reduce the need to call predicate methods directly in your specs.
- Work seamlessly with both built-in Ruby predicates and your own custom predicates.

Here's an example using the `Light` class:

```ruby
# /spec/light_spec.rb
RSpec.describe Light do
  let(:light) { Light.new }

  it "is off by default" do
    expect(light.on?).to be_falsey
    expect(light).not_to be_on
  end

  it "can be turned on" do
    light.turn_on
    expect(light.on?).to be_truthy
    expect(light).to be_on
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

### Checking for custom predicate matchers on your own classes

One of the most powerful features of RSpec's predicate matchers is that they work not only with Ruby's built-in predicate methods, but also with any custom predicate methods you define in your own classes. As long as your method ends with a question mark (e.g., `locked?`), RSpec will automatically create a corresponding matcher (e.g., `be_locked`).

This means you don't have to write any extra code or configuration to get this behavior—RSpec will look for a method named `locked?` on your object when you use `be_locked` in your spec. This makes your tests more expressive and closely matches how you would describe the behavior in plain English.

In the example below, the `DoorLock` class defines a `locked?` method. RSpec lets you write both `expect(lock.locked?).to be_truthy` (which checks the return value directly) and the more natural `expect(lock).to be_locked` (which calls `locked?` for you under the hood):

```ruby
# /spec/door_lock_spec.rb
RSpec.describe DoorLock do
  let(:lock) { DoorLock.new }

  it "is locked by default" do
    expect(lock.locked?).to be_truthy
    expect(lock).to be_locked
  end

  it "can be unlocked" do
    lock.unlock
    expect(lock.locked?).to be_falsey
    expect(lock).not_to be_locked
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

### Checking for empty arrays (e.g., no devices on)

```ruby
# /spec/smart_home_integration_spec.rb
RSpec.describe "Smart Home Integration" do
  it "checks for empty array of active devices" do
    active_devices = []
    expect(active_devices).to be_empty
    active_devices << Light.new
    expect(active_devices).not_to be_empty
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

### Checking for falsey values in device states

```ruby
# /spec/thermostat_spec.rb
RSpec.describe Thermostat do
  let(:thermostat) { Thermostat.new }

  it "is not heating by default" do
    expect(thermostat.heating?).to be_falsey
    expect(thermostat).not_to be_heating
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

**Note:** `be_something` automatically maps to Ruby’s `something?` method. You can use this with any object that defines a predicate method—including your own custom classes!

**be_nil vs be_falsey:**

- `be_nil` only passes for `nil`.
- `be_falsey` passes for both `nil` and `false`.

---

## Getting Hands-On

Ready to practice? Here’s how to get started:

1. **Fork and clone this repo to your own GitHub account.**
2. **Install dependencies:**

    ```zsh
    bundle install
    ```

3. **Run the specs:**

    ```zsh
    bin/rspec
    ```

4. **Explore the code:**

   - All lesson code uses the Smart Home Devices domain (see `lib/` and `spec/`).
   - Review the examples for predicate matchers and truthiness.

5. **Implement the pending specs:**

   - Open `spec/smart_home_integration_spec.rb` and look for specs marked as `pending`.
   - Implement the real methods in the device classes (`lib/light.rb`, `lib/thermostat.rb`, etc.) as needed so the pending specs pass.

6. **Re-run the specs** to verify your changes!

**Challenge:** Try writing your own spec for a new predicate method on a smart home device (e.g., `dimmed?` for Light, `cooling?` for Thermostat) and use the corresponding matcher in your spec.

---

## Resources

- [RSpec: Predicate Matchers](https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/predicate-matchers)
- [Ruby Guides: Truthy and Falsey](https://www.rubyguides.com/2018/01/true-false-ruby/)
- [Better Specs: Matchers](https://www.betterspecs.org/#expect)
