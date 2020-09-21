use strict;
use warnings;

use Test::More 0.98;
use FastGlob qw(glob);

use lib 'lib';    # temporary
use App::findeps;

my @files = &glob('./t/scripts/02/*.pl');
use lib 't/lib';

for my $file (@files) {
    my $done = `./script/findeps -L='t/lib' $file`;
    chomp $done;
    is $done, '', "succeed to scan myLib";
}

done_testing;
