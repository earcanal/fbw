package FBW::Schema::Result::Team;
use parent qw/DBIx::Class::Core/;
__PACKAGE__->table('team');
__PACKAGE__->add_columns(qw/id name bib fixture_id/);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(player => 'FBW::Schema::Result::TeamPlayer',
		      {'foreign.team_id' => 'self.id'});
__PACKAGE__->many_to_many(players => 'player','player');
1;

