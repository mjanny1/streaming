import cx_Oracle
import time 

dsn = cx_Oracle.makedsn(
    'csdb2.csc.villanova.edu', 
    '1521', 
    'orcl'
)
conn = cx_Oracle.connect(
    user='mjanny', 
    password='Sp01192624', 
    dsn=dsn
)
c = conn.cursor()
print ('Season #, Episode #, Episode Name, Length in Seconds, Description')
c.execute("select ep.season_number, ep.season_episode_number, m.name as episode_name, m.length_seconds, m.description from tv_episodes ep join tv_shows ts on ep.tv_show_id = ts.tv_show_id join media m on m.media_id = ep.media_id where ts.name = 'Game of Thrones'")
for row in c: print(row)

season_string = input("Which Season do you want to watch?: ")
season = int(season_string)
if season > 2:
    print ("Not a valid Season number")
    exit (1)

episode_string = input("Which Episode do you want to watch?: ")
episode = int(episode_string)
if episode > 10:
    print ("Not a valid Episode number")
    exit (1)

print ("You are now watching!")
input("Press Ctrl-C to stop watching...")
time_watched = 0
while True:
    try:
        time.sleep(1)
        time_watched = time_watched + 1
    except KeyboardInterrupt:
        break

print ("You watched for " + str(time_watched) + " seconds")

print ("Thanks for Watching!")
conn.close()
