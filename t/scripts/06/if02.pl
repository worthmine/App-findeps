use strict;
use warnings;

require If::After::Require if 1;    # always true but ignored

require Dummy;                      # does not exist anywhere

exit;
