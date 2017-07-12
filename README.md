# Introducing the execution_checker gem


## Usage

    require 'execution_checker'

    ec = ExecutionChecker.new '/home/james/execution_checker.xml'
    ec.check 'dashboard'

The above example opens the Dynarex file execution_checker.xml, then checks the last modified date for a filepath associated with the tag called *dashboard*. If the last modified date is today's date then an SPS message is published to indicate success.

Here's how I created the Dynarex file for testing the above code:

    require 'dynarex'

    dx = Dynarex.new("entries[title, tags]/entry(tag, filepath, occurrence, success, failure)")

    dx.create tag: 'dashboard', filepath: '/home/james/jamesrobertson.eu/dandelion_s1/yaml/dashboard.yaml'
    dx.create tag: 'run', filepath: 'simple something'
    dx.save '/home/james/execution_checker.xml'

I of course ensured that the *dashboard.yaml* file existed and was last modified today.

## Resources

* execution_checker https://rubygems.org/gems/execution_checker

gem executionchecker execute checker execution
