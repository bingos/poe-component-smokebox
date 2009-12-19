package POE::Component::SmokeBox::Result;

use strict;
use warnings;
use vars qw($VERSION);

$VERSION = '0.32';

sub new {
  my $package = shift;
  return bless [ ], $package;
}

sub add_result {
  my $self = shift;
  my $result = shift || return;
  return unless ref $result eq 'HASH';
  push @{ $self }, $result;
}

sub results {
  return @{ $_[0] };
}

1;
__END__

=head1 NAME

POE::Component::SmokeBox::Result - object defining SmokeBox job results.

=head1 DESCRIPTION

POE::Component::SmokeBox::Result is a class encapsulating the job results that are returned by 
L<POE::Component::SmokeBox::Backend> and L<POE::Component::SmokeBox>.

=head1 CONSTRUCTOR

=over

=item C<new>

Creates a new POE::Component::SmokeBox::Result object.

=back

=head1 METHODS

=over

=item C<add_result>

Expects one argument, a hashref, representing a job result.

=item C<results>

Returns a list of hashrefs representing job results.

=back

=head1 AUTHOR

Chris C<BinGOs> Williams

=head1 LICENSE

Copyright C<(C)> Chris Williams

This module may be used, modified, and distributed under the same terms as Perl itself. Please see the license that came with your Perl distribution for details.

=head1 SEE ALSO

L<POE::Component::SmokeBox>

L<POE::Component::SmokeBox::Backend>

L<POE::Component::SmokeBox::JobQueue>

=cut
