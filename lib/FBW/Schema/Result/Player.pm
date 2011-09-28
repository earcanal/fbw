package FBW::Schema::Result::Player;
use Moose;
extends qw/DBIx::Class::Core/;

# Mixing Moose/DBIC example
# http://code2.0beta.co.uk/reaction/svn/Reaction/0.001/trunk/t/lib/RTest/TestDB/Foo.pm

#my $meta = __PACKAGE__->meta;
#for my $attr ( $meta->get_all_attributes ) {
#      print $attr->name, "\n";
#  }

has 'id'     => (is => 'ro', isa => 'Int');
has 'number' => (is => 'ro', isa => 'Int');
has 'name'   => (is => 'rw', isa => 'String');
has 'aka'    => (
		 isa    => 'Array',
		 reader => 'get_aka',
		 writer => 'set_aka'
		 );

__PACKAGE__->table('player');
__PACKAGE__->add_columns(qw/id number name/);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(aka => 'FBW::Schema::Result::Aka',
		      {'foreign.playerid' => 'self.id'});
__PACKAGE__->has_many(team => 'FBW::Schema::Result::TeamPlayer',
		      {'foreign.player_id' => 'self.id'});
__PACKAGE__->many_to_many(teams => 'team','team');
__PACKAGE__->has_many(stat => 'FBW::Schema::Result::Stat',
		      {'foreign.player_id' => 'self.id'});

around 'get_aka' => sub { $_[1]->search_related('aka')->all };

sub manager {
  my($self,$f) = @_;
  my @r = $self->stat->search({fixture_id=>$f->id,stat_type_id=>2});
  return $r[0] ? 1 : 0;
}

=head2 goals($fixture_id,$minutes)

=head3 Arguments

=over

=item $fixture_id

=item $minutes

Comma separated list of minutes of each goal scored by the player in
the fixture.

=back

=cut

sub goals {
  my($self,$f,$s) = @_;
  #FIXME: handle own goals (new stat type?)

  # get
  ! defined($s) && return $self->stat->search({fixture_id=>$f->id,stat_type_id=>1});

  #set
  my %f = (stat_type_id => 1,
	   fixture_id   => $f->id,
	   player_id    => $self->id);
  $self->stat->search(\%f)->delete;

  my @mins = split(/,/,$s);
  for (@mins) {
    $f{value} = $_;
    $self->stat->create(\%f);
  }
}

1;

