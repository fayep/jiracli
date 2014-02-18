# Jira

A command line for accessing Jira

## Installation

    rake check_config

    vi config/jira.yml

    rake install

## Usage

    jira comment TICKET
Adds a comment to the ticket you specify by TICKET
    jira feature [TICKET]
List feature tickets
    jira list
Show your tickets
    jira show [--raw]
Show a ticket using your template (from config), or the raw JSON
    jira unassigned
Show unassigned tickets (Great for on-call)
    jira work TICKET
Work on a named ticket (Bring it into the current sprint)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

