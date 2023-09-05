
select *
from matches;
select *
from players;
select *
from teams;

/*Question 1: What are the names of the players whose salary is greater than 100,000?*/

select player_name,salary
from players
where salary > '100000'
order by salary desc;

/*Question 2:  What is the team name of the player with player_id = 3?*/

select t.team_name,p.player_id
from teams as t inner join players as p
on t.team_id=p.player_id
where p.player_id='3';

/*Question 3: What is the total number of players in each team?*/

select t.team_name,count(p.player_name) as totalNoofPlayers
from teams as t inner join players as p
on t.team_id=p.team_id
group by t.team_name;

/*Question 4: What is the team name and captain name of the team with team_id = 2?*/

select t.team_name,p.player_name as captain_name,t.team_id
from teams as t inner join players as p
on t.team_id=p.player_id
where t.team_id='2';

/*Question 5: What are the player names and their roles in the team with team_id = 1?*/

select player_name,role as roles
from players
where team_id=1;

/*Question 6: What are the team names and the number of matches they have won?*/

select t.team_name as Teamnames,count(m.winner_id) as Matcheswon
from teams as t inner join  matches as m
on t.team_id=m.winner_id
group by t.team_name
order by Matcheswon desc;

/*Question 7: What is the average salary of players in the teams with country 'USA'?*/

select t.team_name,Round(Avg(p.salary),2) as AvgSalary
from teams as t inner join players as p
on t.team_id=p.team_id
where t.country='USA'
group by t.team_name;

/*Question 8:  Which team won the most matches?*/

select t.team_name,count(m.winner_id) as noOfMatchesWon
from teams as t inner join matches as m
on t.team_id=m.winner_id
group by t.team_name
order by  noOfMatchesWon  desc
limit 1;

/*Question 9: What are the team names and the number of players in each team whose salary is greater than 100,000?*/

select t.team_name ,count(p.player_name) as NoOfplayers
from teams as t inner join players as p
on t.team_id=p.team_id
where p.salary > 100000
group by t.team_name ;

/*Question 10: What is the date and the score of the match with match_id = 3?*/

select match_date as Date,score_team1,score_team2
from matches as m
where match_id=3;
