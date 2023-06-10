[![Gem Version](https://badge.fury.io/rb/htk.svg)](https://badge.fury.io/rb/htk)

# HTK for Ruby

A set of convenience utils for Ruby. An inspired, close-to-feature-parity port of [`python-htk-lite`](https://github.com/hacktoolkit/python-htk-lite).

# Features

1. Debug via Slack using `::Htk::Utils.slack_debug('some debugging message')`. The best of `println` debugging, without the inconvenience of visually fishing for one message out of thousands of log lines.
1. Debug via writing to local file using `fdebug` (`::Htk::Utils.fdebug('some debugging message')`) and `fdebug_json` (`::Htk::Utils.fdebug_json(some_object)`). Certifiably awesome, fast, and secure.

# How to Use This Awesome?

## Installation

1. Install via Ruby Gems: `gem install htk`
1. (**Alternative install via clone**) Install via local clone: Clone this repository into a directory named `htk` (preferred) or `htk_lite`  
    SSH: `git clone git@github.com:hacktoolkit/htk-rb.git htk`  
    HTTPS: `git clone https://github.com/hacktoolkit/htk-rb.git`
1. (Optional) Create a symlink to `htk` inside of your app's `lib/` directory.
1. Create `local_settings.rb` and add your [Slack incoming webhook](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks) URL to `SLACK_WEBHOOK_URL`.

### Tips on Location of HTK Module 

1. You can place it outside of your app directory tree, and then symlink it inside.
1. To not be nagged by the presence of the `htk` directory whenever you do `git status`, add `htk` to your `.git/info/exclude` file (like `.gitignore`, but only in your local repository, not checked in).

## Slack Debug

1. In your code, simply do:
    ```
    ::Htk::Utils.slack_debug('This is seriously awesome!')
    ::Htk::Utils.slack_debug('Yeah, no kidding.')
    ```
1. Check your Slack to verify that the message was posted. If not, perhaps your token was wrong, or the Slack integration was disabled.
    ![image](https://user-images.githubusercontent.com/422501/61013274-e65e1e00-a336-11e9-90aa-44a6fd1e217c.png)  
    (Alternative link to screenshot above: https://cl.ly/436cfb4383a2)
1. Profit!

## FDebug (FDB)

1. (**Recommended**) Create a BASH alias or similar: `alias fdb='touch /tmp/fdebug.log; tail -f /tmp/fdebug.log'`
    1. In a separate window used for debugging, run `fdb` to watch the logs roll in.
1. ::Htk::Utils.slack_debug('Not all heroes wear capes')

# See Also

- C# - https://github.com/hacktoolkit/csharp-htk
- PHP - https://github.com/hacktoolkit/php-htk
- Python (full) - https://github.com/hacktoolkit/python-htk
- Python (lite) - https://github.com/hacktoolkit/python-htk-lite
- Ruby - https://github.com/hacktoolkit/htk-rb

# Authors and Maintainers

- [Hacktoolkit](https://github.com/hacktoolkit)
- [Jonathan Tsai](https://github.com/jontsai)
- [Gökhan Öztürk](https://github.com/Quanthir)

# License

MIT. See `LICENSE.md`
