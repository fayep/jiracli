# Jira

A command line for accessing Jira

## Installation

    rake check_config
    vi config/jira.yml
    rake install
    jira...

You may want to bundle instead:

    vi config/jira.yml
    bundle install
    bundle exec jira...

## Usage

    jira comment TICKET
Adds a comment to the ticket you specify by TICKET

    jira feature [TICKET]
List feature tickets

    jira list
Show your tickets

    jira show [--raw] TICKET
Show a ticket using your template (from config), or the raw JSON

    jira lastcomment TICKET [--raw]
    jira lastcomment TICKET num_comments [--raw]
Show a ticket (1 or num_comments) using your template (from config), or the raw JSON

    jira unassigned
Show unassigned tickets (Great for on-call)

    jira work TICKET
Work on a named ticket (Bring it into the current sprint)

## Troubleshooting

If you get a certificate error, it's likely that the URLS are incorrect or you don't have a valid certificate on your server.  If you edited your configuration make sure that you reinstall.

Please report any gems which I have missed out and which cause you errors when running.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

