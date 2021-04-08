# Glen Learns Rust
Yay Rust! Let's learn rust.

## Setting up Rust
Got Debian on a VM, then:
  # apt install curl build-essential
  --> and some others for maybe other reasons: vim git open-vm-tools
And ran the rustup install:
  $ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

Most of my issues were with setting up the dang VM...

### cargo
```
$ cargo new project_name
$ cargo check
  - for syntax checking, no executable gets compiled
$ cargo build
  - compiles
$ cargo run
  - compiles and then builds
$ cargo build --release
  - the optimized compile, takes longer to compile, but binary's execution is optimized
```
cargo compiles things to the "target/debug" or "target/release" dirs
- you can set this env var as well: `CARGO_TARGET_DIR`
- seems to work when I set this to /tmp/ (cargo was complaining because my shared vm dir wasn't allowing it to create hard links)
- but the downside to setting this to /tmp/ is that every cargo project builds into these dirs... so I imagine weirdness can happen if this doesn't get cleaned upgit sta

## statements vs expressions
Oh my gosh this is wild...

Rust is "expression-based"
* statements => instructions that perform an action, do not return a value
* expressions => evaluate to a resulting value

```
# this here is a statement... it ends with a semicolon
let x = 5;

# but check this block! overall, this block is an expression
{
  let x = 3; //this here is a statement
  x + 1 //NO SEMICOLON... so this is the evaluation that returns the value
}
```

if's are expressions...
else's are expressions...

and we can use code like this...
```
let condition = true;                           //a statement
let number = if condition { 5 } else { 100 };   //statement that assigns result of the `if` expression to variable `number`
println!("The value of number is: {}", number); //result here would be 5
```

lol functions are expressions too, so this totally works! blocks of code evaluate to the last expression in them...
```
fn fiver() -> i32 { 5 } // these functions consist of a single expression...
fn sixer() -> i32 { 6 } // ...note the lack of semicolon!
fn main() {
  let condition = true;
  let number = if condition { fiver() } else { sixer() }; // so number gets assigned whatever function's evaluation
  println!("The value of number is: {}", number);
}
```

## Rust syntax
### the really important stuff
```
// if / else if / else
if number % 4 == 0 {
    println!("number is divisible by 4");
} else if number % 3 == 0 {
    println!("number is divisible by 3");
} else if number % 2 == 0 {
    println!("number is divisible by 2");
} else {
    println!("number is not divisible by 4, 3, or 2");
}
```

### some less-important stuff
```
# sleep for 1 second...
use std::time::Duration;
use std::thread;
fn wait() {
  let wait_time = Duration::from_secs(1);
  thread::sleep(wait_time);
}
```