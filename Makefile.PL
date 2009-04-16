use strict;
use inc::Module::Install;
#my $RUNNING_IN_HELL = $^O eq 'MSWin32' ? 1 : 0;
name 'POE-Component-SmokeBox';
author 'Chris Williams <chris@bingosnet.co.uk>';
license 'perl';
perl_version '5.006';
abstract_from 'lib/POE/Component/SmokeBox.pm';
version_from 'lib/POE/Component/SmokeBox.pm';
build_requires 'Test::Harness' => 3.14;
build_requires 'Test::More' => 0.47;
build_requires 'File::Spec' => 0;
requires 'POE' => 1.0001;
requires 'POE::Wheel::Run::Win32' => 0.10 if win32; #$RUNNING_IN_HELL;
requires 'Module::Pluggable' => 0;
requires 'Params::Check' => 0;
requires 'Object::Accessor' => 0;
requires 'Digest::MD5' => 0;
requires 'Env::Sanctify' => 0.04;
requires 'String::Perl::Warnings' => 0.04;

unless ( can_use 'IO::Pty' and not win32 ) {
    requires 'IO::Pty' => 0 if
       prompt( 'Do you want to install IO::Pty, it is highly recommended that you do [Y/n]?', 'Y' )
         =~ /^Y/i;
}
else {
     warn "You already have IO::Pty installed, excellent.\n" unless win32; #$RUNNING_IN_HELL;
}

tests 't/*.t t/*/*.t';

print <<NOTICE;

\a--------------------------------------------------------------
Hi,

This is an early release of POE::Component::SmokeBox.

Thanks for your interest.

There may still be stuff wrong with it, but it should be
usable. Enjoy.

Any bug reports, feature requests, send an email to 
<bug-POE-Component-SmokeBox\@rt.cpan.org>

--------------------------------------------------------------

NOTICE

sleep(5);
eval "auto_set_repository";
WriteAll();
