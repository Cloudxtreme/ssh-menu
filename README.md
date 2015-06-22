# ssh-menu

This simple Ruby program prints a menu on your console with ssh servers you can connect to.
Of course, after a while your shell history knows all your servers, but if there are too many of them a short 
description for each can make your choice a lot easier.

#### Sample session
```
you@yourbox: ~ $ ./connect.rb
1) user@host1.com   development server
2) user@host2.com   QA test
Pick a server (or ctrl-c to quit): 1
Connecting to user@host1.com
Last login: Fri Jun  5 13:42:41 2015 from anotherbox
user@host1: ~ $ do some work
user@host1: ~ $ logout
Connection to user@host1.com closed.
```

#### Tested with Ruby 1.9.3
```
you@yourbox: ~ $ ruby -v
ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]
```

#### Configuration

Since this script is intended to be as simple as possible, the configuration is done within the script. Just change the entries in the `$connections` hash.
```
$connections = [
    {"user@host1.com" => "development server"},
    {"user@host2.com" => "QA test"}
  ]
```
