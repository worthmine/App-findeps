requires 'perl', '5.8.8';    # dist Trusty does not support 5.8
requires 'feature';          # feature was first released with perl v5.9.3

requires 'FastGlob',         '1.5';
requires 'List::Util',       '1.55';
requires 'Module::CoreList', '5.20200920';

on 'test' => sub {
    requires 'Test::More', '1.302181';
};
