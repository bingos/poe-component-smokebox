use strict;
use inc::Module::Install;
name 'POE-Component-SmokeBox';
author 'Chris Williams <chris@bingosnet.co.uk>';
license 'perl';
auto_license holder => 'Chris Williams';
perl_version '5.006';
abstract_from 'lib/POE/Component/SmokeBox.pm';
version_from 'lib/POE/Component/SmokeBox.pm';
build_requires 'Test::Harness' => 3.14;
build_requires 'Test::More' => 0.47;
requires 'File::Spec' => 0;
requires 'File::Temp' => 0;
requires 'File::Path' => 0;
requires 'SDBM_File'  => 0;
requires 'POE' => 1.0001;
requires 'Module::Pluggable' => 0;
requires 'Params::Check' => 0;
requires 'Object::Accessor' => 0;
requires 'Digest::SHA' => 0;
requires 'Env::Sanctify' => 0.04;
requires 'String::Perl::Warnings' => 0.04;
makemaker_args(dist => { PREOP => "$^X ./tools/git-log.pl > ./Changes" });
githubmeta;
unless ( win32 ) {
  if ( ! can_use 'IO::Pty' ) {
    requires 'IO::Pty' => 0 if
       prompt( 'Do you want to install IO::Pty, it is highly recommended that you do [Y/n]?', 'Y' )
         =~ /^Y/i;
  }
  else {
     warn "You already have IO::Pty installed, excellent.\n";
  }
}
else {
  requires 'POE::Wheel::Run::Win32' => 0.10;
  requires 'Win32API::File' => 0;
}

tests 't/*.t t/*/*.t';
WriteAll();
