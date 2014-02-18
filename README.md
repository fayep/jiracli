# Jira

A command line for accessing Jira

## Installation

    rake check_config

    vi config/jira.yml

    rake install

## Usage

    jira comment TICKET    # comment on a named ticket
    jira feature [TICKET]  # list feature tickets
    jira help [TASK]       # Describe available tasks or one specific task
    jira list              # show your tickets
    jira show              # show a named ticket
    jira unassigned        # show unassigned tickets
    jira version           # show jira version
    jira work TICKET       # work on a named ticket


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

