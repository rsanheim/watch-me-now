# watch-me-now

## Stupid Simple Continuous Testing

A small script that builds on [watchr](http://github.com/mynyml/watchr) to try and continuously test any sort of Ruby project.  Works with rspec (`*_spec.rb`), test unit and its spin-off (`*_test.rb`), and micronaut (`*_example.rb`).

## Usage

    gem install watch-me-now
    cd YOUR_PROJECT
    watch-me-now
    
## Supported

* ruby libraries
* rubygems (anything with /lib and a top level test folder, basically)

## TODO

* Rails projects of different shapes and sizes
* Cucumber features
* Toggle spork via command line switch?