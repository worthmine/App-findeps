requires 'perl', '5.10.1';    # dist Trusty does not support 5.8

#requires 'feature';          # and can't install 'feature' pragma

requires 'FastGlob',         '1.5';
requires 'List::Util',       '1.55';
requires 'Module::CoreList', '5.20200920';

on 'test' => sub {
    requires 'Test::More', '1.302181';
};
