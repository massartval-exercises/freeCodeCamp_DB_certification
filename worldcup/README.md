
## Instructions


Use the file 'worldcup.sql' to scaffold the database, or build it from the requirements below. 
Execute the file 'insert_data.sh' to collect data from 'games.csv' and populate the database. 
The result should be identical to 'worldcup_complete.sql'.

Execute 'queries.sh' to get queries on the database.



## DB tables requirements : 


Table "public.teams"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 team_id | integer               |           | not null | nextval('teams_team_id_seq'::regclass)
 name    | character varying(50) |           | not null | 
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)
    "unique_name" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "games" CONSTRAINT "games_opponent_id_fkey" FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    TABLE "games" CONSTRAINT "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)



Table "public.games"
     Column     |         Type          | Collation | Nullable |                Default                 
----------------+-----------------------+-----------+----------+----------------------------------------
 game_id        | integer               |           | not null | nextval('games_game_id_seq'::regclass)
 year           | integer               |           | not null | 
 round          | character varying(30) |           | not null | 
 winner_id      | integer               |           | not null | 
 opponent_id    | integer               |           | not null | 
 winner_goals   | integer               |           | not null | 
 opponent_goals | integer               |           | not null | 
Indexes:
    "games_pkey" PRIMARY KEY, btree (game_id)
Foreign-key constraints:
    "games_opponent_id_fkey" FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)