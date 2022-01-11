use strict;
use warnings;

use Test::More 0.98 tests => 25;
use Directory::Iterator;

my $list = Directory::Iterator->new('t/scripts');
while ( $list->next ) {
    my $file = $list->get;
    like qx"prove $file 2>&1",
        qr/^(?:Can't locate Dummy|Base class package "Dummy" is empty.)/,
        "$file failed as expected";
}

done_testing;
