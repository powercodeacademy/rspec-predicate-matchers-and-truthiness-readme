
# RSpec: Predicate Matchers & Truthiness (Smart Home Edition)

In this lesson, you'll learn about RSpec's predicate matchers (`be_truthy`, `be_falsey`, `be_nil`, `be_empty`, etc.) and how to use them to write expressive, readable specs. We'll cover what "truthy" and "falsey" mean in Ruby, and show how predicate matchers map to Ruby methods—all using a Smart Home Devices domain (Light, Thermostat, DoorLock) for hands-on practice.

---

## What Are Predicate Matchers?

Predicate matchers let you test for common Ruby predicates (methods ending in `?`). RSpec automatically provides matchers like `be_empty`, `be_nil`, `be_truthy`, and `be_falsey`.

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

---

## More Predicate Matcher Examples

### Checking for custom predicate matchers on your own classes

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

**Note:** `be_something` maps to Ruby’s `something?` method. You can use this with any object that defines a predicate method—including your own custom classes!

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
