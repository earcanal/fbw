package FBW::Schema::Result::Fixture;
use parent qw/DBIx::Class::Core/;
__PACKAGE__->table('fixture');
__PACKAGE__->add_columns(qw/id dt weather motm t1 t2/);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_one(bib => 'FBW::Schema::Result::Team',
		     {'foreign.id' => 'self.t1'});
__PACKAGE__->has_one(nonbib => 'FBW::Schema::Result::Team',
		     {'foreign.id' => 'self.t2'});

=pod

$self->goals(t1);
$self->stat(goals);

select count(tp.player_id) from stat s,team_player tp
where s.fixture_id=$self->id
and stat_type_id=1
and s.player_id=tp.player_id
and tp.team_id=$self->t1

=cut

1;
