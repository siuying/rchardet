# rCharDet

### [Project Page](http://rubyforge.org/projects/rchardet) | [1.9 Author](https://github.com/edouard/rchardet) | [Original Author](https://github.com/jmhodges/rchardet)

rCharDet is a character encoding detection library for ruby and the implementation is based
on Mozilla Charset Detectors. 

This is a forked project in a effort to make it Ruby 1.9 compatible

### How do use
    
    require 'rubygems'
    require 'rchardet19'

    >> cd = CharDet.detect("some data")
    => #<struct #<Class:0x102216198> encoding="ascii", confidence=1.0>

### How to use - in real life

`detect` takes the variable `data` that contains an unknown encoding.

We then try to change the encoding to UTF-8, but only if we are at least ~ 60% sure that we found the right encoding.

    data = "Some unknown data"
    cd = CharDet.detect(data)
    data = cd.confidence > 0.6 ? Iconv.conv(cd.encoding, "UTF-8", data) : data
    
### What do I've to work with?

A struct is being returned from the `detect` method and has the following accessors.

- **encoding** (String) Encoding of the ingoing string, `UTF-8` for example.
- **confidence** (Float) The confidence level of the *encoding*, from 0.0 to 1.0, where 1.0 is the best.

### Make it silent

The `detect` takes two arguments, the string to guess the encoding on and an option hash.

You can use the option hash de decide if you want the `detect` method to raise an exception or not if the ingoing string is `nil`.

    >> CharDet.detect("some data", :silent => true) # Won't raise an exception
    >> CharDet.detect(nil, :silent => true)         # Won't raise an exception
    >> CharDet.detect(nil)                          # Will raise an exception
    >> CharDet.detect(nil, :silent => false)        # Will raise an exception
    
### How do install

    [sudo] gem install rchardet19