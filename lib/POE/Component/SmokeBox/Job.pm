package POE::Component::SmokeBox::Job;

use strict;
use warnings;
use Params::Check qw(check);
use base qw(Object::Accessor);
use vars qw($VERSION $VERBOSE);

$VERSION = '0.28';

sub new {
  my $package = shift;

  my $tmpl = {
	idle    => { allow => qr/^\d+$/, default => 600, },
	timeout => { allow => qr/^\d+$/, default => 3600, },
	type    => { defined => 1, default => 'CPANPLUS::YACSmoke', },
	command => { allow => [ qw(check index smoke) ], default => 'check', },
	module  => { defined => 1 },
  };

  my $args = check( $tmpl, { @_ }, 1 ) or return;
  if ( $args->{command} eq 'smoke' and !$args->{module} ) {
     warn "${package}::new expects 'module' to be set when command is 'smoke'";
     return;
  }
  my $self = bless { }, $package;
  my $accessor_map = {
	idle    => qr/^\d+$/,
	timeout => qr/^\d+$/,
	type    => sub { defined $_[0]; },
	command => [ qw(check index smoke) ],
	module  => sub { defined $_[0]; },
	id	=> sub { defined $_[0]; },
  };
  $self->mk_accessors( $accessor_map );
  $self->$_( $args->{$_} ) for keys %{ $args };
  return $self;
}

sub dump_data {
  my $self = shift;
  my @returns = qw(idle timeout type command);
  push @returns, 'module' if $self->command() eq 'smoke';
  return map { ( $_ => $self->$_ ) } @returns;
}

1;
__END__

=head1 NAME

POE::Component::SmokeBox::Job - Object defining a SmokeBox job.

=head1 SYNOPSIS

  use POE::Component::SmokeBox::Job;

  my $job = POE::Component::SmokeBox::Job->new(
	type    => 'CPANPLUS::YACSmoke',
	command => 'smoke',
	module  => 'B/BI/BINGOS/Acme-POE-Acronym-Generator-1.14.tar.gz',
  );

=head1 DESCRIPTION

POE::Component::SmokeBox::Job is a class encapsulating L<POE::Component::SmokeBox> jobs.

=head1 CONSTRUCTOR

=over

=item C<new>

Creates a new POE::Component::SmokeBox::Job object. Takes a number of parameters:

  'idle', number of seconds before jobs are killed for idling, default 600;
  'timeout', number of seconds before jobs are killed for excess runtime, default 3600;
  'type', the type of backend to use, default is 'CPANPLUS::YACSmoke';
  'command', the command to run, 'check', 'index' or 'smoke', default is 'check';
  'module', the distribution to smoke, mandatory if command is 'smoke';

=back

=head1 METHODS

Accessor methods are provided via L<Object::Accessor>. 

=over

=item C<idle>

Number of seconds before jobs are killed for idling, default 600.

=item C<timeout>

Number of seconds before jobs are killed for excess runtime, default 3600

=item C<type>

The type of backend to use, default is C<'CPANPLUS::YACSmoke'>.

=item C<command>

The command to run, C<'check'>, C<'index'> or C<'smoke'>, default is C<'check'>.

=item C<module>

The distribution to smoke, mandatory if command is C<'smoke'>.

=item C<dump_data>

Returns all the data contained in the object as a list.

=back

=head1 AUTHOR

Chris C<BinGOs> Williams

=head1 LICENSE

Copyright C<(C)> Chris Williams

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO 

L<POE::Component::SmokeBox>

L<POE::Component::SmokeBox::JobQueue>

L<Object::Accessor>

=cut
