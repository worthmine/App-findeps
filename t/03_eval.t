use strict;
use warnings;

use Test::More 0.98 tests => 2;
use FastGlob qw(glob);

my @files = &glob('./t/scripts/03/*.pl');
for my $file (@files) {
    my $done = qx"$^X ./script/findeps $file";
    chomp $done;
    is $done, '', "succeed to ignore 'Dummy'";
}

done_testing;
