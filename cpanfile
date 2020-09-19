requires 'perl', '5.012001';

requires 'List::Util',          '1.55';
requires 'File::Find',          '1.34';
requires 'ExtUtils::Installed', '2.18';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

