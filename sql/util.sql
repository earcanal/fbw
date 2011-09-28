-- scorers
select p.name,s.value
from player p,stat s,fixture f
where stat_type_id=1
and fixture_id=8
and f.id=s.fixture_id
and p.id=s.player_id

-- top scorers
select p.name,count(value) as goals from stat s,player p 
where stat_type_id=1 and p.id=player_id
group by p.name
order by goals desc;

-- players
select id,concat(number,':',name) from player order by number;

-- teams
select t.name as team,p.number,p.name from player p,team t,team_player tp where fixture_id=1 and t.id=tp.team_id and p.id=tp.player_id order by team,number,name;

-- aka
select number,p.name,a.name as aka from player p,aka a where a.playerid=p.id;
