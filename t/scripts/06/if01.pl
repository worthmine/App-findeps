use strict;
use warnings;

if (1) { require If::Before::Require }    # always true but ignored

require Dummy;                            # does not exist anywhere

exit;
