package FBW::Schema::Result::TeamPlayer;
use parent qw/DBIx::Class::Core/;
__PACKAGE__->table('team_player');
__PACKAGE__->add_columns(qw/team_id player_id/);
__PACKAGE__->set_primary_key(qw/team_id player_id/);
__PACKAGE__->belongs_to(team => 'FBW::Schema::Result::Team',
			{'foreign.id' => 'self.team_id'});
__PACKAGE__->belongs_to(player => 'FBW::Schema::Result::Player',
			{'foreign.id' => 'self.player_id'});
1;
