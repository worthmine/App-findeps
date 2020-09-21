use strict;
use warnings;

use Test::More 0.98 tests => 9;
use FastGlob qw(glob);

use lib 'lib';    # temporary
use App::findeps;

my @files = &glob('./t/scripts/01/*.pl');
for my $file (@files) {
    my $done = `./script/findeps $file`;
    chomp $done;
    is $done, 'Dummy', "succeed to detect 'Dummy'";
}

done_testing;
