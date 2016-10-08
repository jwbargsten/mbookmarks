# mbookmarks

Maildir-based bookmarking.

Until now I was not able to find a flexible bookmarking solution that is
working on the commandline and synchronisable with git. I therefore wrote this
script to create a maildir and save my bookmarks as mails. The saved bookmarks
can then be accessed by any email client supporting maildir. Examples are
mutt/neomutt or Thunderbird.

## Requirements

`mbm` is a Perl script. It uses

* `Mail::Box`
* `HTML::FormatText`
* `LwP`
* `URI`
* `Sys::Hostname`
* `Getopt::Long`
* `Pod::Usage`

## Usage

Add a bookmark

    mbm add https://github.com/jwbargsten/mbookmarks
    mbm a https://github.com/jwbargsten/mbookmarks
    mbm a --note 'cool repo' --tag perl --tag apps https://github.com/jwbargsten/mbookmarks

Execute git commands in the mbm repo (`~/.mbookmarks`)

    mbm git ...
    mbm g ...
