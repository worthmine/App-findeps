use strict;
use warnings;

# the all iside of nested if sholud NOT to be parsed

if (1) {
    require Require::With::If;    # braced
}

if (1) {    # comment
    require Require::With::If::Commented;    # double braced
}    # comment

if (1) {    # first
    if (1) {    # second
        if (1) {    # third
            require Require::With::Nested::If;    # triple braced
        }
    }
}

require Dummy;                                    # does not exist anywhere

exit;
